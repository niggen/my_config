# Neovim from scratch But I change a little bit :V

**Update** Yeah basicly this man change Lunar neovim and I change it again funny right?: [nvim-basic-ide](https://github.com/LunarVim/nvim-basic-ide)

**Will be more update in the future**  All packages are pinned in `master` so it will remain stable. Branches will be updated eventually (currently broken from branch #7 onwards. Hint: Good opportunity for pull requests!).

Btw you guy can check the original creater of Neovim From Scratch *recommend* [playlist](https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ). 

## Try out this config

This config requires [Neovim v0.8.0](https://github.com/neovim/neovim/releases). Please [upgrade](#upgrade-to-neovim-v080) if you're on an earlier version of the editor.

Clone the repository into the correct location (make a backup your current `nvim` directory if you want to keep it).

```
git clone https://github.com/niggen/my_config.git ~/.config/nvim
```

Run `nvim` in your terminal and wait for the plugins to be installed. You will notice treesitter pulling in a bunch of language parsers the next time you open Neovim.

**NOTE** [Mason](https://github.com/williamboman/mason.nvim) is used to install and manage LSP servers, DAP servers, linters, and formatters via the `:Mason` command.

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```
  sudo apt install xsel
  ```

- On Arch Linux

  ```
  sudo pacman -S xsel
  ```
  
- Wayland users

  [wl-clipboard](https://github.com/bugaevc/wl-clipboard)


Next we need to install python support (node is optional)

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

  ```
  npm i -g neovim
  ```
---
### Require Neovim >= 8 and Python3
