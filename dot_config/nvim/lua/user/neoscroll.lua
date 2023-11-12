local status_ok, neoscroll = pcall(require, 'neoscroll')
if not status_ok then
    return
end

local status_config, neoscroll_config = pcall(require, 'neoscroll.config')
if not status_config then
    return
end

local options    = {
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
}

local mapping    = {}
mapping['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '180' } }
mapping['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '180' } }
mapping['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '450' } }
mapping['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450' } }
mapping['<C-y>'] = { 'scroll', { '-0.10', 'false', '100' } }
mapping['<C-e>'] = { 'scroll', { '0.10', 'false', '100' } }
mapping['zt']    = { 'zt', { '250' } }
mapping['zz']    = { 'zz', { '250' } }
mapping['zb']    = { 'zb', { '250' } }

neoscroll.setup(options)
neoscroll_config.set_mappings(mapping)
