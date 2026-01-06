local now, later = MiniDeps.now, MiniDeps.later
local now_if_args = _G.Config.now_if_args

now(function() vim.cmd.colorscheme('miniwinter') end)

now(function()
  local predicate = function(notif)
    if not (notif.data.source == 'lsp_progress' and notif.data.client_name == 'lua_ls') then return true end
    -- Filter out some LSP progress notifications from 'lua_ls'
    return notif.msg:find('Diagnosing') == nil and notif.msg:find('semantic tokens') == nil
  end
  local custom_sort = function(notif_arr) return MiniNotify.default_sort(vim.tbl_filter(predicate, notif_arr)) end

  require('mini.notify').setup({ content = { sort = custom_sort } })
end)

now(function() require('mini.tabline').setup() end)

later(function() require('mini.extra').setup() end)
later(function() require('mini.align').setup() end)

later(function()
  require('mini.pick').setup({
    window = {
      config = function()
        local height = math.floor(0.618 * vim.o.lines)
        local width = math.floor(0.618 * vim.o.columns)
        return {
          anchor = 'NW',
          height = height,
          width = width,
          row = math.floor(0.5 * (vim.o.lines - height)),
          col = math.floor(0.5 * (vim.o.columns - width)),
        }
      end,
    },
  })
end)

later(function() require('mini.bufremove').setup() end)
later(function() require('mini.surround').setup() end)
later(function() require('mini.files').setup() end)
