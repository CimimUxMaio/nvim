local Plug = vim.fn["plug#"]



vim.call("plug#begin", "~/.config/nvim/autoload/plugged")


Plug "vimwiki/vimwiki"

Plug "nvim-lua/plenary.nvim"  -- required by 'telescope'
Plug "nvim-telescope/telescope.nvim"


Plug "kyazdani42/nvim-web-devicons"
Plug "kyazdani42/nvim-tree.lua"

Plug "rafi/awesome-vim-colorschemes"
Plug "lunarvim/darkplus.nvim"

Plug "hrsh7th/nvim-cmp"
Plug "hrsh7th/cmp-buffer"
Plug "hrsh7th/cmp-path"
Plug "hrsh7th/cmp-nvim-lsp"

Plug "L3MON4D3/LuaSnip"
Plug "saadparwaiz1/cmp_luasnip"

Plug "neovim/nvim-lspconfig"
Plug "williamboman/nvim-lsp-installer"

Plug "akinsho/toggleterm.nvim"

Plug "nvim-lualine/lualine.nvim"

Plug "windwp/nvim-autopairs"

Plug ("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

Plug "JoosepAlviste/nvim-ts-context-commentstring"
Plug "numToStr/Comment.nvim"

Plug "romgrk/barbar.nvim"

Plug "rcarriga/nvim-notify"


vim.call("plug#end")



require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.toggleterm")
require("plugins.lualine")
require("plugins.treesitter")
require("plugins.barbar")
require("plugins.notify")
require("plugins.comments")
require("plugins.lsp")
require("plugins.completion")
require("plugins.autopairs")
require("plugins.colorschemes")


