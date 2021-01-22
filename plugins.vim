set nocompatible


let g:python_host_prog = $HOME.'/local/virtualenvs/neovim2/bin/python'
let g:python3_host_prog = $HOME.'/local/virtualenvs/neovim3/bin/python'

call plug#begin('~/.config/nvim/plugins')
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'esamattis/slimux'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-commentary'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'NLKNguyen/papercolor-theme'
Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'icymind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

