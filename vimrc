" Install vim-plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'
"Plug 'valloric/youcompleteme'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Plug 'scrooloose/nerdcommenter'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tmhedberg/SimpylFold'
"Plug 'mattn/emmet-vim'
"Plug 'powerman/vim-plugin-autosess'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Vim Plugin Configuration
let g:airline#extensions#tabline#enabled = 1

colorscheme onedark

" Mapping the leader
let mapleader = "\<Space>"

" Editor Settings
set noswapfile
set nowrap
set number
set numberwidth=4
set shiftwidth=4
set shiftround
set matchtime=2
" set clipboard=unnamedplus
set tabstop=4
set expandtab
set cursorline
set guioptions-=T  "remove toolbar
set path=$PWD/**
set smartcase

" Code folding for CSS files
autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
autocmd FileType *.css,*.scss,*.less setlocal omnifunc=csscomplete#CompleteCSS noci

" maximize the window on startup
augroup maximizewindow
    autocmd!
    autocmd VimEnter * call system('wmctrl -i -b add,maximized_vert,maximized_horz -r '.v:windowid)
augroup END

" Custom Mappings
inoremap <c-u> evbUe
inoremap jk <esc>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap H 0
nnoremap L $
nnoremap <leader>lf :execute "rightbelow vsplit " . bufname("#")<cr>
nnoremap <leader>;  :execute "normal! mqA;\<esc>`q"<cr>
nnoremap <c-b>  :bNext<cr>
nnoremap <c-n>  :bnext<cr>
nnoremap <leader>s :w<cr>
nnoremap <leader>d :bd<cr>

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

" Grep search remappings
nnoremap gr :grep -R <cword> *<CR>
nnoremap Gr :grep -R <cword> %:p:h/*<CR>
nnoremap gR :grep -R '\b<cword>\b' *<CR>
nnoremap GR :grep -R '\b<cword>\b' %:p:h/*<CR>

" onoremap in( :<c-u>normal! /(vi(<cr>
" Custom abbreviations
iabbrev @@ muhammadosamaarshad@gmail.com

" Autocommand groups
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" NERDTree config
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']

" Auto-close tag config
let g:closetag_filenames = '*.html, *.jsx, *.js'
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" JSX config
let g:jsx_ext_required = 0

" CtrlP config
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Emmet Vim config
"let g:user_emmet_leader_key='\<Space>'

