return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here
    vim.g.vimtex_view_method = "zathura"

    -- Configure latexmk to use the -shell-escape flag
    vim.g.vimtex_compiler_latexmk = {
      build_dir = '',
      callback = 1,
      continuous = 1,
      executable = 'latexmk',
      options = {
        '-shell-escape',
        '-pdf',
		'-pdflatex=lualatex',
        '-interaction=nonstopmode',
        '-synctex=1',
      },
    }
  end
}
