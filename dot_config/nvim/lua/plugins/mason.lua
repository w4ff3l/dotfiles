return {
    {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        config = function()
            require 'mason'.setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'williamboman/mason.nvim'
        },
        config = function()
            require 'mason-lspconfig'.setup({
                ensure_installed = {
                    "jsonls",
                    "gradle_ls",
                    "angularls",
                    "bashls",
                    "cssls",
                    "sqlls",
                    "lua_ls",
                    "jdtls",
                }
            })
        end
    }
}
