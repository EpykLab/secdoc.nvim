local M = {}

local default_config = {
	templates = {
		security_control = [[
// @security-control %s
// @lifecycle-phase: %s
// @design-principle: %s
// @description: %s
// @verification: %s]],

		requirement = [[
// @requirement %s
// @description: %s
// @verification: %s
// @stakeholder: %s]],
	},
	keymaps = {
		security_control = "<Leader>sc",
		requirement = "<Leader>sr",
	},
}

local config = vim.deepcopy(default_config)

function M.setup(opts)
	config = vim.tbl_deep_extend("force", default_config, opts or {})
end

function M.get()
	return config
end

function M.get_template(name)
	return config.templates[name]
end

return M
