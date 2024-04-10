local vim = vim

require("labib.lazy")
require("labib.mason")
require("labib.treesitter")
require("labib.nvim-cmp")
require("labib.none-ls")
require("labib.nvimtree")
require("labib.set")
require("labib.telescope")
require("labib.harpoon")
require("labib.whichkey")
require("labib.neodev")
require("labib.keymaps")
require("labib.toggleterm")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
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
