return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

    config = function()

        local harpoon = require("harpoon")
        harpoon.setup()

        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

        vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-p>", ui.nav_prev)
        vim.keymap.set("n", "<C-n>", ui.nav_next)
    end
}
