-- ~/.config/nvim/lua/custom/plugins/treesitter.lua
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"python",
			"markdown",
			"markdown_inline",
			"lua",
			"yaml",
			"java",
		},
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.config").setup(opts)
	end,
}
