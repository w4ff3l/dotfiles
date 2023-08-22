local status_ok, mason = pcall(require, 'mason')
if not status_ok then
    print('Error loading mason')
    return
end

local status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok then
    print('Error loading mason')
    return
end

mason.setup()
mason_lspconfig.setup()
