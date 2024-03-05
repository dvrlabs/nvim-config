# nvim-config 

### Introduction

My nvim configuration. 
Reconfigured from [kickstart-modular](https://github.com/dam9000/kickstart-modular.nvim)

#### First Steps

Backup or delete your current neovim files..

Option 1. Backup

```
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

Option 2. Delete

```
sudo rm -r ~/.config/nvim 
sudo rm -r ~/.local/share/nvim 
sudo rm -r ~/.local/state/nvim 
sudo rm -r ~/.cache/nvim 
```

Option 3. Trash

```
trash-put ~/.config/nvim 
trash-put ~/.local/share/nvim 
trash-put ~/.local/state/nvim 
trash-put ~/.cache/nvim 
```

#### Clone the repo

```
git clone https://github.com/dvrlabs/nvim-config ~/.config/nvim
```

### Setup

#### PYLSP completions

To get proper completions with python (pylsp) in neovim

edit: $HOME/.local/share/nvim/mason/packages/python-lsp-server/venv/pyvenv.cfg

set `include-system-site-packages = true`

### Design Intent
- Organized.
- Relatively simple.
