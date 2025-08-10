vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		if vim.v.event.operator == "p" then
			vim.cmd(":%s/\\r//g")
		end
	end
})

-- Autocmd to set options for specific filetypes
local options_group = vim.api.nvim_create_augroup("BufferOptions", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = options_group,
    pattern = "*", -- All filetypes
    callback = function()
        -- Call the function defined in options.lua
        if vim.fn.exists("_G.set_buffer_options") then
            _G.set_buffer_options()
        end
    end,
})
