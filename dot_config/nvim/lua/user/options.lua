local options = {
    backup = false,
    clipboard = 'unnamedplus',
    expandtab = true,
    fileencoding = 'utf-8',
    ignorecase = true,
    number = true,
    numberwidth = 4,
    relativenumber = true,
    scrolloff = 999,
    shiftwidth = 4,
    showmode = false,
    sidescrolloff = 8,
    signcolumn = 'yes',
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 4,
    termguicolors = true,
    undofile = true,
    updatetime = 300,
    wrap = false,
    writebackup = false,
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

vim.opt.conceallevel = 2

