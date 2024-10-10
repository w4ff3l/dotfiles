return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'williamboman/mason.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'mfussenegger/nvim-jdtls',
            "ray-x/lsp_signature.nvim",
            { 'folke/neodev.nvim',  opts = {} },
            { "folke/neoconf.nvim", opts = {} },
        },
        config = function(_, opts)
            local lspconfig = require('lspconfig')
            local mason_lspconfig = require('mason-lspconfig')

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local bufnr = args.buf
                    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
                end,
            })

            mason_lspconfig.setup_handlers({
                function(server)
                    lspconfig[server].setup({
                        capabilities = capabilities,
                    })
                end,
                -- gopls is setup via go.nvim
                -- ['gopls'] = function()
                --     lspconfig['gopls'].setup({
                --         capabilities = capabilities,
                --         filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
                --     })
                -- end,
                ['jsonls'] = function()
                    lspconfig['jsonls'].setup({
                        capabilities = capabilities,
                    })
                end,
                ['gradle_ls'] = function()
                    lspconfig['gradle_ls'].setup({
                        capabilities = capabilities,
                    })
                end,
                ['angularls'] = function()
                    lspconfig['angularls'].setup({
                        capabilities = capabilities,
                    })
                end,
                ['bashls'] = function()
                    lspconfig['bashls'].setup({
                        capabilities = capabilities,
                    })
                end,
                ['cssls'] = function()
                    lspconfig['cssls'].setup({
                        capabilities = capabilities,
                    })
                end,
                ['lua_ls'] = function()
                    lspconfig['lua_ls'].setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                workspace = {
                                    library = { './deps' },
                                },
                                diagnostics = {
                                    globals = { 'vim' },
                                },
                                codeLens = {
                                    enable = true,
                                },
                                hint = {
                                    enable = true,
                                    setType = false,
                                    paramType = true,
                                    paramName = "Disable",
                                    semicolon = "Disable",
                                    arrayIndex = "Disable",
                                },
                            },
                        },
                    })
                end,
                ['jdtls'] = function() end,
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "java",
                callback = function()
                    local jdtls = require 'jdtls'
                    local root_markers = { 'gradlew', 'mvnw', '.git' }
                    local root_dir = require 'jdtls.setup'.find_root(root_markers)

                    local home = os.getenv('HOME')
                    local workspace_folder = home ..
                        "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
                    local lombok_folder = home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar"
                    local jar = vim.fn.glob(home ..
                        "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")
                    local configuration = home .. "/.local/share/nvim/mason/packages/jdtls/config_linux"

                    -- Get JVM home directories from environment to be system independent
                    local JAVA_HOME_11 = os.getenv('JAVA_HOME_11')
                    local JAVA_HOME_17 = os.getenv('JAVA_HOME_17')
                    local JAVA_HOME_21 = os.getenv('JAVA_HOME_21')

                    local on_attach = function(client, bufnr)
                        if vim.tbl_contains({ 'null-ls' }, client.name) then
                            return
                        end
                        require("lsp_signature").on_attach({
                            bind = true,
                            floating_window = false,
                            hint_enable = true,
                            hint_prefix = "λ ",
                            hi_parameter = "LspSignatureActiveParameter",
                        }, bufnr)

                        vim.lsp.inlay_hint.enable(false)

                        -- setup palantir formatter
                        -- disable default formatter
                        client.server_capabilities.documentFormattingProvider = false
                        vim.api.nvim_set_keymap('n', '<leader>f', ':PalantirFormat<CR>',
                            { noremap = true, silent = true })
                    end

                    local config = {
                        on_attach = on_attach,
                        completion = {
                            favoriteStaticMembers = {
                                "org.hamcrest.MatcherAssert.assertThat",
                                "org.hamcrest.Matchers.*",
                                "org.hamcrest.CoreMatchers.*",
                                "org.junit.jupiter.api.Assertions.*",
                                "java.util.Objects.requireNonNull",
                                "java.util.Objects.requireNonNullElse",
                                "org.mockito.Mockito.*"
                            },
                            filteredTypes = {
                                "com.sun.*",
                                "io.micrometer.shaded.*",
                                "java.awt.*",
                                "jdk.*", "sun.*",
                            },
                        },
                        -- The command that starts the language server
                        -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
                        cmd = {
                            '/usr/lib/jvm/java-17-openjdk/bin/java', -- or '/path/to/java17_or_newer/bin/java'
                            '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                            '-Dosgi.bundles.defaultStartLevel=4',
                            '-Declipse.product=org.eclipse.jdt.ls.core.product',
                            '-Dlog.protocol=true',
                            '-Dlog.level=ALL',
                            '-Xmx1g',
                            '-javaagent:' .. lombok_folder,
                            -- '-Xbootclasspath/a:' .. lombok_folder,
                            '--add-modules=ALL-SYSTEM',
                            '--add-opens',
                            'java.base/java.util=ALL-UNNAMED',
                            '--add-opens',
                            'java.base/java.lang=ALL-UNNAMED',

                            -- The jar file is located where jdtls was installed. This will need to be updated
                            -- to the location where you installed jdtls
                            '-jar',
                            jar,
                            '-configuration',
                            configuration,

                            '-data',
                            workspace_folder,
                        },

                        -- Here you can configure eclipse.jdt.ls specific settings
                        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
                        -- for a list of options
                        settings = {
                            java = {
                                eclipse = {
                                    downloadSources = true,
                                    downloadJavadoc = true,
                                },
                                maven = {
                                    downloadSources = true,
                                    downloadJavadoc = true,
                                },
                                configuration = {
                                    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
                                    -- And search for `interface RuntimeOption`
                                    -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
                                    runtimes = {
                                        {
                                            name = "JavaSE-11",
                                            path = JAVA_HOME_11,
                                            sources = JAVA_HOME_11 .. "/lib/src.zip"
                                        },
                                        {
                                            name = "JavaSE-17",
                                            path = JAVA_HOME_17,
                                            sources = JAVA_HOME_17 .. "/lib/src.zip"
                                        },
                                        {
                                            name = "JavaSE-21",
                                            path = JAVA_HOME_21,
                                            sources = JAVA_HOME_21 .. "/lib/src.zip"
                                        },
                                    },
                                },
                                inlayHints = {
                                    parameterNames = {
                                        enabled = "all"
                                    }
                                },
                                signatureHelp = {
                                    enabled = true
                                },
                            }
                        },
                        capabilities = {
                            workspace = {
                                configuration = true,
                            },
                            textDocument = {
                                completion = {
                                    completionItem = {
                                        snippentSupport = true,
                                    },
                                },
                            },
                        },
                    }

                    config.capabilities = capabilities

                    local extendedClientCapabilities = jdtls.extendedClientCapabilities
                    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
                    config.init_options = {
                        extendedClientCapabilities = extendedClientCapabilities,
                    }

                    vim.keymap.set('n', '<space>oi', "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
                    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
                    jdtls.start_or_attach(config)
                end,
            })
        end,
    },
    {
        "ray-x/go.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()',
        config = function()
            require("go").setup()
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        dependencies = {
            'nvim-web-devicons'
        },
        event = "VeryLazy",
        opts = {
            bind = true,
            floating_window = false,
            hint_enable = true,
            hint_prefix = "λ ",
            hi_parameter = "LspSignatureActiveParameter",
        },
    },
}
