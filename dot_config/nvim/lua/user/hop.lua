local status_ok, hop = pcall(require, 'hop')
if not status_ok then
    print('Error loading Hop...')
    return
end

hop.setup()
