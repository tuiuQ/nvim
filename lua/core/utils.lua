local setKeymap = vim.keymap.set
local opt = vim.opt
local keymapsConfig = require("core.keymappings")
local optionsConfig = require("core.options")
local M = {}

M.loadKeymapsConfig = function(moduleName, loaded)
	M.mode_adapters = keymapsConfig.mode_adapters
	M.generic_opts = keymapsConfig.generic_opts

	loaded(keymapsConfig[moduleName])
end

M.keymap = {
	load = function (moduleName)
		M.loadKeymapsConfig(moduleName, M.parseMap)
	end
}

M.load_default_options = function()
	for key, value in pairs(optionsConfig.default_options) do
		opt[key] = value
	end
end

M.parseMap = function(keymap)
	for mode, map in pairs(keymap) do
		for key, action in pairs(map) do
			setKeymap(
				M.mode_adapters[mode],
				key,
				action,
				M.generic_opts[mode]
			)
		end
	end
end

return M
