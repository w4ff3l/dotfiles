return {
    'mikesmithgh/kitty-scrollback.nvim',
    enabled = true,
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
    event = { 'User KittyScrollbackLaunch' },
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
