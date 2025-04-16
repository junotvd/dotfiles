return {

  {
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.vimtex_syntax_enabled = 1
      vim.g.vimtex_compiler_latexmk_engines = { ['_'] = '-lualatex -shell-escape' }
      vim.g.vimtex_view_method = 'zathura'
      vim.api.nvim_set_hl(0, 'Conceal', { ctermbg = 'none' })
      vim.cmd([[
        inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
        nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
        ]])
    end,
  },

  {
    'KeitaNakamura/tex-conceal.vim',
    config = function()
      vim.o.conceallevel = 2
      vim.g.tex_conceal = 'abdmg'
      vim.g.tex_conceal_frac = 1
      vim.cmd([[hi Conceal ctermbg=none]])
    end,
  },
}
