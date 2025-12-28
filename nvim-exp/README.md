nvim nightly (v0.12)
# to remember

## insert
### luasnip
- `C-e` expand
- `C-J` move down
- `C-K` move up
- `C-S` `vim.lsp.buf.signature_help()`

## normal
- `k` hover
- `CTRL x o` omnicomplete
- `zg` add to spelling
- `LEADER lf` (lang format) format current buffer
- `LEADER f` find files
- `LEADER h` find help
- `LEADER o` source current buffer
- `LEADER pv` open Oil
- `LEADER s` edit previous file
- `LEADER S` edit previous in split window
- `LEADER pc` clean packages
- `LEADER pu` update packages
- `saiw+` surround word with +
- `LEADER r` run current file (`:update<CR> :make<CR>`)
    The make command has to be configured for every filetype.
- `]d` jump to next diagnostic in buffer
- `[d` jump to previous diagnostic in buffer
- `]D` jump to last diagnostic in buffer
- `[D` jump to first diagnostic in buffer
- `CTRL w d` diagnostic at cursor in floating window
- `grn` `vim.lsp.buf.rename()`
- `grr` `vim.lsp.buf.references()`
- `gri` `vim.lsp.buf.implementation()`
- `gr0` `vim.lsp.buf.document_symbol()`
- `gra` `vim.lsp.buf.code_action()`
> voor meer nieuwe 0.11 lsp mappings, zie [gpanders](https://gpanders.com/blog/whats-new-in-neovim-0-11/)

### in oil.nvim
- `gx` open file with default application

### marks
- `<` start of last visual selection
- `>` end of last visual selection
- `^` last left insert mode
- `"` last buffer exit
- `'` same as `'` but last non-blank
- `[` start of last change or yank
- `]` end of last change or yank

### built-in
- `ZQ` quick quit
- `+ib` + in block


## visual
- `J` move selected line down
- `K` move selected line up
- `LEADER y` yank to system clipboard 
- `LEADER d` delete to system clipboard 


# todo
- treesitter
- plugin require calls (opzoeken in docs)
