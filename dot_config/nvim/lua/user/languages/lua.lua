local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    print('Error loading lspconfig for lua')
    return
end

lspconfig['lua_ls'].setup({ settings = { Lua = { diagnostics = { globals = { 'vim' } } } } })
