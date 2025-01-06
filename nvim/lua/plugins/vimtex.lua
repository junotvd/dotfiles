return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_compiler_latexmk_engines = {["_"] = "-lualatex -shell-escape"}
    vim.g.vimtex_view_method = "zathura"
  end
}
