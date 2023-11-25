require("gruvbox").setup({
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
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
    contrast = "",  -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {
        ["@type.builtin.var"] = { fg = "#fb4934" },
        ["@include.java"] = { fg = "#fb4934" },
        ["@variable.builtin.java"] = { fg = "#fb4934" },
        ["@variable.java"] = { fg = "#83a598" },
        ["@type.qualifier.java"] = { fg = "#fb4934" },
        ["@lsp.type.namespace.java"] = { fg = "#fabd2f" },
        ["@lsp.type.modifier.java"] = { fg = "#fb4934" },
        ["@lsp.type.variable.java"] = { fg = "#83a598" },
    },
    dim_inactive = false,
    transparent_mode = false,
})

vim.cmd.colorscheme('gruvbox')
