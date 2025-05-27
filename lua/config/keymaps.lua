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

-- Folds
vim.keymap.set('n', 'za', 'zA', { desc = 'open fold under cursor recursively' })
vim.keymap.set('n', 'zc', 'zC', { desc = 'close fold under cursor recursively' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set({ 'n', 't' }, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n', 't' }, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set({ 'n', 't' }, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n', 't' }, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- ##############      OIL             ##########################
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '+', '<CMD>Oil --float<CR>', { desc = 'Open parent directory - in floating window' })
