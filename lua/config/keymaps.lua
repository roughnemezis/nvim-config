-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.keymap.set({ 'i' }, '<c-c>', '<nop>')

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set({ 'n' }, '<leader>ev', '<Cmd>tabedit $MYVIMRC<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<A-l>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

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
vim.keymap.set('n', '<leader>sx', '<CMD>split +Repl<CR>', { desc = 'Open REPL in horizontal split' })
vim.keymap.set('n', '<leader>rx', '<CMD>Repl<CR>', { desc = 'Open REPL in current window' })

vim.keymap.set('v', 'm', function()
  require('custom.plugins.term').send_visual()
end, { desc = 'Send visual selection to REPL' })

vim.keymap.set({ 'n', 'i' }, '<A-m>', function()
  require('custom.plugins.term').send_line()
end, { desc = 'Send current line to REPL' })

vim.keymap.set({ 'n' }, 'm', function()
  vim.go.operatorfunc = "v:lua.require'custom.plugins.term'.send_motion"
  return 'g@'
end, { expr = true, desc = 'Send lines to REPL using a motion' })
