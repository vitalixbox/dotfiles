" ############################################################################
" Important settings which need to setup in top of the config
" ############################################################################

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","

" For python plugins e.g. deoplete
" https://github.com/neovim/neovim/wiki/Installing-Neovim
" https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim#using-virtual-environments
let g:python_host_prog = $PYENV_ROOT . '/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'


" ############################################################################
" Plugins
" ############################################################################
call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'           " let Vundle manage Vundle (required)

" ----------------------------------------------------------------------------
" Interface
" ----------------------------------------------------------------------------
Plug 'bling/vim-airline'              " airline
Plug 'rakr/vim-one'                   " airline color scheme
Plug 'NLKNguyen/papercolor-theme'     " vim color scheme

" ----------------------------------------------------------------------------
" IDE
" ----------------------------------------------------------------------------
Plug 'scrooloose/nerdtree'            " Sidebar
Plug 'jistr/vim-nerdtree-tabs'        " Fix for working NERDTree with tabs
Plug 'Xuyuanp/nerdtree-git-plugin'	  " Show git status in NERDTree
Plug 'kien/ctrlp.vim'                 " ctrl+p fuzzy-open
Plug 'w0rp/ale'						  " Asynchronous Lint Engine
Plug 'airblade/vim-gitgutter'         " Show git elements in editor
Plug 'scrooloose/nerdcommenter'       " Block commenting

" ----------------------------------------------------------------------------
" Languages and file types support
" ----------------------------------------------------------------------------
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }     " Golang
Plug 'davidhalter/jedi-vim'                             " [Python] completion
Plug 'lepture/vim-jinja'                                " [Python] Jinja2
Plug 'pangloss/vim-javascript'                          " [Frontend] JavaScript
Plug 'digitaltoad/vim-jade'                             " [Frontend] Jade
Plug 'chase/vim-ansible-yaml'                           " Yaml & Ansible Yaml
Plug 'cespare/vim-toml'                                 " Toml
Plug 'saltstack/salt-vim'                               " SaltStack
Plug 'elzr/vim-json'                                    " JSON
Plug 'hashivim/vim-terraform'							" Terraform

" ----------------------------------------------------------------------------
" Completion
" ----------------------------------------------------------------------------
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   " Asynchronous comppletion for nvim
Plug 'zchee/deoplete-jedi'										" Python Jedi support for deoplete
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}			" Golang support for deoplete

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
autocmd Filetype proto setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2

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
colorscheme papercolor          " Set VIM color scheme
set background=light            " Use light version

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
" vim-go
" ----------------------------------------------------------------------------
let g:go_fmt_command = "goimports"

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
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>

" ----------------------------------------------------------------------------
" VimGo
" ----------------------------------------------------------------------------
autocmd FileType go nmap <silent> <Leader>d :GoDef<CR> 
autocmd FileType go nmap <silent> <Leader>t <Plug>(go-def-tab)

" ----------------------------------------------------------------------------
" Jedi
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" ALE
" ----------------------------------------------------------------------------
let g:ale_lint_on_enter = 1							" Lint when buf opens
let g:ale_lint_on_text_changed = 'never'			" We want to lint only when :w
let g:ale_echo_msg_error_str = 'E'					" %secyrity% for errors
let g:ale_echo_msg_warning_str = 'W'				" %security% for warns
" Example: [flake8] 'schematics.types.XXX' imported but unused [W] 
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
let g:ale_python_flake8_executable = $PYENV_ROOT . '/versions/neovim3/bin/flake8'

let g:airline#extensions#ale#enabled = 1			" Enable ALE in Airline
let g:airline#extensions#ale#error_symbol = 'E:'	" Show Errors
let g:airline#extensions#ale#warning_symbol = 'W:'  " Show Warns
  
" ----------------------------------------------------------------------------
" Deoplete
" ----------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1						" Enable deoplete
autocmd FileType python setlocal completeopt-=preview		" Disable preview window on completion
autocmd FileType go setlocal completeopt-=preview			" Disable preview window on completion

" ----------------------------------------------------------------------------
" Import additional configs
" ----------------------------------------------------------------------------
{% for extension in config.get('vim_extensions', []) %}
source {{ extension }}
{% endfor %}
