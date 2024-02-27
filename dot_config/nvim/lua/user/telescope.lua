local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    print('Error loading telescope...')
    return
end

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

telescope.setup({
    defaults = {
        path_display = filenameFirst,
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = { width = 0.95, height = 0.95 },
            preview_width = 0.5,
        },
    },
})

telescope.load_extension("frecency")
