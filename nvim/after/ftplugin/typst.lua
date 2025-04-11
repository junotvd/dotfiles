print("Loading typ.lua")

vim.keymap.set("n", "<leader>ll", vim.cmd.TypstPreviewToggle, { buffer = true })
vim.keymap.set("n", "<leader>lc", ":!typst compile %<CR>")
