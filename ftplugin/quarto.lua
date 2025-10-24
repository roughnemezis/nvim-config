vim.bo.expandtab = true
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = "v:lua.require'custom.plugins.folding'.markdown_foldexpr()"
vim.opt_local.foldlevel = 99
vim.opt_local.foldtext = ''
vim.opt_local.fillchars = 'fold: '
vim.opt.foldcolumn = '3'
vim.cmd 'highlight! link Folded DiffText'

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWrite' }, {
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'quarto' then
      require('custom.plugins.folding').compute_fold_levels()
      local keys = vim.api.nvim_replace_termcodes('<esc>zx', true, false, true)
      vim.api.nvim_feedkeys(keys, 'm', false)
    end
  end,
})

vim.cmd 'highlight Folded guibg=NONE'

local function insert_python_code_block()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local lines = { '```{python}', '', '```' }
  vim.api.nvim_buf_set_lines(0, row, row, false, lines)
  vim.api.nvim_win_set_cursor(0, { row + 2, 0 })
  vim.cmd 'startinsert'
end

local function split_python_code_block()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local lines = { '```', '', '```{python}' }
  vim.api.nvim_buf_set_lines(0, row, row, false, lines)
end

vim.keymap.set('n', '<leader>cc', insert_python_code_block, { desc = 'Insert Python code block' })
vim.keymap.set('n', '<leader>cs', split_python_code_block, { desc = 'Split Python code block' })
