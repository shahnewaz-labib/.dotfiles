vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.splitbelow = true
vim.g.splitright = true
vim.g.splitkeep = "cursor"

vim.g.autoindent = true
vim.g.smartindent = true

vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.cursorline = true

vim.opt.guicursor = ""

-- colors
-- vim.cmd.colorscheme("gruvbox")
-- vim.cmd.colorscheme("sonokai")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.cmd([[ highlight clear SignColumn ]])

vim.g.copilot_assume_mapped = true

vim.o.relativenumber = false
vim.o.scrolloff = 10

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
-- Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- filetypes
vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
