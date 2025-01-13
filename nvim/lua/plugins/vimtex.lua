return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_compiler_latexmk_engines = {["_"] = "-lualatex -shell-escape"}
    vim.g.vimtex_view_method = "zathura"
    vim.api.nvim_set_hl(0, "Conceal", { ctermbg = "none" })
  end
}
