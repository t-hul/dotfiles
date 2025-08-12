-- run md-to-pdf to convert current .md to .pdf
-- for more info about md-to-pdf visit: https://www.npmjs.com/package/md-to-pdf
local wk = require("which-key")

function SaveAndRunMdToPdf()
	local current_file = vim.fn.expand("%:p") -- absolute path, use "%" for relative path

	vim.cmd("write")

	vim.fn.system("md-to-pdf " .. current_file)

	print("Created pdf from " .. current_file .. " (by md-to-pdf)")
end

wk.add({
	{
		"<leader>mp",
		":lua SaveAndRunMdToPdf()<cr>",
		desc = "Save and convert markdown to PDF",
		mode = "n",
		buffer = 0, -- current buffer only
	},
})
