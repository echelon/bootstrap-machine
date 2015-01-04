#!/bin/bash
# Installs the packages listed in the `packages.txt` file.
# Must run as root.

# Join array
# From http://stackoverflow.com/a/17841619
# Usage: 
#   join , a "b c" d #a,b c,d
#   join / var local tmp #var/local/tmp
#   join , "${FOO[@]}" #a,b,c
function join { local IFS="$1"; shift; echo "$*"; }

declare -a CANDIDATE_PACKAGES=()
declare -a INVALID_PACKAGES=()
declare -a VALID_PACKAGES=()

if [[ "$EUID" -ne 0 ]]; then
  >&2 echo 'You must be root to install packages. Run again with `sudo`.'
  exit
fi

# Read packages from file `packages.txt`.
function read_packages() {
  declare -a packages=()
  while read -r line
  do
    if [[ "$line" == \#* || -z "$line" ]]; then
      continue
    else
      packages+=("$line")
    fi
  done < "packages.txt"

  # Sort packages; store in global.
  readarray -t CANDIDATE_PACKAGES < \
    <(for a in "${packages[@]}"; do echo "$a"; done | sort)
}

# Add only packages that exist.
# Reads from `$CANDIDATE_PACKAGES` and stores in `$INSTALL_PACKAGES`.
function filter_invalid_packages() {
  for package in "${CANDIDATE_PACKAGES[@]}"
  do
    add_package_if_exists "$package"
  done
}

# Check if package exists, then add it to `$VALID_PACKAGES`.
function add_package_if_exists() {
  declare -r package_name="$1"
  declare -r out=`apt-cache show $package_name 2> /dev/null`

  if [[ "$?" -ne 0 || -z "$out" ]]; then
    echo "There was an error for \`$package_name\`."
    INVALID_PACKAGES+=("$package_name")
    return 1
  else
    VALID_PACKAGES+=("$package_name")
    return 0
  fi
}

# Install packages.
function install_packages() {
  declare -r install_packages=$(join " " ${VALID_PACKAGES[@]})
  apt-get install $install_packages
}

# Print fancy title.
function print_title() {
  declare -r title="$1"
  declare -r bold=`tput bold`
  declare -r green_fg=`tput setaf 2`
  declare -r black_bg=`tput setab 0`
  declare -r normal=`tput sgr0`
  printf "\n${bold}${green_fg}${black_bg}${title^^}${normal}\n"
}

print_title 'Updating package database'

apt-get update
read_packages

print_title 'Candidate Package List:'
echo ${CANDIDATE_PACKAGES[@]}

filter_invalid_packages

print_title 'Invalid Packages:'
echo ${INVALID_PACKAGES[@]}

print_title 'Valid Packages:'
echo ${VALID_PACKAGES[@]}

print_title 'Installing packages...'

install_packages

