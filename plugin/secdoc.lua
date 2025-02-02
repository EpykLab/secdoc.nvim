-- This file is just for vim to auto-load the plugin
if vim.fn.has("nvim-0.7") == 0 then
	vim.api.nvim_err_writeln("sse-notations requires at least nvim-0.7")
	return
end

-- prevent loading file twice
if vim.g.loaded_sse_notations == 1 then
	return
end
vim.g.loaded_sse_notations = 1
