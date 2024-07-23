return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<C-h>", "<cmd><C-u>TmuxNavigateLeft<cr>" },
		{ "<C-j>", "<cmd><C-u>TmuxNavigateDown<cr>" },
		{ "<C-k>", "<cmd><C-u>TmuxNavigateUp<cr>" },
		{ "<C-l>", "<cmd><C-u>TmuxNavigateDown<cr>" },
		{ "<C-\\>", "<cmd><C-u>TmuxNavigatePrevious<cr>" },
	},
}
