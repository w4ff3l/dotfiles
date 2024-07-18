local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    print('Error loading lualine...')
    return
end

local get_cwd = function()
    local cwd = vim.fn.getcwd()
    return vim.fn.fnamemodify(cwd, ':t')
end

local cwd = {
    get_cwd,
    icon = '󱧼',
    color = { fg = '#98971a', gui = 'bold' }
}

lualine.setup({
    options = {
        icons_enabled = true,
        theme = 'gruvbox',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { cwd, 'filename', },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { cwd, 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
})

vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
