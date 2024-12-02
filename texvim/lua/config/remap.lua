vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')

vim.keymap.set("i", "<C-c>", "<Esc>")

-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "netrw",
--     callback = function()
--         vim.api.nvim_buf_set_keymap(0, "n", "<CR>", ":if vim.fn.expand('%:e') == pdf then vim.cmd('silent !zathura % &') end<CR>",
--         { noremap = true, silent = true })
--     end,
-- })

