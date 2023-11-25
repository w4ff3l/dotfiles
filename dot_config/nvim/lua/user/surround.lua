local status_ok, surround = pcall(require, 'nvim-surround')
if not status_ok then
    print('Error loading nvim-surround...')
    return
end

surround.setup()

