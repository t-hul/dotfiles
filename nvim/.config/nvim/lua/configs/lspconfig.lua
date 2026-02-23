-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require("nvchad.configs.lspconfig")

-- List of servers you want
local servers = { "html", "pylsp", "marksman", "clangd", "texlab" }

-- Common opts (NvChad)
local common = {
	on_attach = nvlsp.on_attach,
	on_init = nvlsp.on_init,
	capabilities = nvlsp.capabilities,
}

-- Define configs (native API)
for _, name in ipairs(servers) do
	vim.lsp.config(name, common)
end

-- ---- pylsp custom config ----
vim.lsp.config(
	"pylsp",
	vim.tbl_deep_extend("force", common, {
		before_init = function(_, config)
			local venv = os.getenv("VIRTUAL_ENV")
			if venv then
				config.settings = config.settings or {}
				config.settings.python = config.settings.python or {}
				config.settings.python.pythonPath = venv .. "/bin/python"
				return
			end

			-- Neovim-native project root detection
			local root = vim.fs.root(0, { ".git", "pyproject.toml" })
			if root and vim.fn.isdirectory(root .. "/.venv") == 1 then
				config.settings = config.settings or {}
				config.settings.python = config.settings.python or {}
				config.settings.python.pythonPath = root .. "/.venv/bin/python"
			end
		end,

		settings = {
			pylsp = {
				plugins = {
					pycodestyle = {
						maxLineLength = 88,
					},
				},
			},
		},
	})
)

-- ---- clangd custom config ----
vim.lsp.config(
	"clangd",
	vim.tbl_deep_extend("force", common, {
		cmd = { "clangd", "--clang-tidy" },
	})
)

-- Enable all configured servers
vim.lsp.enable(servers)
