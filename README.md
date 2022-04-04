# My Neovim configuration

Neovim installation:
- _Ubuntu:_
```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```
- _Windows:_
    - `choco install neovim` (release)
    - `choco install neovim --pre` (pre-release)


For copy and paste to work correctly:
- _Ubuntu:_ `sudo apt install xsel`
    - See `:healthcheck`


Install 'Hack Nerd Font' for icons to display correctly:
[Nerd Fonts](https://www.nerdfonts.com/font-downloads)
- Alternative (may take a while):
```
git clone https://github.com/ryanoasis/nerd-fonts.git
./install Hack
```

Install 'lazygit':
- _Ubuntu:_
```
sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install lazygit
```
- _Windows:_ `choco install lazygit`
- _Alternative:_ [Binaries](https://github.com/jesseduffield/lazygit/releases)


Install vim-plug:
- _Ubuntu:_
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
- _Windows:_
```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

Install 'ripgrep':
- Ubuntu:
```
sudo apt-get ripgrep
```


Other requirements:
- _Python 3_ and _pip_
    - `pip install neovim`
- _node_ and _npm_
    - `npm install -g neovim`
- Use `:checkhealth` to check for more missing dependencies


##### For Windows:
- `tree-sitter` will complain of not finding a C compiler
    - _Solution:_ `choco install mingw`

- May need to update the PATH env variable manualy



