vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- keep the block selected and retain correct indentation
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep the block selected while indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- keep cursor fixed
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- copy from clipboard to input file
vim.keymap.set("n", "<F4>", "<cmd>silent !xclip -o -sel clip > ~/codes/X/in<CR>")
vim.keymap.set("n", "<F6>", "<cmd>!g++ % -D LOCAL -std=c++17 -o ~/codes/X/program && (timeout 5 ~/codes/X/program < ~/codes/X/in) >  ~/codes/X/out<CR>")

-- copy template to current file
vim.keymap.set("n", "<leader>t", ":!cp ~/codes/cp/template.cpp %<CR><CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- close everything
vim.keymap.set("n", "<leader>q", ":qa!<CR>")

-- next greatest remap ever : asbjornHaland
-- copying
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [[gg"+yG'']])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
