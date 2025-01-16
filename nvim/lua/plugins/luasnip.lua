return {
  "L3MON4D3/LuaSnip",
  config = function()
    require("luasnip").config.set_config({
      history = true,
      enable_autosnippets = true,
      -- store_selection_keys = "<Tab>",
    })

    require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets/"})
    -- vim.cmd[[
    --             imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
    --             smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
    --
    --             imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
    --             smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
    --             ]]
  end
}
