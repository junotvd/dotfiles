return {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
      diagnostics = {
        workspaceDelay = -1,
      },
      workspace = {
        ignoreSubmodules = true,
        library = { vim.env.VIMRUNTIME },
      },
      telemetry = { enable = false },
    },
  }
}
