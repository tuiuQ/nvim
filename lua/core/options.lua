local default_options = {
	opt = {
		number = true,
		relativenumber = true,
		tabstop = 2,
		shiftwidth = 2,
		termguicolors = true,
		foldmethod = 'expr',
		foldexpr = 'nvim_treesitter#foldexpr()',
		foldlevel = 99,
		clipboard = "unnamedplus"
	},
	g = {
		mapleader = " ",
		maplocalleader = "\\",
		termguicolors = true,
	}
}

for mode, options in pairs(default_options) do
	for key, value in pairs(options) do
		vim[mode][key] = value
	end
end
