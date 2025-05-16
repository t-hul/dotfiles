local options = {
  -- Define your formatters
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    -- javascript = { "prettierd", "prettier", stop_after_first = true },
    cpp = { "clang-format" },
    tex = { "latexindent" },
    plaintex = { "latexindent" },
  },
  -- Set default options
  default_format_opts = {
    lsp_format = "fallback",
  },
  -- Set up format-on-save
  format_on_save = { timeout_ms = 1000 },
  -- Customize formatters
  formatters = {
    shfmt = {
      prepend_args = { "-i", "2" },
    },
  },
}

return options
