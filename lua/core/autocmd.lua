vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		if vim.v.event.operator == "p" then
			vim.cmd(":%s/\\r//g")
		end
	end
})
