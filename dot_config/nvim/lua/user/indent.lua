local status_ok, ibl = pcall(require, 'ibl')
if not status_ok then
    print('Error loading Hop...')
    return
end

ibl.setup {}
