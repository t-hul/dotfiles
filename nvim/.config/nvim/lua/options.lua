require("nvchad.options")

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- resize active window to minimum width if not in excluded_filetypes
local min_width = 94

-- Define filetypes to exclude from resizing
local excluded_patterns = {
	"^NvimTree",
	"^terminal$",
	"^TelescopePrompt",
	"^TelescopeResults",
	"^packer$",
	"^qf$", -- Quickfix window
	"^help$",
	"^dashboard$",
	"^lazy$", -- Lazy.nvim UI
	"^notify$",
}

vim.api.nvim_create_autocmd("WinEnter", {
	pattern = "*",
	callback = function()
		local win_id = vim.api.nvim_get_current_win()
		local buf_id = vim.api.nvim_win_get_buf(win_id)
		local filetype = vim.bo[buf_id].filetype
		print(filetype)

		-- Check if filetype matches any excluded pattern
		for _, pattern in ipairs(excluded_patterns) do
			if filetype:match(pattern) then
				return -- Exit function without resizing
			end
		end

		-- Apply resizing only if it's an editor window
		if vim.api.nvim_win_get_width(win_id) < min_width then
			vim.cmd("vertical resize " .. min_width)
		end
	end,
})

-- pop up diagnostics on hover
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
})

if vim.fn.has("wsl") == 1 then
	vim.opt.clipboard:append("unnamedplus")
end
