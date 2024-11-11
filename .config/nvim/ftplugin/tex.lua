-- load template when opening empty .tex file
-- local template_path = vim.fn.expand("~/.config/nvim/templates/default.tex")
-- local current_file = vim.api.nvim_buf_get_name(0)
-- local filename = vim.fn.fnamemodify(current_file, ":t")
--
-- if filename == "main.tex" and vim.fn.filereadable(template_path) == 1 and vim.fn.getfsize(current_file) <= 0 then
--     vim.cmd("0r " .. template_path)
-- end
--
-- -- Define custom macros for .tex files
-- local map = vim.keymap.set
-- local opts = { noremap = true, silent = true }

-- Spell checking
vim.opt_local.spell = true
vim.opt.spelllang = { "nl", "en_gb" }

-- Snippets
-- local ls = require("luasnip")
-- local s = ls.snippet
-- local i = ls.insert_node
-- local t = ls.text_node
-- local fmt = require("luasnip.extras.fmt").fmt
--
-- local snippets = {}
--
-- ls.add_snippets("tex", snippets)
--
vim.cmd.colorscheme("nordic")
