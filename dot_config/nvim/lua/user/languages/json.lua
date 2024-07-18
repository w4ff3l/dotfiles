local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    print('Error loading lspconfig for json')
    return
end

lspconfig['jsonls'].setup({})
