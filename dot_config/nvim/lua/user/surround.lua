local status_ok, surround = pcall(require, 'nvim-surround')
if not status_ok then
    print('Error loading Hop...')
    return
end

surround.setup()

