# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following on your system:

### Homebrew (Or Equivalent package manager)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Git

```bash
brew install git
```

### Stow

```bash
brew install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```bash
git clone https://github.com/BenjuhminStewart/dotfiles.git
cd dotfiles
```

then use GNU Stow to create symlinks

```bash
stow .
```
