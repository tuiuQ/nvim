require("toggleterm").setup({
	size = 20, -- 终端窗口的大小
	open_mapping = [[<c-\>]], -- 切换终端的快捷键
	hide_numbers = true, -- 切换终端时隐藏行号
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert_mode = true,
	insert_mode = true,
	direction = "horizontal", -- 终端的方向：float, horizontal, vertical
	close_on_exit = true, -- 退出终端时关闭窗口
	shell = vim.o.shell, -- 使用的 shell
	float_opts = {
		border = "curved", -- 浮动窗口的边框样式
		width = 120,
		height = 40,
		winblend = 3,
	},
})

vim.api.nvim_create_user_command("ToggleTermSplit", function()
	require("toggleterm").toggle()

	vim.defer_fn(function()
		local term_win = vim.api.nvim_get_current_win()
		vim.cmd("vsplit")
		local new_win = vim.api.nvim_get_current_win()

		vim.cmd("wincmd H")
		vim.cmd("wincmd =")

		vim.api.nvim_set_current_win(term_win);
	end, 100)
end, {})
