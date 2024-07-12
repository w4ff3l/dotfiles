local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true } -- currently not needed

local set = vim.keymap.set

local rtelescope = require("telescope.builtin")
local rhop = require("hop")

local function set_alias(alias, command)
    vim.cmd("command! -nargs=* " .. alias .. " " .. command)
end

-- Leader
set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
set("n", "<C-h>", "<C-w>h", opts)
set("n", "<C-j>", "<C-w>j", opts)
set("n", "<C-k>", "<C-w>k", opts)
set("n", "<C-l>", "<C-w>l", opts)

-- File exploration
set("n", "<leader>t", ":Neotree float toggle reveal<CR>", opts)
set("n", "<leader><leader>t", ":Neotree float toggle reveal position=current<CR>", opts)
set("n", "<leader><leader>f", rtelescope.find_files, opts)
set('n', '<leader><leader>g', rtelescope.live_grep, opts)
set('n', '<leader><leader>r', "<Cmd>Telescope frecency workspace=CWD<CR>", opts)
set('n', '<leader><leader>b', rtelescope.buffers, opts)
set('n', '<leader><leader>h', rtelescope.help_tags, opts)

-- File navigation/editing
set("n", "<leader>s", "<Plug>Sneak_s", opts)
set("n", "<leader>S", "<Plug>Sneak_S", opts)
set("n", "<leader>w", rhop.hint_words, opts)
set("n", "<leader>cc", ":call nerdcommenter#Comment('n', 'Toggle')<cr>", opts)

-- LSP
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<space>ca', '<cmd>Lspsaga code_action<CR>')
vim.keymap.set('n', '<space>rn', '<cmd>Lspsaga rename<CR>')
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
vim.keymap.set('n', '<space>e', '<cmd>Lspsaga diagnostic_jump_next<CR>')
-- Test bindings
vim.keymap.set('n', 'rt', '<cmd>Neotest run<CR>')
vim.keymap.set('n', '<space>ot', '<cmd>Neotest summary<CR>')

set_alias("Format", "lua vim.lsp.buf.format()")
set("n", "<leader>cf", ":Format<CR>", {})
