return {
    {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    config = function ()
        require'mason'.setup()
    end
    },
    {
    'williamboman/mason-lspconfig.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim'
    },
    config = function ()
        require'mason-lspconfig'.setup()
    end
    }
}
