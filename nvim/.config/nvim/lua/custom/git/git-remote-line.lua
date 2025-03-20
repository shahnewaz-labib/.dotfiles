return {
  {
    'shahnewaz-labib/git-remote-line.nvim',
    config = function()
      require('git-remote-line').setup()
      vim.keymap.set('n', '<leader>grl', ':GRL copy<CR>', { desc = 'Copy GitHub permalink' })
      vim.keymap.set('n', '<leader>gro', ':GRL open<CR>', { desc = 'Open GitHub permalink in browser' })

      vim.keymap.set('v', '<leader>grl', ':GRL copy<CR>', { desc = 'Copy GitHub permalink for selection' })
      vim.keymap.set('v', '<leader>gro', ':GRL open<CR>', { desc = 'Open GitHub permalink for selection' })
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },
}
