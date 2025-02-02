return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_compiler_latexmk_engines = { ["_"] = "-lualatex -shell-escape" }
      vim.g.vimtex_view_method = "zathura"
      vim.api.nvim_set_hl(0, "Conceal", { ctermbg = "none" })
    end,
  },
  {
    'KeitaNakamura/tex-conceal.vim',
    config = function()
      vim.o.conceallevel = 2
      vim.g.tex_conceal = "abdmg"
      vim.g.tex_conceal_frac = 1
      vim.cmd([[hi Conceal ctermbg=none]])
    end
  }
}
