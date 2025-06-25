-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.keymap.set({ 'i' }, '<c-c>', '<nop>')

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set({ 'n' }, '<leader>ev', '<Cmd>tabedit $MYVIMRC<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<C-x>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set({ 'i', 'v' }, '<C-x>', '<Esc>', { desc = 'Exit insert/visual mode' })

-- Folds
vim.keymap.set('n', 'za', 'zA', { desc = 'open fold under cursor recursively' })
vim.keymap.set('n', 'zc', 'zC', { desc = 'close fold under cursor recursively' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set({ 'n' }, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n' }, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set({ 'n' }, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n' }, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w><C-k>', { desc = 'Move focus to the upper window' })

-- ##############      OIL             ##########################
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '+', '<CMD>Oil --float<CR>', { desc = 'Open parent directory - in floating window' })

-- ##############      Simple REPL             ##########################
vim.api.nvim_create_user_command('Repl', function(opts)
  require('custom.plugins.term').toggle_repl()
end, { range = false })

vim.keymap.set('n', '<leader>vx', '<CMD>vsplit +Repl<CR>', { desc = 'Open REPL in vertical split' })
vim.keymap.set('n', '<leader>xx', '<CMD>split +Repl<CR>', { desc = 'Open REPL in horizontal split' })
vim.keymap.set('n', '<leader>rx', '<CMD>Repl<CR>', { desc = 'Open REPL in current window' })

vim.keymap.set('v', 's', function()
  require('custom.plugins.term').send_visual()
end, { desc = 'Send visual selection to REPL' })

vim.keymap.set({ 'n', 'i' }, '<A-s>', function()
  require('custom.plugins.term').send_line()
end, { desc = 'Send current line to REPL' })

vim.keymap.set({ 'n' }, 's', function()
  vim.go.operatorfunc = "v:lua.require'custom.plugins.term'.send_motion"
  return 'g@'
end, { expr = true, desc = 'Send lines to REPL using a motion' })
