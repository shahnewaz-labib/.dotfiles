vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_augroup('neotree', {})
vim.api.nvim_create_autocmd('UiEnter', {
  desc = 'Open Neotree automatically',
  group = 'neotree',
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd 'Neotree toggle'
      vim.cmd 'setlocal nonumber norelativenumber'
    end
  end,
})

-- stop annoying warnings
local notify = vim.notify
---@diagnostic disable-next-line
vim.notify = function(msg, ...)
  if msg:match 'warning: multiple different client offset_encodings' then
    return
  end

  notify(msg, ...)
end

vim.api.nvim_create_user_command('PeekOpen', function()
  local peek = require 'peek'
  if not peek.is_open() and vim.bo[vim.api.nvim_get_current_buf()].filetype == 'markdown' then
    vim.fn.system 'i3-msg split horizontal'
    peek.open()
  end
end, {})

vim.api.nvim_create_user_command('PeekClose', function()
  local peek = require 'peek'
  if peek.is_open() then
    peek.close()
    vim.fn.system 'i3-msg move left'
  end
end, {})

-- resize splits if window got resized
vim.api.nvim_create_augroup('resize-splits', {})
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  group = 'resize-splits',
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd 'tabdo wincmd ='
    vim.cmd('tabnext ' .. current_tab)
  end,
})
