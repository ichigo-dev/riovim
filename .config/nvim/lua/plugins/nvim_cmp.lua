-------------------------------------------------------------------------------
-- Autocomplete.
--------------------------------------------------------------------------------

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
    return
end

local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then
    return
end

local function border(hl_name)
    return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
    }
end

cmp.setup {

    window = {
        completion = {
            side_padding = 1,
            border = border "CmpDoc",
            scrollbar = false,
        },
        documentation = {
            border = border "CmpDoc",
        },
    },

    -- Load snippet support
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    -- Completion settings
    completion = {
        keyword_length = 2,
        completeopt = "menu,menuone",
    },

    -- Key mapping
    mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-1),
        ["<C-f>"] = cmp.mapping.scroll_docs(1),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
    },

    -- Load sources, see: https://github.com/topics/nvim-cmp
    sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
    },

    -- Icons
    formatting = {
        fields = { 'abbr', 'menu' },
        format = function(entry, item)
            local menu_icon = {
                luasnip = '⋗',
                nvim_lsp = 'λ',
                path = '🖫',
                buffer = 'Ω',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
}
