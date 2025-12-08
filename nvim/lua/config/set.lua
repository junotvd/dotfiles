local opt = vim.opt

opt.guicursor = ''

opt.undofile = true

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- opt.list = true
-- opt.listchars = { trail = '·' }

opt.scrolloff = 20

opt.spell = true

opt.spelllang = { 'nl', 'en_gb' }

opt.signcolumn = 'yes'

opt.inccommand = 'split'

opt.formatoptions:remove({ 'o', 'O' })
