
local Plug = vim.fn["plug#"]



vim.call("plug#begin", "~/.config/nvim/autoload/plugged")


Plug "vimwiki/vimwiki"

local fzf_opts = { dir = "~/.fzf" }
fzf_opts["do"] = "./install --all"
Plug ("junegunn/fzf", fzf_opts)

Plug "preservim/nerdtree"

Plug "rafi/awesome-vim-colorschemes"

Plug "hrsh7th/nvim-cmp"
Plug "hrsh7th/cmp-buffer"
Plug "hrsh7th/cmp-path"
Plug "hrsh7th/cmp-nvim-lsp"

Plug "L3MON4D3/LuaSnip"
Plug "saadparwaiz1/cmp_luasnip"

Plug "neovim/nvim-lspconfig"
Plug "williamboman/nvim-lsp-installer"

Plug "akinsho/toggleterm.nvim"


vim.call("plug#end")


require("plugins.nerdtree")
require("plugins.fzf")
require("plugins.toggleterm")
require("plugins.lsp")
require("plugins.completion")
require("plugins.colorschemes")


