local status_ok, obsidian = pcall(require, 'obsidian')
if not status_ok then
    print('Error loading obsidian...')
    return
end

obsidian.setup({
    workspaces = {
        {
            name = "personal",
            path = "~/vaults/personal",
        },
        {
            name = "work",
            path = "~/vaults/work",
        },
    },
})

vim.keymap.set("n", "gd", function()
    if obsidian.util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
    else
        return "gd"
    end
end, { noremap = false, expr = true })
