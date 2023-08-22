local options = {
    number = true,
    relativenumber = true,
    wrap = false,
    numberwidth = 4,
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    backup = false,
    swapfile = false,
    showmode = false,
    ignorecase = true,
    fileencoding = 'utf-8',
    splitright = true,
    splitbelow = true,
    undofile = true,
    updatetime = 300,
    writebackup = false,
    scrolloff = 8,
    sidescrolloff = 8,
    signcolumn = 'yes',
    clipboard = 'unnamedplus',
    termguicolors = true
}

vim.opt.shortmess:append 'c'

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 300 }
    end,
})
