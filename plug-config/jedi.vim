" Pour que le showcallsignature marche il faut etre en noshowmode d'après la
" doc de jedi mais apparemment ça la désactive
" (auparavant elle était activée mais avec showmode le buffer devenait
" illisible)
set noshowmode
" Disable Jedi-vim autocompletion and enable call-signatures options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "0"


