return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000,
    opts = { style = 'moon' },
    init = function()
      -- vim.cmd.colorscheme 'tokyonight-night'
      -- vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    -- init = function()
    --   vim.cmd.colorscheme 'kanagawa'
    -- end,
  },
  { 'sainnhe/gruvbox-material' },
  { 'morhetz/gruvbox' },
  { 'ellisonleao/gruvbox.nvim' },
  {
    'dgox16/oldworld.nvim',
    lazy = false,
    priority = 1000,
    styley = {
      booleans = { italic = true, bold = true },
    },
    init = function()
      vim.cmd.colorscheme 'oldworld'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}

-- require("oldworld").setup({
--     styles = {
--         booleans = { italic = true, bold = true },
--     },
--     integrations = {
--         hop = true,
--         telescope = false,
--     },
--     highlight_overrides = {
--         Comment = { bg = "#ff0000" }
--     }
-- })
