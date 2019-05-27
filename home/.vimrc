" call prior: curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" :call plug#begin('~/.config/nvim') if :PlugInstall not recognized

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin' ex. .vim/plugged
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'edkolev/tmuxline.vim'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Initialize plugin system
call plug#end()

" Various vim customizations
set number
set cursorline
set relativenumber
set ignorecase
set smartcase

" lazy redraw to speed up when syntax highlighting is heavy
set lazyredraw

" max len line
set colorcolumn=90

" shortcut to paste from clipboard without indentation
set pastetoggle=<F10>

" Solarized colorscheme setup
syntax enable
set background=dark
colorscheme gruvbox
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" footer config
let g:airline_theme="badwolf"
let g:tmuxline_theme = 'airline_insert'
let g:airline#extensions#tabline#enabled = 1

" Disable arrow keys in normal and insert mode
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

" search highlighting with <Ctrl-i>
nnoremap <silent> <C-i> :nohl<CR><C-l>

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

" move around lines
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

inoremap ∆ <Esc>:m .-2<CR>==gi
inoremap ˚ <Esc>:m .+1<CR>==gi

vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" ctrl p setup - ignores same as .gitignore files
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" see https://gist.github.com/bsag/39eb930087c46521b763
if executable('ag')
  " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast, respects .gitignore
  " and .agignore. Ignores hidden files by default.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
else
  "ctrl+p ignore files in .gitignore
  let g:ctrlp_user_command = [
      \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
      \ 'find %s -type f'
      \ ]
endif

" find and remove trailing spaces using \rtw
match ErrorMsg '\s\+$'
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" syntastic setup
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_ruby_checkers=['rubocop']

" copy to clipboard
set clipboard=unnamed

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" UltiSnips jumping
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-c>"

" Don't map any tabs, I'll do it later
let g:UltiSnipsExpandTrigger = '<NOP>'
let g:SuperTabMappingForward = '<NOP>'
let g:SuperTabMappingBackward = '<NOP>'
" Don't unmap my mappings
let g:UltiSnipsMappingsToIgnore = [ "SmartTab", "SmartShiftTab" ]

" Make <CR> smart
let g:ulti_expand_res = 0
function! Ulti_ExpandOrEnter()
  " First try to expand a snippet
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res
    " if successful, just return
    return ''
  elseif pumvisible()
    " if in completion menu - just close it and leave the cursor at the
    " end of the completion
    return deoplete#mappings#close_popup()
  else
    " otherwise, just do an "enter"
    return "\<return>"
  endif
endfunction
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>

" enable deoplete
set runtimepath+=~/.local/share/nvim/plugged/deoplete.nvim/
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"
" deoplete gets ultisnips
" call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])

" vimtex
let g:vimtex_view_method='skim'
let g:vimtex_view_general_options='-r @line @pdf @tex'

let g:vimtex_fold_enabled=0
autocmd FileType tex :nmap <Leader>lm \lm

let g:tex_flavor = 'latex'
au BufReadPost *.tex set syntax=tex

" prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
