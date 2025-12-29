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

# nvim
## loading of files
0.  runtimepath is constructed
    - before anything, neovim builds `runtimepath` from:
        1. `$VIMRUNTIME` (built-in runtime)
        2. system config paths
        3. user config (`~/.config/nvim` or `NVIM_APPNAME`)
        4. packages added via `vim.pack.add()`
1. `init.lua` / `init.vim`: plugins are not configured here yet, only added to
   runtimepath
2. `plugin/`: for always-on startup code (keymaps, general settings, lightweight
   config)
3. `after/plugin/`: analoog aan `plugin/` maar aan einde van `runtimepath`,
   for "override" config, or config that must run after plugins define defaults
4. filetype detection: at this point, neovim
    - detects `filetype`
    - sets `&filetype`
    - triggers `FileType` event
    - nothing from `filetype/` is loaded yet -- just detection
5. `ftplugin/`: filetype-specific and load when a buffer gets
   a filetype, bv voor `vim.bo.makeprf=...`, for buffer-local settings (indent,
6. `after/ftplugin/`
   makeprg, wrap, textwidth, etc)
7. `indent/` / `after/indent/`: filetype-driven specifiek voor indentation logic
   `:colorscheme NAME`
8. `lsp/` / `after/lsp/`: used as config modules for the LSP to load when you
   enable that server (`vim.lsp.enable()`), `after/lsp` analoog maar dus zoals
   `after` elders werkt
- `colors/`: not load automatically, files here are only sourced when you run
- `lua/`: enkel gebruikt bij `require('my-module')`
- `snippets/`: loaded by LuaSnip
- `queries/`: used by treesitter for query overrides
