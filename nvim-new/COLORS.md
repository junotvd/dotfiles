- wit1: #6da6cc
- achtergrond dt -- #fef7ea
- wit2: #f4eee2 -- kader dt
- wit3: #F6EAD0

- blauw1: #001F42 -- headings dt
- blauw2: #0e2a4c -- menu bar dt
- feller licht: #1ca9d6
- softer licht: #6da6cc -- kader dt
- lichter: #82cfe2 -- link dt
- blauw3: #18457c -- logo dt
- blauw4: #6da6cc
- blauw5: #D0D3D4
- nog een donkerder: #263f5e

- fel groen: #0f9a29 -- dt

- geel goud: #ecb77c -- dt
- geel goud: #cba26a -- dt
- geel2: #9A6B2E -- claude

- rood1: #e14232
- rood2: #d95d39

- grijs1: #515151



# v0.2 -- creamy white

```lua
on_highlights = function(hl, colors) hl.SpellBad = { fg = colors.error, undercurl = false, underline = false } end,
colors = {
  -- backgrounds: your two creams
  bg = '#FDF2DD', -- wit
  inactiveBg = '#f4eee2', -- wit2
  fg = '#515151', -- blauw2, near-black blue for body text

  floatBorder = '#515151', -- grijs
  line = '#f4eee2', -- wit2, subtle cursorline against wit
  comment = '#7d7d7d', -- lightened grijs, muted but readable

  -- #51657C
  -- accents: bright + cool, anchored around cyan/blue
  builtin = '#18457c', -- blauw1
  func = '#0e7c9c', -- deep cyan, saturated
  string = '#2a8f8f', -- teal-green
  number = '#c0563a', -- warm coral pop for contrast
  property = '#5a5a5a', -- low-emphasis grey
  constant = '#3a7ec0', -- bright mid-blue
  parameter = '#2a9ab0', -- cyan, near your #82cfe2 but readable
  visual = '#cfe8ef', -- pale cyan tint (your color, lightened)
  error = '#b32d4a',
  warning = '#c77f1a',
  hint = '#0e7c9c',
  keyword = '#18457c', -- blauw1, primary accent
  operator = '#717171',
  type = '#1a8a8a', -- vivid teal
  search = '#a9dde8', -- your #82cfe2 family as a highlight wash
  plus = '#3a8a5a', -- fresh green
  delta = '#c77f1a',
},
```

# v0.3 -- better strings
```lua
  on_highlights = function(hl, colors) hl.SpellBad = { fg = colors.error, undercurl = false, underline = false } end,
  colors = {
    -- backgrounds: your creams
    bg = '#FDF2DD',         -- wit
    inactiveBg = '#F4EEE2', -- wit2
    fg = '#515151',         -- grijs, body text
    floatBorder = '#001F42', -- darker blue, more definition than grey
    line = '#F6EAD0',        -- warm cursorline, sits between bg and accents
    comment = '#8A7F6B',     -- warm taupe-grey, ties to the cream bg, low emphasis

    -- accents: pulled toward your blues, desaturated for eye comfort
    builtin = '#18457C',   -- blauw1 (lighter accent)
    func = '#1B5C7A',      -- muted teal-blue, derived from blauw1
    string = '#3A7A5E',    -- muted forest-green, calm against cream
    number = '#B05636',    -- warm terracotta, softer than coral
    property = '#5A5A5A',  -- low-emphasis grey
    constant = '#2C5F94',  -- mid-blue between your two blues
    parameter = '#3E7A8C', -- desaturated cyan-blue, readable
    visual = '#E3D9C0',    -- warm cream-tan selection, no cool clash with bg
    error = '#A82F46',
    warning = '#B57518',
    hint = '#1B5C7A',
    keyword = '#001F42',   -- blauw2 (darker blue), strongest weight for keywords
    operator = '#717171',
    type = '#2C7370',      -- muted teal
    search = '#D9CBA8',    -- warm sand wash, harmonizes with bg
    plus = '#3A7A5E',
    delta = '#B57518',
  },
```

# v0.4 -- beste tot nu toe
```lua
  colors = {
    -- backgrounds: your creams
    bg = '#FDF2DD', -- wit
    inactiveBg = '#F4EEE2', -- wit2
    fg = '#515151', -- grijs, body text
    floatBorder = '#001F42', -- darker blue, more definition than grey
    line = '#F6EAD0', -- warm cursorline, sits between bg and accents
    comment = '#8A7F6B', -- warm taupe-grey, ties to the cream bg, low emphasis

    -- accents: pulled toward your blues, desaturated for eye comfort
    builtin = '#18457C', -- blauw1 (lighter accent)
    func = '#3A7A5E', -- muted teal-blue, derived from blauw1
    string = '#9A6B2E', -- muted forest-green, calm against cream
    number = '#B05636', -- warm terracotta, softer than coral
    property = '#5A5A5A', -- low-emphasis grey
    constant = '#001F42', -- mid-blue between your two blues
    parameter = '#8A5A8C', -- desaturated cyan-blue, readable
    visual = '#E3D9C0', -- warm cream-tan selection, no cool clash with bg
    error = '#A82F46',
    warning = '#B57518',
    hint = '#1B5C7A',
    keyword = '#18457C', -- blauw2 (darker blue), strongest weight for keywords
    operator = '#717171',
    type = '#3E7A8C',
    search = '#D9CBA8', -- warm sand wash, harmonizes with bg
    plus = '#3A7A5E',
    delta = '#B57518',
  },
```
