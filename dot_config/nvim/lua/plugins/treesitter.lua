return {
    'nvim-treesitter/nvim-treesitter',
    build = function()
        require('nvim-treesitter.install').update({ with_sync = true })()
    end,
    config = function()
        local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
        if not status_ok then
            print('Error loading treesitter configs...')
            return
        end

        configs.setup {
            ensure_installed = { 'java', 'kotlin', 'rust', 'xml', 'html', 'json', },
            sync_install = true,
            auto_install = true,
            highlight = {
                enable = true,
                disable = { 'latex' },
                additional_vim_regex_highlighting = true,
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
            -- autotag = {
            --     enable = true,
            -- },
        }
    end,
}
