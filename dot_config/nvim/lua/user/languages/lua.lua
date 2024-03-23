local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    print('Error loading lspconfig for lua')
    return
end

local config = {
    settings = {
        Lua = {
            workspace = {
                library = {
                    "./deps"
                }
            },
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

lspconfig['lua_ls'].setup(config)
