local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- theme and ui
Plug 'ellisonleao/gruvbox.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug('rrethy/vim-hexokinase', { ['do'] = vim.fn['make hexokinase'] })
Plug 'MunifTanjim/nui.nvim' -- UI component library needed for other ui plugins
Plug 'nvimdev/lspsaga.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'goolord/alpha-nvim'
Plug 'j-hui/fidget.nvim'

-- utility
Plug 'nvim-lua/plenary.nvim' -- Common lua modules other plugins use
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'folke/which-key.nvim'
Plug 'folke/trouble.nvim'

-- Versioning
Plug 'tpope/vim-fugitive'

-- File Manipulation
Plug 'kylechui/nvim-surround'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'windwp/nvim-ts-autotag'

-- File Navigation
Plug 'smoka7/hop.nvim'
Plug 'justinmk/vim-sneak'
Plug 'karb94/neoscroll.nvim'

-- File Exploration
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.4' })
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'

-- Git
Plug 'lewis6991/gitsigns.nvim'

-- lsp
Plug('williamboman/mason.nvim', { ['do'] = vim.fn[':MasonUpdate'] }) -- simple to use language server installer
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'                                         -- enable LSP
Plug 'nvimtools/none-ls.nvim'
Plug 'mfussenegger/nvim-jdtls'

-- Syntax
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn[':TSUpdate'] })

-- cmp plugins
Plug 'hrsh7th/nvim-cmp'    -- The completion plugin
Plug 'hrsh7th/cmp-buffer'  -- buffer completion
Plug 'hrsh7th/cmp-path'    -- path completion
Plug 'hrsh7th/cmp-cmdline' -- cmdline completion
Plug 'hrsh7th/cmp-nvim-lsp'

-- snippets
Plug('L3MON4D3/LuaSnip', { tag = 'v2.1.0', ['do'] = 'make install_jsregexp' })
Plug 'saadparwaiz1/cmp_luasnip' -- snippet completion
Plug 'rafamadriz/friendly-snippets'

-- languages
Plug 'saecki/crates.nvim'
Plug('mrcjkb/rustaceanvim', { tag = '3.6.0', ['for'] = 'rust' })

vim.call('plug#end')
