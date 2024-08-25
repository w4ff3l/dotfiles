local status_lspconfig, lspconfig = pcall(require, 'lspconfig')
if not status_lspconfig then
    print('Error loading lspconfig for go')
    return
end

lspconfig.gopls.setup({
    filetypes = {'go', 'gomod', 'gowork', 'gotmpl'},
})

local status_go, go = pcall(require, 'go')
if not status_go then
    print('Error loading go')
    return
end

go.setup()

