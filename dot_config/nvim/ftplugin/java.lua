local status_ok, jdtls = pcall(require, 'jdtls')
if not status_ok then
    print('Error loading lspconfig for Java')
    return
end

local root_markers = { 'gradlew', 'mvnw', '.git' }
local root_dir = require('jdtls.setup').find_root(root_markers)

local home = os.getenv('HOME')
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local lombok_folder = home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar"
local jar = vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")
local configuration = home .. "/.local/share/nvim/mason/packages/jdtls/config_linux"

-- Get JVM home directories from environment to be system independent
local JAVA_HOME_11 = os.getenv('JAVA_HOME_11')
local JAVA_HOME_17 = os.getenv('JAVA_HOME_17')
local JAVA_HOME_21 = os.getenv('JAVA_HOME_21')

local config = {
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
                    },
                    {
                        name = "JavaSE-17",
                        path = JAVA_HOME_17,
                    },
                    {
                        name = "JavaSE-21",
                        path = JAVA_HOME_21,
                    },
                }
            }
        }
    },
}

-- vim.keymap.set('n', '<space>oi', "<Cmd>lua require'jdtls'.organize_imports()<CR>")
jdtls.start_or_attach(config)
