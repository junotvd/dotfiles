-- Basic keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "Open NetRW"})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]])
