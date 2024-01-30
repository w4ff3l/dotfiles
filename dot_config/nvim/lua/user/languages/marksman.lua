local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    print('Error loading lspconfig for typescript')
    return
end

lspconfig['marksman'].setup({})
