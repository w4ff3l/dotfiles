local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- theme and ui
Plug 'morhetz/gruvbox'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug('rrethy/vim-hexokinase', { ['do'] = vim.fn['make hexokinase'] })
Plug 'MunifTanjim/nui.nvim' -- UI component library needed for other ui plugins

-- utility
Plug 'nvim-lua/plenary.nvim' -- Common lua modules other plugins use
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'folke/which-key.nvim'
-- Plug 'vimwiki/vimwiki' -- currently not needed

-- Versioning
Plug 'tpope/vim-fugitive'

-- File Navigation
Plug 'phaazon/hop.nvim'
Plug 'justinmk/vim-sneak'
Plug 'karb94/neoscroll.nvim'

-- File Exploration
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'

-- lsp
Plug('williamboman/mason.nvim', { ['do'] = vim.fn[':MasonUpdate'] }) -- simple to use language server installer
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'                                         -- enable LSP
Plug 'jose-elias-alvarez/null-ls.nvim'                               -- formatters and linters

-- Syntax
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn[':TSUpdate'] })

-- snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

-- cmp plugins
Plug 'hrsh7th/nvim-cmp'         -- The completion plugin
Plug 'hrsh7th/cmp-buffer'       -- buffer completion
Plug 'hrsh7th/cmp-path'         -- path completion
Plug 'hrsh7th/cmp-cmdline'      -- cmdline completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip' -- snippet completion

vim.call('plug#end')
