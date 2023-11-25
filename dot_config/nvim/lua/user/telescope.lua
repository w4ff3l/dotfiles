local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    print('Error loading telescope...')
    return
end

telescope.load_extension("frecency")
