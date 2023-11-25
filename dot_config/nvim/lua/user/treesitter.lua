local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    print('Error loading treesitter configs...')
    return
end

configs.setup {
    ensure_installed = 'all', -- one of 'all', 'maintained' (parsers with maintainers), or a list of languages
    sync_install = false,     -- install languages synchronously (only applied to `ensure_installed`)
    highlight = {
        enable = true,    -- false will disable the whole extension
        disable = { '' }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
        custom_captures = {
            ["type"] = "keyword",
        },
    },
    autopairs = { enable = true, },
    indent = { enable = true, disable = { 'yaml' }, },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    textobjects = {
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },
    },
    autotag = {
        enable = true,
    },
}

