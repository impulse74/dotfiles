# Dotfiles Repository

This repository contains my personal dotfiles. Using a bare Git repository, I can easily manage and sync my settings across multiple machines.

## Installation

### Clone the Repository
To set up these dotfiles on a new machine, run:
```bash
git clone --bare https://github.com/impulse74/dotfiles.git $HOME/.dotfiles
```

### Create an Alias
Since this is a bare repository, we need to define an alias to interact with it:
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```
Add this line to your `~/.bashrc` or `~/.zshrc` to make it permanent:
```bash
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'" >> ~/.bashrc
source ~/.bashrc
```

### Checkout the Files
```bash
dotfiles checkout
```
If you see errors about existing files, back them up and re-run the command:
```bash
mkdir -p ~/.dotfiles-backup
rsync -av ~/.bashrc ~/.zshrc ~/.vimrc ~/.config ~/.dotfiles-backup/
dotfiles checkout
```

### Set Git to Ignore Untracked Files
```bash
dotfiles config --local status.showUntrackedFiles no
```

## Usage

### Add New Dotfiles
To add a new configuration file to the repo, use:
```bash
dotfiles add ~/.vimrc ~/.bashrc ~/.config/nvim/init.vim
```
Then commit and push the changes:
```bash
dotfiles commit -m "Added new config files"
dotfiles push origin master
```

### Pull Changes from Remote
```bash
dotfiles pull origin master --rebase
```

### Backup & Sync Dotfiles
Whenever you make changes, commit and push them to GitHub:
```bash
dotfiles add -u
dotfiles commit -m "Updated configs"
dotfiles push origin master
```

## License
These dotfiles are for personal use. Feel free to fork and modify them for your own setup!

