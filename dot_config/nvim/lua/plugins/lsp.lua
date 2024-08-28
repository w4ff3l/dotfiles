local function setupLanguages()
	local lspconfig = require('lspconfig')
	lspconfig['angularls'].setup({})
	lspconfig['bashls'].setup({})
	lspconfig['cssls'].setup({})
	lspconfig['gopls'].setup({
		filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
	})
	lspconfig['gradle_ls'].setup({})
	lspconfig['html'].setup({})
	lspconfig['jsonls'].setup({})
	lspconfig['lua_ls'].setup(
		{
			Lua = {
				workspace = {
					library = {
						"./deps"
					}
				},
				diagnostics = {
					globals = { 'vim' }
				}
			}
		}
	)
end

local function registerAutocommand()
	vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('UserLspConfig', {}),
		callback = function(ev)
			vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

			local client = vim.lsp.get_client_by_id(ev.data.client_id)
			client.server_capabilities.semanticTokensProvider = nil

			local opts = { buffer = ev.buf }
			vim.keymap.set('n', '<space>oi', "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
			vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
		end,
	})
end

return {
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
			registerAutocommand()
			setupLanguages()
		end,
	},
	{
		'ray-x/go.nvim',
		config = function()
			require 'go'.setup()
		end,
	},
	{
		{
			'mfussenegger/nvim-jdtls',
		}
	}
}
