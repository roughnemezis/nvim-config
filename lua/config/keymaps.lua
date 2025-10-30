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

-- nvigation between buffers
--
vim.keymap.set('n', '<C-n>', '<CMD>bnext<CR>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '<C-p>', '<CMD>bprevious<CR>', { desc = 'Go to previous buffer' })
vim.keymap.set('t', '<C-n>', '<C-\\><C-n><CMD>bnext<CR>', { desc = 'Go to next buffer' })
vim.keymap.set('t', '<C-p>', '<C-\\><C-n><CMD>bprevious<CR>', { desc = 'Go to previous buffer' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set({ 'n' }, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n' }, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set({ 'n' }, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n' }, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w><C-k>', { desc = 'Move focus to the upper window' })

-- ##############      QUICKFIX             ##########################
--
--
vim.keymap.set('n', '<M-j>', '<CMD>cnext<CR>', { desc = 'Next item in quickfix' })
vim.keymap.set('n', '<M-k>', '<CMD>cprevious<CR>', { desc = 'Previous item in quickfix' })

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

local function insertFullPath()
  local filepath = vim.fn.expand '%'
  vim.fn.setreg('+', filepath) -- write to clippoard
end

vim.keymap.set('n', '<leader>yp', insertFullPath, { noremap = true, silent = true })

-- ##############      LazyGit             ##########################
--

vim.keymap.set('n', '<leader>lg', '<CMD>LazyGit<CR>', { desc = 'Open Lazygit' })

-- ##############      Additionnal utilities ##########################
--

vim.keymap.set({ 'n' }, '<leader>bd', function()
  require('custom.plugins.utils').destroy_buffer()
end, { desc = 'Destroy current buffer but do not close its window' })
