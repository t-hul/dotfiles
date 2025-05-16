# 🛠️ Dotfiles Management with Git and Stow

This guide explains how to manage your dotfiles using a Git repository located in `~/dotfiles` and [GNU Stow](https://www.gnu.org/software/stow/) to create symlinks.

---

## 🧰 Prerequisites

- **Git**: to manage your dotfiles.
- **Stow**: to manage symlinks easily.

### Install Stow

```bash
# Debian/Ubuntu
sudo apt install stow

# Arch Linux
sudo pacman -S stow

# macOS (Homebrew)
brew install stow
```

---

## 📁 Step-by-Step Setup

### 1. Create a `~/dotfiles` Git Repository

```bash
mkdir -p ~/dotfiles
cd ~/dotfiles
git init
```

This directory will contain subdirectories for each set of configuration files (e.g., `zsh/`, `nvim/`, etc.).

---

### 2. Organize Config Files in Subdirectories

Each subdirectory should mirror the file's path relative to `$HOME`.

#### Example: `.zshrc`

```bash
mkdir -p ~/dotfiles/zsh
mv ~/.zshrc ~/dotfiles/zsh/.zshrc
```

#### Example: Neovim config (`~/.config/nvim`)

```bash
mkdir -p ~/dotfiles/nvim/.config/nvim
mv ~/.config/nvim/* ~/dotfiles/nvim/.config/nvim/
```

📦 **Tip**: Place each file as it would appear in `$HOME`.

---

### 3. Use Stow to Create Symlinks

Run Stow from within the `~/dotfiles` directory:

```bash
cd ~/dotfiles
stow zsh
stow nvim
```

This will create symlinks like:

- `~/dotfiles/zsh/.zshrc` → `~/.zshrc`
- `~/dotfiles/nvim/.config/nvim` → `~/.config/nvim`

🧠 Stow automatically links files relative to `~/` by default.

---

### 4. Add to Git and Push

```bash
cd ~/dotfiles
git add .
git commit -m "Initial dotfiles setup"
git remote add origin <your-git-repo-url>
git push -u origin main
```

---

## 📦 Recommended Directory Structure

```
~/dotfiles/
├── zsh/
│   └── .zshrc
├── nvim/
│   └── .config/
│       └── nvim/
│           ├── init.lua
│           └── ...
├── tmux/
│   └── .tmux.conf
└── git/
    └── .gitconfig
```

---

## 🔁 Reinstalling on a New Machine

1. Clone the repo:

```bash
git clone https://github.com/youruser/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

2. Install `stow` (if necessary).

3. Stow your configs:

```bash
stow zsh nvim tmux git
```

---

## 🧹 Unstowing (Removing Symlinks)

```bash
cd ~/dotfiles
stow -D zsh
```

---

## ✅ Tips

- Use `stow -nv <package>` to preview what would be linked.
- Avoid stowing the entire repo at once.
- Maintain accurate directory structures for deeply nested files (e.g., `.config/nvim`).

---

## 🎉 Done!

Your dotfiles are now version-controlled, portable, and easy to manage using symlinks with Stow.
