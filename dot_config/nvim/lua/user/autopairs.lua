local status_ok, autopairs = pcall(require, 'nvim-autopairs')
if not status_ok then
    print('Error loading dashboard theme...')
    return
end

autopairs.setup {}
