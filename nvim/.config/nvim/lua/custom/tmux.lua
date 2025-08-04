return {
  "christoomey/vim-tmux-navigator",
  event = "VimEnter",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<C-w>h", "<cmd>TmuxNavigateLeft<cr>" },
    { "<C-w>j", "<cmd>TmuxNavigateDown<cr>" },
    { "<C-w>k", "<cmd>TmuxNavigateUp<cr>" },
    { "<C-w>l", "<cmd>TmuxNavigateRight<cr>" },
    { "<C-w>\\", "<cmd>TmuxNavigatePrevious<cr>" },
  },
}
