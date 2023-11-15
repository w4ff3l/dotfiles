local status_ok, jdtls = pcall(require, 'jdtls')
if not status_ok then
    print('Error loading lspconfig for Java')
    return
end

local config = {
    cmd = { '/home/w4ff3l/.local/share/nvim/mason/packages/jdtls/bin/jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}

jdtls.start_or_attach(config)
