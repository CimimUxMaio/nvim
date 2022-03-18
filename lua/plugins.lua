
local Plug = vim.fn['plug#']



vim.call('plug#begin', '~/.config/nvim/autoload/plugged')


Plug 'vimwiki/vimwiki'

local fzf_opts = { dir = "~/.fzf" }
fzf_opts["do"] = "./install --all"
Plug ('junegunn/fzf', fzf_opts)

Plug 'preservim/nerdtree'

Plug 'rafi/awesome-vim-colorschemes'

-- Plug ('Valloric/YouCompleteMe', { do = './install.py' })

Plug 'tpope/vim-fugitive'


vim.call('plug#end')


require("plugins.nerdtree")
require("plugins.fzf")
require("plugins.colorschemes")
