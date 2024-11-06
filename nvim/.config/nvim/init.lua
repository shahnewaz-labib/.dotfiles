require 'custom'
require 'custom.options'
require 'custom.keymaps'
require 'custom.autocommands'

require('lazy').setup({
  'tpope/vim-sleuth',
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  'github/copilot.vim',

  require 'custom.autocompletion',
  require 'custom.autoformat',
  require 'custom.autopairs',
  require 'custom.colorscheme',
  require 'custom.debug',
  require 'custom.gitsigns',
  require 'custom.gitsigns',
  require 'custom.harpoon',
  require 'custom.indent_line',
  require 'custom.lint',
  require 'custom.lsp',
  require 'custom.misc',
  require 'custom.neo-tree',
  require 'custom.telescope',
  require 'custom.treesitter',
  require 'custom.whichkey',
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
