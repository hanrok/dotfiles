syntax on
set clipboard=unnamed
set backspace=indent,eol,start
set laststatus=2
set ttimeoutlen=100
colorscheme desert

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

let g:vim_bootstrap_langs = "c,javascript,html,python"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'xolox/vim-misc'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-easytags'
" Plug 'Valloric/YouCompleteMe'
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'avelino/vim-bootstrap-updater'
Plug 'sheerun/vim-polyglot'
Plug 'ervandew/supertab'
Plug 'christoomey/vim-system-copy'

" Javascript
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'elzr/vim-json'
Plug 'ternjs/tern_for_vim'

" Required
call plug#end()

" My Settings
" tagbar
nmap <F8> :TagbarToggle<CR>

" easytag
let g:easytags_async = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
" vim-airline
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
let g:airline_powerline_fonts = 1

"let g:airline#extensions#virtualenv#enabled = 1

" Ale
let g:ale_linters = {
\	'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\   'html': ['tidy']
\}
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_format = '[%linter%] %...code...% >> %s [%severity%]'
let g:ale_lint_delay = 500
let g:ale_fixers = {
\	'python': ['autopep8', 'yapf']
\}
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)


"*****************************************************************************
"" Abbreviations
"*****************************************************************************
""""""""""
"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
" let g:NERDTreeMapOpenInTab='<ENTER>'
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

set rtp+=~/.vim/bundle/nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if (argc() == 0 && !exists("s:std_in")) || (argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")) | NERDTree | endif
""""""""""

