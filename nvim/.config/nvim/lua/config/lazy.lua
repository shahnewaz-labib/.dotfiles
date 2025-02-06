local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require 'custom.ai.copilot',

  require 'custom.coding.autocompletion',
  require 'custom.coding.todo',
  require 'custom.coding.autoformat',

  require 'custom.git.gitsigns',
  require 'custom.git.vim-flog',

  require 'custom.coding.autopairs',
  require 'custom.debug',

  require 'custom.harpoon',
  require 'custom.indentline',
  require 'custom.lint',
  require 'custom.lsp',
  require 'custom.misc',
  require 'custom.neotree',
  require 'custom.telescope',
  require 'custom.treesitter',

  require 'custom.ui.nougat',
  require 'custom.ui.colorscheme',
  require 'custom.ui.whichkey',
  require 'custom.ui.peek',
  require 'custom.ui.vim-sleuth',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
