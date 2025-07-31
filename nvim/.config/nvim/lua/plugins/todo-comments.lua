return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		highlight = {
			comments_only = true, -- default
		},
		-- default keywords
		keywords = {
			FIX = {
				icon = " ", -- icon used for the sign, and in search results
				color = "error", -- can be a hex color, or a named color (see below)
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
				-- signs = false, -- configure signs for some keywords individually
			},
			TODO = { icon = " ", color = "info" },
			HACK = { icon = " ", color = "warning" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
			TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
		},
	},
	config = function(_, opts)
		require("todo-comments").setup(opts)

		-- Override for markdown
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				if vim.b.todo_comments_overridden then
					return
				end
				-- Clone opts
				local md_opts = vim.deepcopy(require("todo-comments.config").options)

				-- Override options
				md_opts.highlight.comments_only = false
				md_opts.keywords.UNTIL = { icon = "⏳", color = "warning", alt = { "DEADLINE", "BIS" } }

				require("todo-comments").setup(md_opts)
				vim.b.todo_comments_overridden = true

				-- Apply highlights
				vim.schedule(function()
					-- Reload if the buffer is listed and loaded
					local buf = vim.api.nvim_get_current_buf()
					if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
						vim.cmd("silent! redraw") -- no edit, just redraw highlights
					end
				end)
			end,
		})
	end,
	event = "VeryLazy",
}
