return {
  'KeitaNakamura/tex-conceal.vim',
  config = function()
    vim.o.conceallevel = 2
    vim.g.tex_conceal = "abdmg"
    vim.g.tex_conceal_frac = 1
    vim.cmd([[hi Conceal ctermbg=none]])
  end
}
