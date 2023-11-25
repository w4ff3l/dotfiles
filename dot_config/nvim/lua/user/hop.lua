local status_ok, hop = pcall(require, 'hop')
if not status_ok then
    print('Error loading hop...')
    return
end

hop.setup()
