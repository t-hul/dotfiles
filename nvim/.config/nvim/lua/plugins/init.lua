return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" }, -- uncomment for format on save
		cmd = { "ConformInfo" },
		-- keys = {
		--   {
		--     -- Customize or remove this keymap to your liking
		--     "<leader>f",
		--     function()
		--       require("conform").format { async = true }
		--     end,
		--     mode = "",
		--     desc = "Format buffer",
		--   },
		-- },
		opts = require("configs.conform"),
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	-- Overwrite default NvChad extension_list to add "nerdy" extension
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			extension_list = { "themes", "terms", "nerdy" },
		},
		keys = {
			{ "<leader>fn", "<cmd>Telescope nerdy<cr>", desc = "Browse nerd icons" },
			{ "<leader>fr", "<cmd>Telescope nerdy_recent<cr>", desc = "Browse recent nerd icons" },
		},
	},

	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	-- markdown preview
	-- install without yarn or npm
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	-- 	lazy = true,
	-- 	ft = { "markdown" },
	-- 	build = function()
	-- 		vim.fn["mkdp#util#install"]()
	-- 	end,
	-- 	init = function()
	-- 		vim.g.mkdp_theme = "dark"
	-- 	end,
	-- 	keys = {
	-- 		{ "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "MarkdownPreviewToggle" },
	-- 	},
	-- },

	-- alternative to markdown preview: vivify
	-- needs vivify to be installed
	{
		"jannis-baum/vivify.vim",
		cmd = { "Vivify" },
		lazy = true,
		ft = { "markdown" },
		keys = {
			{ "<leader>mv", "<cmd>Vivify<cr>", desc = "Vivify Markdown" },
		},
	},

	-- lazygit integration
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},

	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui", -- UI for debugging
			"theHamsta/nvim-dap-virtual-text", -- Virtual text support
			"jay-babu/mason-nvim-dap.nvim", -- Mason integration for DAP
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Automatically open/close dap-ui on debugging
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Setup dap-ui
			require("dapui").setup()

			-- Install DAP servers via Mason
			require("mason-nvim-dap").setup({
				ensure_installed = { "codelldb", "cppdbg" }, -- Add required debuggers
			})
		end,
	},

	{
		"2kabhishek/nerdy.nvim",
		dependencies = {
			"folke/snacks.nvim",
		},
		cmd = "Nerdy",
	},

	-- Lazy/NvChad example
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		event = "VeryLazy",
	},

	--  {"nvim-telescope/telescope-symbols.nvim"}
	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	opts = {
	-- 		ensure_installed = {
	-- 			"vim", "lua", "vimdoc",
	--      "html", "css"
	-- 		},
	-- 	},
	-- },
}
