local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local make_entry = require 'telescope.make_entry'
local conf = require('telescope.config').values

local M = {}

M.live_multigrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == '' then
        return nil
      end

      local pieces = vim.split(prompt, ' ')
      local args = { 'rg_multi.sh' }

      local i = 1
      while true do
        if pieces[i] == nil then
          break
        end
        table.insert(args, pieces[i])
        i = i + 1
      end

      if opts.cwd then
        table.insert(args, '--')
        table.insert(args, opts.cwd)
      end

      return args
    end,
    entry_maker = function(entry)
      return {
        value = entry,
        filename = vim.fs.joinpath(opts.cwd, entry),
        display = entry,
        ordinal = entry,
      }
    end,
  }
  pickers
    .new(opts, {
      debounce = 100,
      prompt_title = 'Multi Grep',
      finder = finder,
      previewer = conf.grep_previewer(opts),
      sorter = require('telescope.sorters').empty(),
    })
    :find()
end

return M
