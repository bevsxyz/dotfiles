# Dotfiles of [bevsxyz](https://bevs.xyz/)

This repo hosts my personal dotfiles. I use the tool [Chezmoi](https://www.chezmoi.io/) to manage them in a sane way.

To start off, you need to create a config file by running `chezmoi edit-config`. Then a basic config as follows:

```toml
[data]
	email = "myself@my.com"
	name = "Bevan Stanely"
	spotify_id = "Mail id for spotify" # I use separate mail id so
[git]
	autoCommit = true
	autoPush = true
```

You may use the following code in commandline to checkout and initialize this repo. `--ssh` flag will checkout with ssh.

```bash
chezmoi init --apply bevzxyz
```

There you just replicated my dotfiles for your credentials!
