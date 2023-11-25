local status_ok, none_ls = pcall(require, 'null-ls')
if not status_ok then
    print('Error loading none-ls...')
    return
end

none_ls.setup {}
