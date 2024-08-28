return {
    'nvim-neotest/neotest',
    dependencies = {
        'nvim-neotest/nvim-nio',
        'nvim-lua/plenary.nvim',
        'antoinemadec/FixCursorHold.nvim',
        'nvim-treesitter/nvim-treesitter'
    },
    opts = {
        adapters = {
            ['neotest-plenary'] = {},
            ['neotest-java'] = {},
            ['neotest-rust'] = {},
        }
    }
}
