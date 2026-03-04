# My Dotfiles

These are my configuration files I use on my main Linux machine.
It is running Rocky Linux 9.

## Prerequisits

### WSL (Ubuntu 22.04. LTS)
Packages needed for the neovim setup

```sh
sudo apt install stow
sudo apt install unzip
sudo apt install python3.12-venv
sudo apt install npm
sudo npm install tree-sitter-cli
```

Requirements for clipboard usage
```sh
sudo apt install wl-clipboard
curl -sLo /tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/latest/download/win32yank-x64.zip
unzip /tmp/win32yank.zip -d /tmp
sudo mv /tmp/win32yank.exe /usr/local/bin/
sudo chmod +x /usr/local/bin/win32yank.exe
```

## Usage

Clone the repository:

```sh
git clone https://github.com/t-hul/dotfiles.git ~/.dotfiles
```

Link the files to your home directory using GNU Stow:

```sh
stow bash
stow nvim
stow tmux
```

or run `./install.sh` that does this for you.

## Contents

- `.bashrc`
- `.config/nvim`
    >neovim configuration based on NvChad and some additional plugins
- `.config/tmux`
    >configuration in `tmux.conf`, plugins managed by `tpm`


## Notes

- A brief guide I followed to create this dotfiles directory can be found in `dotfiles-with-stow.md`. It was created using ChatGPT.

