return {
    'mikesmithgh/kitty-scrollback.nvim',
    enabled = true,
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
    event = { 'User KittyScrollbackLaunch' },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^5.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
        require('kitty-scrollback').setup({
            status_window = {
                autoclose = true,
            },
            paste_window = {
                yank_register = 'unnamed',
                yank_register_enabled = true,
            },
        })
    end,
}
