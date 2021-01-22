" *********************** Configuration générale ************************

tnoremap jk <C-\><C-n>

" éditer ma base de connaissances perso sur vim
nnoremap <leader>notes :vsp $HOME/local/vimtuto/notes.txt<cr>
nnoremap <leader>todo :vsp $HOME/local/vimtuto/TODO.txt<cr>
" pour créer un nouveau fichier si on navigue vers un fichier inexistant avec
" gf
map gf :e <cfile><CR>

let mapleader=","
let maplocalleader="%"

"cf.:   https://vim.fandom.com/wiki/Search_and_replace_the_word_under_the_cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
" Selection d'un mot
noremap <space> viw
" effacer une ligne en mode insertion
inoremap <c-d> <esc>ddi
" exécuter une commande vimscript sous le curseur en mode normal
nnoremap <leader>x yy:<c-r>"<enter>

" editer le vimrc rapidement
nnoremap <leader>ev :split $MYVIMRC<cr>
" sourcer le vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
"     Déplacement dans les splits
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h
" Sortir du mode insertion
inoremap <c-c> <nop>
inoremap jk <esc>
" Pour agrandir et réduire plus facilement les splits : 
nmap <c-w>+ <c-w>5+<SID>ws
nmap <c-w>- <c-w>5-<SID>ws
nn <script> <SID>ws+ <C-W>5+<SID>ws
nn <script> <SID>ws- <C-W>5-<SID>ws
nmap <SID>ws <Nop> 
nmap <c-w>> <c-w>5><SID>ws
nmap <c-w>< <c-w>5<<SID>ws
nn <script> <SID>ws> <C-W>5><SID>ws
nn <script> <SID>ws< <C-W>5<<SID>ws
nmap <SID>ws <Nop>


"mettre un mot entre quotes
nnoremap "iw ciw""<esc>P
nnoremap "aw caw""<esc>P
nnoremap 'iw ciw''<esc>P
nnoremap 'aw caw''<esc>P
" note : on pourrait trouver un moyen de définir une commande sur les
" text-objects, ce serait moins laborieux ...

tnoremap <C-l> <Nop>

" *************************** Abbréviations utiles**************************
"
iabbrev  coding # -*- coding: utf-8 -*-
iabbrev  ipdb import ipdb; ipdb.set_trace()

