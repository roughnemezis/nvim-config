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
    local state = M.get_repl_state()
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

M.send = function(text)
  vim.fn.chansend(current_repl.channel_id, text .. '\n')
  local term_win = vim.fn.bufwinid(current_repl.bufnr)
  local n = vim.api.nvim_buf_line_count(current_repl.bufnr)
  vim.api.nvim_win_set_cursor(term_win, { n, 0 })
end

M.send_line = function()
  local pos = vim.fn.getpos '.'
  local lines = vim.api.nvim_buf_get_lines(0, pos[2] - 1, pos[2], false)
  print(vim.inspect(lines))
  local content = table.concat(lines, '\n')
  M.send(content)
end

M.send_visual = function()
  vim.cmd.normal { '"zy', bang = true }
  local selection = vim.fn.getreg 'z'
  M.send(selection)
end

M.send_motion = function(motion)
  local start_pos = vim.api.nvim_buf_get_mark(0, '[')
  local end_pos = vim.api.nvim_buf_get_mark(0, ']')
  print(vim.inspect(start_pos), vim.inspect(end_pos))
  local lines = vim.api.nvim_buf_get_lines(0, start_pos[1] - 1, end_pos[1], false)
  if #lines == 0 then
    return
  end
  -- Adjust the first and last line to include the correct columns
  lines[1] = string.sub(lines[1], start_pos[2])
  lines[#lines] = string.sub(lines[#lines], 1, end_pos[2] + 1)
  local content = table.concat(lines, '\n')
  M.send(content)
end

return M
