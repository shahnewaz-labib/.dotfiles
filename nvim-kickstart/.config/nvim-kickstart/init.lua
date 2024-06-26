require("labib.lazy")
require("labib.mason")
require("labib.treesitter")
require("labib.nvim-cmp")
require("labib.none-ls")
require("labib.nvimtree")
require("labib.set")
require("labib.telescope")
require("labib.harpoon")
require("labib.neodev")
require("labib.keymaps")
require("labib.toggleterm")
require("labib.nvim-ts-autotag")

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- stop annoying warnings
local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end

	notify(msg, ...)
end
