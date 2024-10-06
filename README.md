# Hyprdotfiles

This repository contains my personal dotfiles, meticulously crafted for a POSIX-compliant environment.

## Features

* **Window Manager:** Hyprland, powered by prasanthrangan's [Hyprdots](https://github.com/prasanthrangan/hyprdots) for a truly captivating desktop experience..
* **Text Editor:** [Neovim](https://neovim.io/) / [Neovide](https://github.com/neovide/neovide) 🎨, elevated by [NChad](https://nvchad.com/) 🚀 for a **visually stunning**, feature-rich, and streamlined experience.
* **Text Editor:** Neovim/Neovide, enhanced with [NvChad](https://nvchad.com/) for <span style="color: #FFA500;">Gorgeous UI</span> with a focus on aesthetics and functionality.
* **Shell:** Zsh, providing a powerful and customizable command-line interface. Supercharged by [Zinit](https://github.com/zdharma-continuum/zinit) for effortless plugin management.
* **PDF Viewer:** Zathura, a lightweight and keyboard-driven PDF viewer.
* **Alternative Window Manager:** i3, a reliable fallback for Xorg-based sessions when needed.

## Screenshots

![main](assets/wayland-main.png)

## Installation

1. **Clone the repository:** into any folder of your choice. Doesn't need to be inside `~/.config`.
   ```bash
   git clone git@github.com:arinal/dotfiles.git
   ```
2. To use non the hyprland folders, just create a symbolic link into for any application you want to use. For example:
   ```bash
   ln -s /path/to/dotfiles/nvim ~/.config/nvim
   ln -s /path/to/dotfiles/zathura ~/.config/zathura
   ln -s /path/to/dotfiles/zsh ~/.config/zsh
   ln -s /path/to/dotfiles/i3 ~/.config/i3
   ```
3. For Hyprland setup:
   - Install [Hyprdots](https://github.com/prasanthrangan/hyprdots) by following the instructions in its repository. This will also install Hyprland. Ideally, this is executed after a fresh ArchLinux installation.
   - You can find inspiration and customize it to your liking from this repository. 
