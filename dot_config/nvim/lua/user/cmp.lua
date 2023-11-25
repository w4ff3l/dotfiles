local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
    print('Error loading cmp...')
    return
end

local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_status_ok then
    print('Error loading snip...')
    return
end

local luasnip_vscode_status_ok, luasnip_vscode = pcall(require, 'luasnip.loaders.from_vscode')
if not luasnip_vscode_status_ok then
    print('Error loading luasnip...')
    return
end

local autopairs_status_ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not autopairs_status_ok then
    print('Error loading autopairs...')
    return
end

local kind_icons = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "",
}

luasnip_vscode.lazy_load()

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

cmp.setup {
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.disable,
    },
    mapping = {
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping.abort(),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
                nvim_lsp = '[LSP]',
                luasnip = '[Snippet]',
                buffer = '[Buffer]',
                path = '[Path]',
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
}
