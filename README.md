Bootstrap-Machine
=================
Configures a new Linux installation as I like it. 

For now this doesn't do much, and I imagine it'll remain hackish. I'm
writing this as I'm performing a few complete reinstallations. For now this
just does Ubuntu, but I might add Arch support soon.

The aim is to be idempotent, so that it could theoretically be run even on
older installations.

Installation
------------

1. [Generate SSH keys](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)
   ```bash
   ssh-keygen -t ed25519 -C "echelon@gmail.com"
   ```

2. [Add SSH keys to Github](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)
   which as of this writing lives under ***User** > **Settings** > **SSH & GPG Keys***

3. Add `.ssh/id_ed25519.pub`

4. `sudo apt-get install git`

5. `git clone git@github.com:echelon/bootstrap-machine.git`

6. Run the desired install scripts. 

Features
--------
- Installs packages in `packages.txt`.
- (Nothing else yet)

TODO
----
- Pull down and build certain things from source.
- Download and configure Chromium and Firefox extensions, settings, etc.
- Download and install dotfiles.

License
-------
I don't care (c) 2015 whatever.

