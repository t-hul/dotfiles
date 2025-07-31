-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- EXAMPLE
local servers = { "html", "pylsp", "marksman", "clangd", "texlab" }
local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	})
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
lspconfig.pylsp.setup({
	before_init = function(_, config)
		local venv = os.getenv("VIRTUAL_ENV")
		if venv then
			config.settings.python = {
				pythonPath = venv .. "/bin/python",
			}
		else
			local root = util.root_pattern(".git", "pyproject.toml")(vim.fn.getcwd())
			if root and vim.fn.isdirectory(root .. "/.venv") == 1 then
				config.settings.python = {
					pythonPath = root .. "/.venv/bin/python",
				}
			end
		end
	end,
	settings = {
		pylsp = {
			-- configurationSources = { "pycodestyle" },
			plugins = {
				pycodestyle = {
					-- enabled = true,
					maxLineLength = 88, -- Change this to your preferred limit
				},
				-- pyls_mypy = { enabled = true },
				-- pyflakes = { enabled = true },
			},
		},
	},
})

lspconfig.clangd.setup({
	cmd = { "clangd", "--clang-tidy" },
})
