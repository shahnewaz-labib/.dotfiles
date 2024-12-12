require 'custom'
require 'custom.options'
require 'custom.keymaps'
require 'custom.autocommands'

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

require 'custom.statusline'

-- Don't move harpoon from here
local harpoon = require 'harpoon'
harpoon:setup()

vim.keymap.set('n', '<leader>a', function()
  harpoon:list():append()
end)
vim.keymap.set('n', '<C-e>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

-- vim.keymap.set('n', '<C-t>', function()
--   harpoon:list():select(1)
-- end)
-- vim.keymap.set('n', '<C-h>', function()
--   harpoon:list():select(2)
-- end)
-- vim.keymap.set('n', '<C-n>', function()
--   harpoon:list():select(3)
-- end)
-- vim.keymap.set('n', '<C-s>', function()
--   harpoon:list():select(4)
-- end)

-- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set('n', '<C-S-P>', function()
--   harpoon:list():prev()
-- end)
-- vim.keymap.set('n', '<C-S-N>', function()
--   harpoon:list():next()
-- end)
