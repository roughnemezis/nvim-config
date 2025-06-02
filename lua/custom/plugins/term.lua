local M = {}

local current_repl = nil

M.get_repl_state = function()
  if current_repl == nil then
    return { status = nil, win = nil }
  end
  local bufnr = current_repl.bufnr
  if vim.api.nvim_buf_is_valid(bufnr) then
    local win_found = nil
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == bufnr then
        win_found = win
        return { status = 'displayed', win = win_found }
      end
    end
    return { status = 'hidden', win = nil }
  end
  return { status = 'invalid', win = nil }
end

M.toggle_repl = function()
  if current_repl ~= nil then
    local state = M.get_buffer_state(current_repl.bufnr)
    -- print(vim.inspect(state))
    if state.status == 'displayed' then
      vim.api.nvim_win_close(state.win, false)
      return
    elseif state.status == 'hidden' then
      vim.api.nvim_set_current_buf(current_repl.bufnr)
      return
    end
  end
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
