call plug#begin()

" ----------------------------------------------------------------------------
" Interface
" ----------------------------------------------------------------------------
Plug 'bling/vim-airline'              " airline
Plug 'rakr/vim-one'                   " airline color scheme

" ----------------------------------------------------------------------------
" IDE
" ----------------------------------------------------------------------------
Plug 'scrooloose/nerdtree'            " Sidebar
Plug 'jistr/vim-nerdtree-tabs'        " Fix for working NERDTree with tabs
Plug 'kien/ctrlp.vim'                 " ctrl+p fuzzy-open

" ----------------------------------------------------------------------------
" Langs
" ----------------------------------------------------------------------------
Plug 'glench/vim-jinja2-syntax'

call plug#end()

" ############################################################################
" VIM configuration
" ############################################################################

" ----------------------------------------------------------------------------
" Interface
" ----------------------------------------------------------------------------
set number                      " Show line numbers
set history=1000                " Store 1000 items of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom (like '2d' - double delete)
set showmode                    " Show current mode (NORMAL/INSERT) down the bottom (But Airline override it)
set hlsearch                    " Highlight found data while search
set textwidth=79
set nowrap						" No newline when line ends
set formatoptions-=t			" do not automatically wrap text when typing

" ----------------------------------------------------------------------------
" Indention
" ----------------------------------------------------------------------------
set smartindent                 " Go to proper indent after <Enter>
set tabstop=4                   " Set default tabs to 4
set shiftwidth=4
set softtabstop=4

" ----------------------------------------------------------------------------
" Language specific setup
" ----------------------------------------------------------------------------
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd Filetype java setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype jade setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype eruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype xml setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype proto setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype tf setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype scm setlocal tabstop=2 shiftwidth=2 softtabstop=2

" ----------------------------------------------------------------------------
" Editor
" ----------------------------------------------------------------------------
set backspace=indent,eol,start  " Allow backspace in insert mode
xnoremap p "_dP					" Paster or replace without overwrite register

" ----------------------------------------------------------------------------
" Turn Off Swap Files
" ----------------------------------------------------------------------------
set noswapfile                  " Disable swap files *.ext.swp
set nobackup                    " Disable backups files *.ext~
set nowritebackup               " No write backups before file overwriting

" ----------------------------------------------------------------------------
" Folding
" ----------------------------------------------------------------------------
set foldmethod=indent           " Fold based on indent
set foldnestmax=3               " Deepest fold is 3 levels
set nofoldenable                " Don't fold by default

" ----------------------------------------------------------------------------
" Color scheme
" ----------------------------------------------------------------------------
colorscheme one
set background=light

" ----------------------------------------------------------------------------
" Clipboard support
" ----------------------------------------------------------------------------
if !has("clipboard")
    echoerr "You need VIM with +clipboard support"
endif
set clipboard=unnamed           " MacOS clipboard support

" ############################################################################
" Plugins configuration
" ############################################################################

" ----------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------
let g:airline_theme='one'                           " Set theme
let g:airline_powerline_fonts = 1                   " Enable beautiful interface
let g:airline#extensions#tabline#enabled = 1        " Enable airline for tabs

" ----------------------------------------------------------------------------
" NERDTree
" ----------------------------------------------------------------------------
let NERDTreeMinimalUI = 1                           " Hide not useful info on the top of NERDTree
let NERDTreeWinSize = 30                            " Width of sidebar
let NERDTreeIgnore = ['\.pyc$']                     " Filter *.pyc
let g:nerdtree_tabs_open_on_console_startup = 1     " Open sidebar at startup
nnoremap H gT
nnoremap L gt
nnoremap T :tabnew<CR>
