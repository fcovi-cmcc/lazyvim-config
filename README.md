# Installing Neovim and required pkgs on older architecture HPC

## 1) Install [Neovim](https://neovim.io/)
```bash
# create /bin folder if it doesn't exist
mkdir -p ~/bin
cd ~/bin

# download neovim Linux 64-bit tarball
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar xzf nvim-linux-x86_64.tar.gz
# rename for convenience
mv nvim-linux-x86_64 nvim-dist

# add nvim-dist to PATHS in .bash_profile 
export PATH="$HOME/bin/nvim-dist/bin:$PATH"
source ~/.bash_profile
```

## 2) Install [LazyVim](https://www.lazyvim.org/)
```bash
# clone github starter template repo
git clone https://github.com/LazyVim/starter ~/.config/nvim

# remove the .git folder (if you want to start your own customization repo)
rm -rf ~/.config/nvim/.git

# run Neovim, this will start the configuration process
nvim

# disable Treesitter autoinstall (we will install LSP manually)
# create the following file 
nvim ~/.config/nvim/lua/plugins/treesitter.lua
# Add the following lines to the empty file
return {
  "nvim-treesitter/nvim-treesitter",
  enabled = false,
  opts = {
    auto_install = false,
  },
}
# save and exit the file with :wq
```

## 3) Install [node.js](https://nodejs.org/en)
This is necessary 
