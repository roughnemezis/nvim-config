vim.api.nvim_create_user_command('LazyGit', function()
  -- print 'Listing all buffers:'
  -- for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
  --   print(bufnr, vim.api.nvim_buf_get_name(bufnr))
  -- end
  local lazygit_bufnr = nil
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_name(bufnr):match 'lazygit$' then
      lazygit_bufnr = bufnr
      -- print('Found existing lazygit buffer: ' .. bufnr)
      break
    end
  end

  if lazygit_bufnr and vim.api.nvim_buf_is_valid(lazygit_bufnr) then
    -- print('Switching to existing lazygit buffer: ' .. lazygit_bufnr)
    vim.api.nvim_set_current_buf(lazygit_bufnr)
    vim.cmd 'startinsert'
  else
    -- print 'Creating new lazygit buffer'
    vim.cmd 'term lazygit'
    local term_buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_name(term_buf, 'lazygit')
    vim.cmd 'startinsert'
  end
end, {})

vim.api.nvim_create_user_command('GetCodeblocks', function(opts)
  -- package.loaded['custom.plugins.term'] = nil
  local term = require 'custom.plugins.term'
  local start = tonumber(opts.fargs[1])
  local stop = tonumber(opts.fargs[2])
  local num_blocks = tonumber(opts.fargs[3])
  -- term.get_codeblocks(start, stop, num_blocks)
  term.send_codeblocks_before_cursor()
end, { nargs = '*' })

vim.api.nvim_create_user_command('DeleteFile', function()
  local filename = vim.api.nvim_buf_get_name(0)
  if filename ~= '' then
    os.execute('gio trash "' .. filename .. '"')
  end
  require('custom.plugins.utils').destroy_buffer()
end, {})
