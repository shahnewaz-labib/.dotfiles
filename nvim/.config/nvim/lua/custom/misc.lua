return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- Animate stuff
      local is_many_wins = function(sizes_from)
        return vim.tbl_count(sizes_from) >= 3
      end
      local animate = require 'mini.animate'
      animate.setup {
        scroll = {
          timing = animate.gen_timing.linear { duration = 200, unit = 'total' },
          subscroll = animate.gen_subscroll.equal { max_output_steps = 120 },
        },
        cursor = {
          enable = true,
          timing = animate.gen_timing.linear { duration = 200, unit = 'total' },
          path = animate.gen_path.angle(),
        },
        -- Window resize
        resize = {
          enable = true,
          timing = animate.gen_timing.linear { duration = 200, unit = 'total' },
          subresize = animate.gen_subresize.equal { predicate = is_many_wins },
        },
      }

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
