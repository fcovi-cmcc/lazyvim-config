# Installing Neovim and required pkgs on older architecture HPC

## 1) Install [Neovim](https://neovim.io/)
```bash
# create /bin folder if it doesn't exist, all pkgs will be installed here
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
This is necessary for installing LSP language servers. \
Download the latest version (e.g. [here](https://nodejs.org/dist/v24.15.0/node-v24.15.0-linux-x64.tar.xz)) and move it to the `/bin` folder.
```bash
cd ~/bin
tar -xJf node-v***YOUR-VERSION***.x.x-linux-x86_64.tar.xz
# rename for convenience
mv node-v***YOUR-VERSION***.x.x-linux-x86_64 node-dist

# update .bash_profile with
export PATH="$HOME/bin/node-dist/bin:$PATH"
source ~/.bash_profile

# set npm to ignore SSL errors
npm config set strict-ssl false
```

## 4) Install LSP (Language Server Protocol)
Open `nvim` and access Mason by typing `:Mason`. Install the desired LSP, recommended:
- Bash: `bash-language-server`
- Python: `pyright`
- Fortran: `fortls`
- C: `clangd`
- YAML: `yaml`
- JSON: `json-lsp`

## 5) Install [FD](https://github.com/sharkdp/fd) for fast find
```bash
cd ~/bin

# download the latest musl version (compatible with almost all HPCs)
curl -LO https://github.com/sharkdp/fd/releases/download/v10.2.0/fd-v10.2.0-x86_64-unknown-linux-musl.tar.gz
tar -xvf fd-v10.2.0-x86_64-unknown-linux-musl.tar.gz

# move the binary to your bin folder and cleanupp
mv fd-v10.2.0-x86_64-unknown-linux-musl/fd ~/bin/fd
rm -rf fd-v10.2.0-x86_64-unknown-linux-musl*

# update .bash_profile with 
export PATH="$HOME/bin:$PATH
source ~/.bash_profile
```

## 6) Install [fzf](https://junegunn.github.io/fzf/), an even faster search engine
```bash
cd ~/bin

# git clone repo into bin folder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/bin/fzf
# install and follow procedure (say YES)
 ~/bin/fzf/install

# download ripgrep (check version number)
wget https://github.com/BurntSushi/ripgrep/releases/download/15.1.0/ripgrep-15.1.0-x86_64-unknown-linux-musl.tar.gz
tar -xvf ripgrep-*.tar.gz
cp ripgrep-*/rg ~/bin/   

# restart shell
source ~/.bash_profile

# Open Neovim.
# Type :LazyExtras.
# Find editor.fzf and press x.
# Restart Neovim.
```

## 7) Install [LazyGit](https://lazygit.dev/), a git GUI inside LazyVim
```bash
cd ~/bin

# donwload lazygit
wget https://github.com/jesseduffield/lazygit/releases/download/v0.42.0/lazygit_0.42.0_Linux_x86_64.tar.gz
tar -xf lazygit_0.42.0_Linux_x86_64.tar.gz
rm -rf fd-v10.2.0-x86_64-unknown-linux-musl*

# update .bash_profile with (this should be already in your paths from above)
export PATH="$HOME/bin:$PATH
source ~/.bash_profile
```

## 8) CLIPBOARD settings
Make sure `nvim` can copy to your system `clipboard`. Requires using a terminal supporting `OSC 52` (e.g. iTerm2, Kitty, ...). \
Copy the following lines to `~/.config/nvim/lua/config/options.lua`:

```lua
vim.opt.clipboard = "unnamedplus"

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}

```



