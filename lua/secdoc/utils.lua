local M = {}

function M.insert_at_cursor(text)
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, vim.split(text, "\n"))
end

-- Helper function to validate control ID format
function M.validate_control_id(id)
	-- Example: Check if matches pattern like "AC-1" or "IA-2"
	return string.match(id, "^%u%u%-%d+$") ~= nil
end

-- Helper function to trim whitespace
function M.trim(s)
	return s:match("^%s*(.-)%s*$")
end

return M
