local mason_status_ok, mason = pcall(require, 'mason')
if not mason_status_ok then
    print('Error loading mason...')
    return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_status_ok then
    print('Error loading mason')
    return
end

mason.setup()
mason_lspconfig.setup()
