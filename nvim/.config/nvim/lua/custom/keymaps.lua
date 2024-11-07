-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

vim.keymap.set('i', '<C-l>', 'copilot#Accept("")', { noremap = true, silent = true, expr = true, replace_keycodes = false })
vim.keymap.set('n', '<leader>q', ':qa!<CR>')
vim.keymap.set('n', '<leader>Y', [[gg"+yG'']])
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Window resize
vim.keymap.set('n', '<M-.>', '<c-w>5<')
vim.keymap.set('n', '<M-,>', '<c-w>5>')
vim.keymap.set('n', '<M-t>', '<C-W>+')
vim.keymap.set('n', '<M-s>', '<C-W>-')

---
-- remaps
vim.keymap.set('n', '<leader>q', ':qa!<CR>')
vim.keymap.set('n', '<leader><BS>', ':NvimTreeToggle<CR>')

-- copy from clipboard to input file
vim.keymap.set('n', '<F4>', '<cmd>silent !xclip -o -sel clip > ~/codes/X/in<CR>')
vim.keymap.set('n', '<F6>', '<cmd>!g++ % -D LOCAL -std=c++17 -o ~/codes/X/program && (timeout 5 ~/codes/X/program < ~/codes/X/in) >  ~/codes/X/out<CR>')

-- copy template to current file
vim.keymap.set('n', '<leader>t', ':!cp ~/codes/cp/template.cpp %<CR><CR>')

-- next greatest remap ever : asbjornHaland
-- copying
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [[gg"+yG'']])

vim.keymap.set('n', 'p', [["0p]])

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- keep the block selected and retain correct indentation
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- keep the block selected while indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- keep cursor fixed
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- copy from clipboard to input file
vim.keymap.set('n', '<F4>', '<cmd>silent !xclip -o -sel clip > ~/codes/X/in<CR>')
vim.keymap.set('n', '<F6>', '<cmd>!g++ % -D LOCAL -std=c++17 -o ~/codes/X/program && (timeout 5 ~/codes/X/program < ~/codes/X/in) >  ~/codes/X/out<CR>')

-- copy template to current file
vim.keymap.set('n', '<leader>t', ':!cp ~/codes/cp/template.cpp %<CR><CR>')

-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]])

-- next greatest remap ever : asbjornHaland
-- copying
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [[gg"+yG'']])

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- This is going to get me cancelled
vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('n', 'Q', '<nop>')
