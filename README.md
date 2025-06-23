# My Dotfiles

These are my configuration files I use on my main Linux machine.
It is running Rocky Linux 9.

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

