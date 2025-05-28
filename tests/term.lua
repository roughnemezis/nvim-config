-- semble une bonne idée de wrapper les raccourcis dans la commande reload
-- si on le fait en dehors: la fonction appelée est dans l'état ou était le module lorsque le raccourci a
-- été défini
vim.api.nvim_create_user_command('ReloadTerm', function(opts)
  package.loaded['custom.plugins.term'] = nil
  vim.keymap.set({ 'v' }, '<C-x>', require('custom.plugins.term').send_visual, { noremap = true })
  vim.keymap.set({ 'n' }, '<C-i>', require('custom.plugins.term').repl_info, { noremap = true })
end, { range = false })

vim.keymap.set({ 'n' }, '<leader>r', '<CMD>ReloadTerm<CR>', { noremap = true, silent = true })
