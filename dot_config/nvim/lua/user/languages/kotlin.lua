local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    print('Error loading lspconfig for kotlin')
    return
end

-- lspconfig['kotlin_language_server'].setup({})
-- vim.lsp.start({
--     name = 'kotlin_language_server',
--     cmd = { '/home/w4ff3l/workspace/kotlin-language-server/server/build/install/server/bin/kotlin-language-server' },
--     root_dir = vim.fs.dirname(
--         vim.fs.find({ 'settings.gradle.kts' }, { upward = true })[1]
--     ),
-- })

