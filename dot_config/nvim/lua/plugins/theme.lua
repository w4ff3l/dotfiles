return {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
vim.cmd.colorscheme('gruvbox')

-- Set special highlighting groups
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#ebdbb2' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#282828', fg = '#ebdbb2' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#282828' })
-- Telescope
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = '#282828' })
vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = '#282828' })
-- Noice
vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder', { bg = '#282828' })
vim.api.nvim_set_hl(0, 'NoiceCmdlineIcon', { fg = '#98971a' })
vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorderSearch', { bg = '#282828' })
vim.api.nvim_set_hl(0, 'NoiceCmdlineIconSearch', { bg = '#282828', fg = '#fabd2f'})
-- Notify
vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = "#cc142d" })
vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = "#d65d0e" })
vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = "#98971a" })
vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = "#458588" })
vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = "#b16286" })
vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = "#fb4934" })
vim.api.nvim_set_hl(0, "NotifyWARNIcon", { fg = "#fe8019" })
vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = "#b8bb26" })
vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { fg = "#83a598" })
vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { fg = "#d3869b" })
vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = "#fb4934" })
vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = "#fe8019" })
vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = "#b8bb26" })
vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = "#83a598" })
vim.api.nvim_set_hl(0, "NotifyTRACETitle", { fg = "#d3869b" })
vim.api.nvim_set_hl(0, "NotifyERRORBody", { link = "Normal" })
vim.api.nvim_set_hl(0, "NotifyWARNBody", { link = "Normal" })
vim.api.nvim_set_hl(0, "NotifyINFOBody", { link = "Normal" })
vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { link = "Normal" })
vim.api.nvim_set_hl(0, "NotifyTRACEBody", { link = "Normal" })

vim.cmd([[
  autocmd ColorScheme * highlight Search cterm=underline ctermbg=NONE ctermfg=NONE gui=underline guibg=NONE guifg=NONE
  autocmd ColorScheme * highlight IncSearch cterm=underline ctermbg=NONE ctermfg=NONE gui=underline guibg=NONE guifg=NONE
]])
	end,
    opts = {
        bold = true,
        italic = {
            strings = false,
            emphasis = false,
            comments = false,
            operators = false,
            folds = false,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = '',  -- can be 'hard', 'soft' or empty string
        palette_overrides = {},
        overrides = {
            ['@type.builtin.var'] = { fg = '#fb4934' },
            ['@include.java'] = { fg = '#fb4934' },
            ['@variable.builtin.java'] = { fg = '#fb4934' },
            ['@variable.java'] = { fg = '#83a598' },
            ['@type.qualifier.java'] = { fg = '#fb4934' },
            ['@lsp.type.namespace.java'] = { fg = '#fabd2f' },
            ['@lsp.type.modifier.java'] = { fg = '#fb4934' },
            ['@lsp.type.variable.java'] = { fg = '#83a598' },
        },
        dim_inactive = false,
        transparent_mode = false,
    },
}
