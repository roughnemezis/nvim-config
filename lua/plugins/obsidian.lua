return {
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    ft = 'markdown',
    lazy = false,
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    config = function()
      require('obsidian').setup {
        ui = {
          enable = false,
        },
        legacy_commands = false,
        frontmatter = {
          enabled = false,
          func = require('obsidian.builtin').frontmatter,
          sort = { 'id', 'aliases', 'tags' },
        },
        workspaces = {
          {
            name = 'main',
            path = '~/Documents/obsidian-vaults/hugo-main-vault/',
          },
        },
        ---@class obsidian.config.DailyNotesOpts
        ---
        ---@field folder? string
        ---@field date_format? string
        ---@field alias_format? string
        ---@field template? string
        ---@field default_tags? string[]
        ---@field workdays_only? boolean
        daily_notes = {
          folder = 'notes/daily',
          date_format = nil,
          alias_format = nil,
          default_tags = { 'daily-notes' },
          workdays_only = true,
        },
      }
    end,
  },
}
