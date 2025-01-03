return {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = 'v2.15', -- uncomment to pin to a specific release
    init = function()
        -- This is necessary for VimTeX to load properly. The 'indent' is optional.
        -- Note that most plugin managers will do this automatically.
        vim.g.vimtex_filetype_plugin_indent = 1

        -- This enables Vim's and neovim's syntax-related features. Without this, some
        -- VimTeX features will not work (see ':help vimtex-requirements' for more
        -- info).
        vim.g.vimtex_syntax_enable = 1

        -- Viewer options: One may configure the viewer either by specifying a built-in
        -- -- viewer method:
        vim.g.vimtex_view_method = 'zathura'

        -- Do not open quickfix window automatically after compilation
        vim.g.vimtex_quickfix_enabled = 0
    end
}
