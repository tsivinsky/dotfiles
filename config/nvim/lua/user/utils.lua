local M = {}

local function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

M.nmap = function(shortcut, command)
	map("n", shortcut, command)
end

M.list_includes_item = function(list, item)
	for _, value in pairs(list) do
		if value == item then
			return true
		end
	end

	return false
end

return M
