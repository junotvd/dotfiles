return {
    -- Jump to the next placeholder
    vim.api.nvim_set_keymap("i", "<Tab>", "<cmd>lua require'luasnip'.jump(1)<CR>", {silent = true}),
    vim.api.nvim_set_keymap("s", "<Tab>", "<cmd>lua require'luasnip'.jump(1)<CR>", {silent = true}),

    -- Jump to the previous placeholder
    vim.api.nvim_set_keymap("i", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>", {silent = true}),
    vim.api.nvim_set_keymap("s", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>", {silent = true}),
}
