local default_options = {
	opt = {
		number = true,
		relativenumber = true,
		tabstop = 2,
		shiftwidth = 2
	},
	g = {
		mapleader = " ",
		maplocalleader = "\\",
	}
}

for mode, options in pairs(default_options) do
	for key, value in pairs(options) do
		vim[mode][key] = value
	end
end
