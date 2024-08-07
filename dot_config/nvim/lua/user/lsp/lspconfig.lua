-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Disable lsp highlighting
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>oi', "<Cmd>lua require'jdtls'.organize_imports()<CR>")
        vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
        -- already bound by lspsaga:
        -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    end,
})
