" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'rking/ag.vim'

" Initialize plugin system
call plug#end()

" Various vim customizations
set number
set cursorline
set relativenumber
set ignorecase
set smartcase

" max len line
set colorcolumn=90

" shortcut to paste from clipboard without indentation
set pastetoggle=<F10>

"Solarized colorscheme setup
syntax enable
set background=dark
set t_Co=256
let g:solarized_termtrans=1
let g:solarized_termcolors=16
colorscheme solarized

"footer config
let g:airline_theme="simple"
let g:tmuxline_theme = 'airline_insert'
let g:airline#extensions#tabline#enabled = 1

"Disable arrow keys in normal and insert mode
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Down> <Nop>
nnoremap <Up> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Down> <Nop>
inoremap <Up> <Nop>

" maps jk to escape
inoremap jk <Esc>

" auto indentation
set autoindent
set smartindent
set cindent

" tab makes spaces
set tabstop =2
set softtabstop =2
set shiftwidth =2
set expandtab

" remap switching between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ctrl p setup - ignores same as .gitignore files
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" see https://gist.github.com/bsag/39eb930087c46521b763
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" find and remove trailing spaces using \rtw
match ErrorMsg '\s\+$'
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" syntastic setup
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_ruby_checkers=['rubocop']
