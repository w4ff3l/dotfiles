local status_ok, ibl = pcall(require, 'ibl')
if not status_ok then
    print('Error loading ibl indent...')
    return
end

ibl.setup {}
