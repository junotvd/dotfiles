return {
    "echasnovski/mini.nvim",
    config = function()
        require("mini.surround").setup()
        require("mini.comment").setup()
        require("mini.icons").setup()
    end
}
