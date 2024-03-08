local setKeymap = vim.keymap.set
local keymapsConfig = require("core.keymappings")
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
