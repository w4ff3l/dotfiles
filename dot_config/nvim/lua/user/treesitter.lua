local treesitter_config_status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not treesitter_config_status_ok then
    print('Error loading treesitter configs...')
    return
end

local treesitter_parsers_status_ok, parsers = pcall(require, 'nvim-treesitter.parsers')
if not treesitter_parsers_status_ok then
    print('Error loading treesitter parsers...')
    return
end

configs.setup {
    ensure_installed = 'all', -- one of 'all', 'maintained' (parsers with maintainers), or a list of languages
    sync_install = false,     -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { '' },  -- List of parsers to ignore installing
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true,    -- false will disable the whole extension
        disable = { '' }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { 'yaml' } },
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

local parser_config = parsers.get_parser_configs()

parser_config.nu = {
    install_info = {
        url = 'https://github.com/nushell/tree-sitter-nu',
        files = { 'src/parser.c' },
        branch = 'main',
    },
    filetype = 'nu',
}

