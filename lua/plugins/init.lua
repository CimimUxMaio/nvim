local Plug = vim.fn["plug#"]



local pluggedPath = vim.fn.stdpath("data") .. "/plugged/"

vim.call("plug#begin", pluggedPath)


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

Plug "lewis6991/gitsigns.nvim"

Plug "goolord/alpha-nvim"

Plug "nvim-lua/plenary.nvim"

Plug "Shatur/neovim-session-manager"

Plug "stevearc/dressing.nvim"

Plug "norcalli/nvim-colorizer.lua"

Plug "windwp/nvim-ts-autotag"

Plug "nvim-treesitter/nvim-treesitter-refactor"

Plug "kevinhwang91/nvim-hlslens"

Plug "petertriho/nvim-scrollbar"


vim.call("plug#end")



require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.dressing")
require("plugins.toggleterm")
require("plugins.lualine")
require("plugins.treesitter")
require("plugins.barbar")
require("plugins.alpha")
require("plugins.notify")
require("plugins.nvim_colorizer")
require("plugins.gitsigns")
require("plugins.comments")
require("plugins.lsp")
require("plugins.completion")
require("plugins.autopairs")
require("plugins.session_manager")
require("plugins.colorschemes")
require("plugins.hlslens")
require("plugins.scrollbar")


