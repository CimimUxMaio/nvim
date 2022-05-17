local utils = require("utils")


local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    utils.warn_module_import_fail("cmp")
    return
end



local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    utils.warn_module_import_fail("luasnip")
    return
end


require("luasnip/loaders/from_vscode").lazy_load()



local cmp_sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer" }
}



local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end


local force_confirm = cmp.mapping.confirm({ select = true })


local super_tab = function(fallback)
    if cmp.visible() then
        force_confirm()
    elseif luasnip.expandable() then
        luasnip.expand()
    elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    elseif check_backspace() then
        fallback()
    else
        fallback()
    end
end


local inverse_super_tab = function(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
    else
        fallback()
    end
end



cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },

    sources = cmp.config.sources(cmp_sources),

    formatting = {
        fields = { "kind", "abbr", "menu" },

        format = function(entry, vim_item)
            vim_item.kind = string.format("%s", utils.icons.kinds[vim_item.kind])
            vim_item.menu = "[" .. entry.source.name .. "]"
            return vim_item
        end
    },

    mapping = {
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),

        ["<C-y>"] = cmp.config.disable,

        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

        ["<Tab>"] = cmp.mapping(super_tab, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(inverse_super_tab, { "i", "s" }),

        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item()
    },

    window = {
        documentation = cmp.config.window.bordered(),
    },

    experimental = {
        ghost_text = true
    }
}
