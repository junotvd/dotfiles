-- load template when opening empty .tex file
local template_path = vim.fn.expand("~/.config/nvim/templates/default.tex")
local current_file = vim.api.nvim_buf_get_name(0)

if vim.fn.filereadable(template_path) == 1 and vim.fn.getfsize(current_file) <= 0 then
    vim.cmd("0r " .. template_path)
end


-- Define custom macros for .tex files
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Tekst
map("n", "<leader>bf", "i\\textbf{}<Esc>i", opts)
map("n", "<leader>Bf", "bi\\textbf{<Esc>ea}<Esc>", opts)
map("n", "<leader>it", "i\\textit{}<Esc>i", opts)
map("n", "<leader>It", "bi\\textit{<Esc>ea}<Esc>", opts)

-- Wiskunde notatie
map("n", "<leader>(", "i\\(\\)<Esc>hi", opts)
map("n", "<leader>[", "i\\[\\]<Esc>hi", opts)

-- Verzamelingen
map("n", "<leader>C", "i\\mathbb{C}", opts)
map("n", "<leader>Q", "i\\mathbb{Q}", opts)
map("n", "<leader>R", "i\\mathbb{R}", opts)
map("n", "<leader>N", "i\\mathbb{N}", opts)
map("n", "<leader>Z", "i\\mathbb{Z}", opts)
