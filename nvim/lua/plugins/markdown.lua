return {

  {
    "MeanderingProgrammer/render-markdown.nvim",
    config = function()
      require("render-markdown").setup({
        pipe_table = {
          enabled = false,
        },
      })
    end
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
      vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>")
    end
  },
}
