-- set to 1, nvim will open the preview window after entering the Markdown buffer
-- default: 0
vim.g.mkdp_auto_start = 0

-- set to 1, the nvim will auto close current preview window when changing
-- from Markdown buffer to another buffer
-- default: 1
vim.g.mkdp_auto_close = 1

-- set to 1, Vim will refresh Markdown when saving the buffer or
-- when leaving insert mode. Default 0 is auto-refresh Markdown as you edit or
-- move the cursor
-- default: 0
vim.g.mkdp_refresh_slow = 0

-- set to 1, the MarkdownPreview command can be used for all files,
-- by default it can be use in Markdown files only
-- default: 0
vim.g.mkdp_command_for_global = 0

-- set to 1, the preview server is available to others in your network.
-- By default, the server listens on localhost (127.0.0.1)
-- default: 0
vim.g.mkdp_open_to_the_world = 0

-- use custom IP to open preview page.
-- Useful when you work in remote Vim and preview on local browser.
-- For more details see: https://github.com/iamcco/markdown-preview.nvim/pull/9
-- default empty
vim.g.mkdp_open_ip = ''

-- specify browser to open preview page
-- for path with space
-- valid: `/path/with\ space/xxx`
-- invalid: `/path/with\\ space/xxx`
-- default: ''
vim.g.mkdp_browser = ''

-- set to 1, echo preview page URL in command line when opening preview page
-- default is 0
vim.g.mkdp_echo_preview_url = 0

-- a custom Vim function name to open preview page
-- this function will receive URL as param
-- default is empty
vim.cmd(
[[
function OpenMarkdownPreview (url)
  execute "silent !firefox --new-window " . a:url
endfunction
]]
)

vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'

-- use a custom Markdown style. Must be an absolute path
-- like '/Users/username/markdown.css' or expand('~/markdown.css')
vim.g.mkdp_markdown_css = ''

-- use a custom highlight style. Must be an absolute path
-- like '/Users/username/highlight.css' or expand('~/highlight.css')
vim.g.mkdp_highlight_css = ''

-- use a custom port to start server or empty for random
vim.g.mkdp_port = ''

-- preview page title
-- ${name} will be replace with the file name
vim.g.mkdp_page_title = '「${name}」'

-- use a custom location for images
vim.g.mkdp_images_path = '/home/user/.markdown_images'

-- recognized filetypes
-- these filetypes will have MarkdownPreview... commands
vim.g.mkdp_filetypes = { 'markdown' }

-- set default theme (dark or light)
-- By default the theme is defined according to the preferences of the system
vim.g.mkdp_theme = 'dark'

-- combine preview window
-- default: 0
-- if enable it will reuse previous opened preview window when you preview markdown file.
-- ensure to set vim.g.mkdp_auto_close = 0 if you have enable this option
vim.g.mkdp_combine_preview = 0

-- auto refetch combine preview contents when change markdown buffer
-- only when g.mkdp_combine_preview is 1
vim.g.mkdp_combine_preview_auto_refresh = 1
