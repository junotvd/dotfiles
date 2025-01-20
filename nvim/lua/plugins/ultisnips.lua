return {
  "SirVer/ultisnips",
  config = function()
    vim.g.UltiSnipsExpandTrigger = '<tab>'
    vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
    vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
    vim.g.UltiSnipsSnippetDirectories = {os.getenv('HOME') .. '/dotfiles/vim/UltiSnips'}

    vim.keymap.set('n', '<Leader>s', '<Cmd>echo "Snippets refreshed!"<Cmd>call UltiSnips#RefreshSnippets()<CR>')
  end,
}
