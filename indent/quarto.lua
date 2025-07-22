-- vim.cmd 'filetype indent off' -- prevents loading of indent file which would shadow our settings
-- since no indentexpr is defined, autoindent will be off but we could use our own indentexpr
-- (it happens to be returning -1 now - same as keep the same level of indent)
-- vim.opt_local.indentexpr = "v:lua.require'custom.plugins.folding'.get_indent()"
vim.opt_local.indentexpr = ''
vim.b.did_indent = 1 -- should ensure no other indent file is executed
