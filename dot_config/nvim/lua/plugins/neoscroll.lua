return {
    "karb94/neoscroll.nvim",
    config = function()
        local neoscroll_status_ok, neoscroll = pcall(require, 'neoscroll')
        if not neoscroll_status_ok then
            print('Error loading neoscroll...')
            return
        end

        local options = {
            mappings = {},
            hide_cursor = true,          -- Hide cursor while scrolling
            stop_eof = true,             -- Stop at <EOF> when scrolling downwards
            respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
            easing_function = nil,       -- Default easing function
            pre_hook = nil,              -- Function to run before the scrolling animation starts
            post_hook = nil,             -- Function to run after the scrolling animation ends
            performance_mode = false,    -- Disable "Performance Mode" on all buffers.
        }

        neoscroll.setup(options)

        local keymap = {
            ['<C-u>'] = function() neoscroll.ctrl_u({ duration = 180 }) end,
            ['<C-d>'] = function() neoscroll.ctrl_d({ duration = 180 }) end,
            ['<C-b>'] = function() neoscroll.ctrl_b({ duration = 200 }) end,
            ['<C-f>'] = function() neoscroll.ctrl_f({ duration = 200 }) end,
        }

        local modes = { 'n', 'v', 'x' }
        for key, func in pairs(keymap) do
            vim.keymap.set(modes, key, func)
        end
    end
}
