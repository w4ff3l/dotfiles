local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true } -- currently not needed

local set = vim.keymap.set

local rtelescope = require('telescope.builtin')
local rhop = require('hop')

local function set_alias(alias, command)
    vim.cmd('command! -nargs=* ' .. alias .. ' ' .. command)
end

-- Leader
set('', '<Space>', '<Nop>', opts)
set('n', '<Esc>', '<cmd>noh<CR>')

-- Better window navigation
set('n', '<C-h>', '<C-w>h', opts)
set('n', '<C-j>', '<C-w>j', opts)
set('n', '<C-k>', '<C-w>k', opts)
set('n', '<C-l>', '<C-w>l', opts)

-- File exploration
set('n', '<leader>t', ':Neotree float toggle reveal<CR>', opts)
set('n', '<leader><leader>t', ':Neotree float toggle reveal position=current<CR>', opts)
set('n', '<leader><leader>f', rtelescope.find_files, opts)
set('n', '<leader><leader>g', rtelescope.live_grep, opts)
set('n', '<leader><leader>r', '<Cmd>Telescope frecency workspace=CWD<CR>', opts)
set('n', '<C-Tab>', rtelescope.buffers, opts)
set('n', '<leader><leader>h', rtelescope.help_tags, opts)

-- File navigation/editing
set('n', '<leader>s', '<Plug>Sneak_s', opts)
set('n', '<leader>S', '<Plug>Sneak_S', opts)
set('n', '<leader>w', rhop.hint_words, opts)

-- LSP
set('n', 'gD', vim.lsp.buf.declaration, opts)
set('n', 'gd', function() require 'telescope.builtin'.lsp_definitions() end, opts)
set('n', 'gi', vim.lsp.buf.implementation, opts)
set('n', 'gt', vim.lsp.buf.type_definition, opts)
set('n', 'gr', function() require 'telescope.builtin'.lsp_references() end, opts)
set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
set('n', '<space>ca', '<cmd>Lspsaga code_action<CR>')
set('v', '<space>ca', '<cmd>Lspsaga code_action<CR>')
set('n', '<A-CR>', '<cmd>Lspsaga code_action<CR>')
set('n', '<space>rn', '<cmd>Lspsaga rename<CR>')
set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
set('n', '<space>e', '<cmd>Lspsaga diagnostic_jump_next<CR>')
-- Markdown
set('n', '<space>mt', ':Markview toggleAll<CR>')
-- Obsidian
set('n', '<space>ob', ':ObsidianBacklinks<CR>')
set('n', '<space>on', ':ObsidianNew<CR>')
set('n', '<space>ot', ':ObsidianTags<CR>')
-- Test bindings
set('n', '<space>rt', '<cmd>Neotest run<CR>')
-- set('n', '<space>ot', '<cmd>Neotest summary<CR>')

set_alias('Format', 'lua vim.lsp.buf.format()')
set('n', '<space>f', ':Format<CR>')

set_alias('HintsOn', 'lua vim.lsp.inlay_hint.enable(true)')
set_alias('HintsOff', 'lua vim.lsp.inlay_hint.enable(false)')
