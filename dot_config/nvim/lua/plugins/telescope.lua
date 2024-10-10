vim.api.nvim_create_autocmd("FileType", {
    pattern = "TelescopeResults",
    callback = function(ctx)
        vim.api.nvim_buf_call(ctx.buf, function()
            vim.fn.matchadd("TelescopeParent", "\t\t.*$")
            vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
        end)
    end,
})

local function filenameFirst(_, path)
    local tail = vim.fs.basename(path)
    local parent = vim.fs.dirname(path)
    if parent == "." then return tail end
    return string.format("%s\t\t%s", tail, parent)
end

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        defaults = {
            path_display = filenameFirst,
            layout_strategy = 'horizontal',
            layout_config = {
                horizontal = { width = 0.8, height = 0.8 },
                preview_width = 0.5,
            },
        },
        pickers = {
            buffers = {
                sort_mru = true,
                layout_strategy = 'horizontal',
                layout_config = {
                    horizontal = { width = 0.6, height = 0.5 },
                    preview_width = 0.5,
                },
                initial_mode = "normal",
                previewer = false,
            }
        }
    },
}
