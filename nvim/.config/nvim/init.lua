require 'custom'
require 'config.options'
require 'config.keymaps'

require('lazy').setup({
  'tpope/vim-sleuth',
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  'github/copilot.vim',

  { 'MunifTanjim/nougat.nvim' },

  {
    'toppair/peek.nvim',
    event = { 'VeryLazy' },
    build = 'deno task --quiet build:fast',
    config = function()
      require('peek').setup {
        auto_load = true, -- whether to automatically load preview when entering another markdown buffer
        close_on_bdelete = true, -- close preview window on buffer delete
        syntax = true, -- enable syntax highlighting, affects performance
        theme = 'dark', -- 'dark' or 'light'
        update_on_change = true,
        app = 'browser', -- 'webview', 'browser', string or a table of strings
        filetype = { 'markdown' }, -- list of filetypes to recognize as markdown
        -- relevant if update_on_change is true
        throttle_at = 200000, -- start throttling when file exceeds this
        -- amount of bytes in size
        throttle_time = 'auto', -- minimum amount of time in milliseconds
        -- that has to pass before starting new render
      }

      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
  },

  require 'custom.autocompletion',
  require 'custom.autoformat',
  require 'custom.autopairs',
  require 'custom.colorscheme',
  require 'custom.debug',
  require 'custom.gitsigns',
  require 'custom.gitsigns',
  require 'custom.harpoon',
  require 'custom.indentline',
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

require 'custom.statusline'
require 'config.autocommands'
