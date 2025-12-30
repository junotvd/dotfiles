local opt = vim.opt
vim.g.mapleader = " "
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.cursorcolumn = false
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.swapfile = false
opt.termguicolors = true
opt.undofile = true
opt.incsearch = true
opt.hlsearch = false
opt.guicursor = ""
opt.mouse = ""
opt.scrolloff = 100
opt.spell = true
opt.spelllang = { "nl", "en_gb" }

vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim", name = "rosepine" },
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/y9san9/y9nika.nvim" },
	{ src = "https://github.com/ricardoraposo/gruvbox-minor.nvim" },
	{ src = "https://github.com/savq/melange-nvim" },
	{ src = "https://github.com/RostislavArts/naysayer.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/echasnovski/mini.surround" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		data = {
			run = function(_)
				vim.cmd("TSUpdate")
			end,
		},
	},
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/chentoast/marks.nvim" },
})

vim.lsp.enable({
	"lua_ls",
	"tinymist",
	"basedpyright",
	"ruff",
	"html",
	"cssls",
	"bashls",
	"nil",
	"vtsls",
	"gopls",
	"rust_analyzer",
})

vim.diagnostic.config({
	virtual_text = { severity = vim.diagnostic.severity.ERROR },
	severity_sort = true,
})

require("conform").setup({
	lsp_format = "never",
	formatters_by_ft = {
		sh = { "shfmt" },
	},
})

require("marks").setup({ builtin_marks = { "<", ">", "^", '"', [[']], "`", "[", "]" } })
require("mason").setup()

-- vim.api.nvim_create_user_command('Mason', function()
-- 	pcall(vim.cmd.packadd, 'mason.nvim')
-- require('mason').setup()
-- 	vim.cmd('Mason')
-- end, {})

require("mini.pick").setup({
	window = {
		config = function()
			local height = math.floor(0.618 * vim.o.lines)
			local width = math.floor(0.618 * vim.o.columns)
			return {
				anchor = "NW",
				height = height,
				width = width,
				row = math.floor(0.5 * (vim.o.lines - height)),
				col = math.floor(0.5 * (vim.o.columns - width)),
			}
		end,
	},
})
require("mini.surround").setup()
require("oil").setup({
	default_file_explorer = true,
	view_options = {
		show_hidden = true,
	},
	columns = {
		"permissions",
		"size",
	},
})

vim.api.nvim_create_autocmd("InsertEnter", {
	once = true,
	callback = function()
		pcall(vim.cmd.packadd, "LuaSnip")
		local ls = require("luasnip")
		ls.setup({ enable_autosnippets = true })
		require("luasnip.loaders.from_lua").lazy_load({
			paths = { vim.fn.expand("~/dotfiles/nvim/snippets/") },
		})
		local map = vim.keymap.set
		map("i", "<C-e>", function()
			ls.expand()
		end, { silent = true })
		map({ "i", "s" }, "<C-J>", function()
			ls.jump(1)
		end, { silent = true })
		map({ "i", "s" }, "<C-K>", function()
			ls.jump(-1)
		end, { silent = true })
	end,
})

require("rose-pine").setup({ styles = {
	transparency = true,
} })
require("vague").setup({ transparent = true })
vim.cmd.colorscheme("vague")
vim.cmd(":hi statusline guibg=NONE")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method("textDocument/completion") then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}
			for i = 32, 126 do
				table.insert(chars, string.char(i))
			end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})
vim.opt.completeopt:append({ "menuone", "noselect", "popup" })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

local function pack_clean()
	local active_plugins = {}
	local unused_plugins = {}

	for _, plugin in ipairs(vim.pack.get()) do
		active_plugins[plugin.spec.name] = plugin.active
	end

	for _, plugin in ipairs(vim.pack.get()) do
		if not active_plugins[plugin.spec.name] then
			table.insert(unused_plugins, plugin.spec.name)
		end
	end

	if #unused_plugins == 0 then
		print("No unused plugins.")
		return
	end

	local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
	if choice == 1 then
		vim.pack.del(unused_plugins)
	end
end

local map = vim.keymap.set

map("n", "<leader>o", "<Cmd>update<CR> <Cmd>source<CR>")
map("n", "<leader>O", "<Cmd>source $MYVIMRC<CR>")

map({ "n", "v", "x" }, "<leader>y", '"+y')
map({ "n", "v", "x" }, "<leader>d", '"+d')

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<leader>pv", vim.cmd.Oil)
map("n", "<leader>f", ":Pick files<CR>")
map("n", "<leader>h", ":Pick help<CR>")
map("n", "<leader>b", ":Pick buffers<CR>")
map("n", "<leader>g", ":Pick grep<CR>")

map("n", "<leader>lf", vim.lsp.buf.format)
map("n", "<leader>lF", require("conform").format)

map({ "n", "v", "x" }, "<leader>s", ":e #<CR>")
map({ "n", "v", "x" }, "<leader>S", ":sf #<CR>")
map({ "n", "v", "x" }, "<leader>v", ":e $MYVIMRC<CR>")
map("n", "<leader>r", ":update<CR> :make<CR>")

map("n", "<C-q>", ":copen<CR>", { silent = true })

map("n", "<leader>t", "<Cmd>tabnew<CR>")
map("n", "<leader>x", "<Cmd>tabclose<CR>")
for i = 1, 9 do
	map("n", "<leader>" .. i, "<Cmd>tabnext " .. i .. "<CR>", { noremap = true, silent = true })
end

map("n", "<leader>pc", pack_clean)
map("n", "<leader>pu", "<cmd>lua vim.pack.update()<CR>")
