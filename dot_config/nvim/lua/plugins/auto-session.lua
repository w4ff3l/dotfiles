return {
    'rmagatti/auto-session',
    lazy = false,
    dependencies = {
        'nvim-telescope/telescope.nvim',     -- Only needed if you want to use session lens
    },
    opts = {
        auto_session_enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= 'true',
        cwd_change_handling = {
            restore_upcoming_session = true,       -- Disabled by default, set to true to enable
            pre_cwd_changed_hook = nil,            -- already the default, no need to specify like this, only here as an example
            post_cwd_changed_hook = function()     -- example refreshing the lualine status line _after_ the cwd changes
                require("lualine").refresh()       -- refresh lualine so the new session name is displayed in the status bar
            end,
        },
    }
}
