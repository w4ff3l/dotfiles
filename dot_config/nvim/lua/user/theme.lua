local colorscheme = 'gruvbox'
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
vim.o.backgroud = 'dark'
vim.o.gruvbox_contrast_dark = 'hard'
if not status_ok then
    print('Error loading Gruvbox colorscheme')
    return
end
