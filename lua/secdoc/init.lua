-- lua/sse-notations/init.lua
local M = {}
local config = require("secdoc.config")
local utils = require("secdoc.utils")

function M.insert_security_control()
	local control_id = vim.fn.input("Control ID: ")
	local phase = vim.fn.input("Lifecycle Phase: ")
	local principle = vim.fn.input("Design Principle: ")
	local description = vim.fn.input("Description: ")
	local verification = vim.fn.input("Verification: ")

	local notation =
		string.format(config.get_template("security_control"), control_id, phase, principle, description, verification)

	utils.insert_at_cursor(notation)
end

function M.insert_requirement()
	local req_id = vim.fn.input("Requirement ID: ")
	local description = vim.fn.input("Description: ")
	local verification = vim.fn.input("Verification: ")
	local stakeholder = vim.fn.input("Stakeholder: ")

	local notation = string.format(config.get_template("requirement"), req_id, description, verification, stakeholder)

	utils.insert_at_cursor(notation)
end

function M.setup(opts)
	config.setup(opts)

	-- Create commands
	vim.api.nvim_create_user_command("InsertSecurityControl", M.insert_security_control, {})
	vim.api.nvim_create_user_command("InsertRequirement", M.insert_requirement, {})

	-- Set up keymaps
	if config.get().keymaps then
		vim.keymap.set(
			"n",
			config.get().keymaps.security_control,
			M.insert_security_control,
			{ desc = "Insert Security Control" }
		)
		vim.keymap.set("n", config.get().keymaps.requirement, M.insert_requirement, { desc = "Insert Requirement" })
	end
end

return M
