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

}
