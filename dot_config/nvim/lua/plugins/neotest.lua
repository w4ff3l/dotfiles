return {
    {
        'nvim-neotest/neotest',
        dependencies = {
            'nvim-neotest/nvim-nio',
            'nvim-lua/plenary.nvim',
            "antoinemadec/FixCursorHold.nvim",
            'nvim-treesitter/nvim-treesitter',
            'rcasia/neotest-java',
            'rouge8/neotest-rust',
        },
        config = function()
            local compatible_path = require("neotest-java.util.compatible_path")
            require 'neotest'.setup({
                adapters = {
                    require 'neotest-java' ({
                        ignore_wrapper = false,
                        junit_jar = compatible_path(vim.fn.stdpath("data") ..
                        "/neotest-java/junit-platform-console-standalone-1.10.0.jar"),
                        log_level = debug,
                    })
                }
            })
            -- require 'neotest'.setup({
            --     adapters = {
            --         require 'neotest-rust' ({})
            --     }
            -- })
        end
    },
}
