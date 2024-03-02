local status_ok, kitty_scrollback = pcall(require, 'kitty-scrollback')
if not status_ok then
    print('Error loading kitty-scrollback indent...')
    return
end

kitty_scrollback.setup({
    {
        restore_options = true,
    },
})
