local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    print('Error loading lspconfig for bash')
    return
end

lspconfig['bashls'].setup({})

