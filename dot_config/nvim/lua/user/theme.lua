-- local status_require, gruvbox = pcall(require, 'gruvbox')
-- if not status_require then
--     print('Error loading gruvbox...')
--     return
-- end
--
-- gruvbox.setup({})

vim.o.backgroud = 'dark'
vim.o.gruvbox_contrast_dark = 'hard'
vim.cmd.colorscheme('gruvbox')
