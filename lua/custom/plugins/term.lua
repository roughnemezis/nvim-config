local M = {}

local current_repl = nil

M.fire_repl = function()
  if current_repl ~= nil and vim.api.nvim_buf_is_valid(current_repl.bufnr) then
    print 'A REPL is already running.'
    return
  end
  vim.cmd.split()
  vim.cmd 'terminal'
  local buf_id = vim.api.nvim_get_current_buf()
  local chan_id = vim.api.nvim_get_option_value('channel', { buf = buf_id })
  current_repl = {
    bufnr = buf_id,
    channel_id = chan_id,
  }
end

M.repl_info = function()
  print(vim.inspect(current_repl))
end

M.send_visual = function()
  vim.cmd.normal { '"zy', bang = true }
  local selection = vim.fn.getreg 'z'
  vim.fn.chansend(current_repl.channel_id, selection .. '\n')
end

return M
