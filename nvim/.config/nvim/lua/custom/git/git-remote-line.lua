return {
  {
    'shahnewaz-labib/git-remote-line.nvim',
    config = function()
      require('git-remote-line').setup()
      vim.keymap.set({ 'n', 'v' }, '<leader>grl', ':GRL copy<CR>', { desc = 'Copy GitHub permalink' })
      vim.keymap.set({ 'n', 'v' }, '<leader>gro', ':GRL open<CR>', { desc = 'Open GitHub permalink in browser' })
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },
}
