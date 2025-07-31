-- ~/.config/nvim/lua/custom/plugins/treesitter.lua
return {
	"nvim-treesitter/nvim-treesitter",
	opts = function(_, opts)
		-- Extend the list of installed parsers
		vim.list_extend(opts.ensure_installed, {
			"python",
			"markdown",
			"markdown_inline",
			"lua",
			"yaml",
		})
	end,
}
