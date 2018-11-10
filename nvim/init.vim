set encoding=utf-8

set autoread
set nowrap
set history=1000

set relativenumber
set ruler 			" show the line and column number of the cursor position
set expandtab
set smarttab
set incsearch
set autoindent			" copy indent from current line when starting a new one
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set fileformat=unix

set hidden

set termguicolors
"
" yaml indentation
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" auto detect filetype
filetype plugin on

" incremental command live feedback
set inccommand=nosplit

set colorcolumn=120
highlight ColorColumn ctermbg=darkgray

"" ========================================================== "
"                    PLUGIN SETTINGS                         "
" ========================================================== "

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin("~/.config/nvim/bundle")
" gui
Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" common plugins
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/terryma/vim-multiple-cursors.git'

" dev tools
Plug 'scrooloose/nerdcommenter'

" code completion
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript'
 " For async completion
Plug 'Shougo/deoplete.nvim'
 " For Denite features
Plug 'Shougo/denite.nvim'

Plug 'zchee/deoplete-jedi'

Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'

call plug#end()

" NeoSolarized
colorscheme NeoSolarized
set background=dark

" Airline settings
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" easier panes navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Nerdtree settings
" launch nerdtree on entry if no file is specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" set autochdir                " automatically change directory
" let NERDTreeChDirMode=2
" let NERDTreeIgnore = ['\.pyc$','\.png$']
" nmap <C-o> :NERDTreeToggle<CR>

" Clang complete
" let g:clang_library_path='/lib/libclang.so'
" let g:clang_complete_auto = 0
" let g:clang_omnicppcomplete_compliance = 0
" let g:clang_make_default_keymappings = 0
"
" deoplete
let g:deoplete#enable_at_startup = 1

" let g:deoplete#sources#clang#libclang_path = '/lib/libclang.so'
" let g:deoplete#sources#clang#clang_header = '/usr/include/clang'

set completeopt-=preview


nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>

" syntax highlight
let python_highlight_all=1
syntax on

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
