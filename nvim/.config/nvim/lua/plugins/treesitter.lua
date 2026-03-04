return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",

	config = function()
		require("nvim-treesitter").install({
			"bash",
			"lua",
			"python",
			"markdown",
			"markdown_inline",
			"yaml",
			"java",
			"toml",
		})
	end,
}
