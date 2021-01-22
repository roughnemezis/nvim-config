" *********************** Configuration générale ************************
set hidden
set wildmode=longest,list ",full
set wildmenu
" activer la souris
set mouse=a
" Désactiver le bip et la visualbell
set noerrorbells visualbell t_vb=
"autocmd GUIEnter * set visualbell t_vb=
" Ouvrir un nouveau split en bas / à droite par défaut
set splitbelow
set splitright
" Schemas de couleurs 
syntax enable
" Mettre en relief la ligne courante
set cursorline
" Pouvoir quitter un buffer non sauvé
set hidden
" backup files dans un dossier spécifique et plus dans le dossier courant
set backupdir=$HOME/local/vimbackup,.
set directory=$HOME/local/vimbackup,.
set undodir=$HOME/local/vimbackup,.
" divers
set number
" Fuzzy file search (pour les commandes : gf, :find, etc...)
set path+=**
set wildmenu " semble activé par défaut dans neovim mais utile pour vim
" Copier coller dans le presse-papier système
set clipboard+=unnamed



" ***************************  Python **************************************
autocmd FileType python set foldmethod=indent
autocmd FileType python set foldnestmax=2


" ************************** Javascript ************************************
autocmd FileType javascript set shiftwidth=2

"*************************** autopep8 **********************************
" pour pouvoir utiliser pep8 pour indenter avec =
" cf: https://github.com/tell-k/vim-autopep8
autocmd FileType python set equalprg=autopep8\ -

