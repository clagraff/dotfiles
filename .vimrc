" **************************************
"    _   _ ________  _________  _____ 
"   | | | |_   _|  \/  || ___ \/  __ \
"   | | | | | | | .  . || |_/ /| /  \/
"   | | | | | | | |\/| ||    / | |    
"   \ \_/ /_| |_| |  | || |\ \ | \__/\
"    \___/ \___/\_|  |_/\_| \_| \____/
"
" **************************************

let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'


" ===============================
" Plugins Specification
" ===============================
"
" Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif
    let g:deoplete#enable_at_startup = 1

    Plug 'fatih/vim-go'                     " Enhanced golang support in vim
    Plug 'kchmck/vim-coffee-script'         " Enahcned Coffeescript support in vim
    Plug 'majutsushi/tagbar'                " Later mapped to <F8>
    Plug 'morhetz/gruvbox'                  " Colorscheme plugin
    Plug 'scrooloose/nerdtree'              " Later mapped to <Leader-f>
    Plug 'scrooloose/syntastic'             " Great syntax checking
    Plug 'leafgarland/typescript-vim'       " Typescript support
    Plug 'quramy/tsuquyomi'                 " Typescript support
    Plug 'vim-airline/vim-airline'          " Status bar & tabline plugin
    Plug 'vim-airline/vim-airline-themes'   " Themes for status bar & tabline plugin
    Plug 'posva/vim-vue'                    " Syntax highlighting for .vue files
    Plug 'jaxbot/semantic-highlight.vim'    " Semantic Highlighting
    Plug 'tpope/vim-ragtag'
    Plug 'digitaltoad/vim-pug'              " Syntax highlighting for .jade files
    Plug 'szorfein/fromthehell.vim'

call plug#end()  " Initialize plugin system


let g:ragtag_global_maps = 1 

" ===============================
" Extenion-based Commands
" ===============================
filetype plugin indent on

autocmd BufRead,BufNewFile *.js :setlocal sw=2 ts=2 sts=2
autocmd BufRead,BufNewFile *.ts :setlocal sw=2 ts=2 sts=2
autocmd BufRead,BufNewFile *.html :setlocal sw=2 ts=2 sts=2
autocmd BufRead,BufNewFile *.jinja2 :setlocal sw=2 ts=2 sts=2 ft=html
autocmd BufRead,BufNewFile *.hbs :setlocal sw=2 ts=2 sts=2 ft=html
autocmd BufRead,BufNewFile *.json :setlocal ft=javascript
autocmd BufRead,BufNewFile *.apib :setlocal ft=markdown
autocmd BufWritePre,BufNewFile *.go :GoImports
autocmd FileType yaml :setlocal ts=2 sts=2 sw=2 expandtab
autocmd filetype coffee :setlocal sw=2 ts=2 sts=2
autocmd filetype python set expandtab
autocmd filetype scss :setlocal sw=2 ts=2 sts=2
autocmd filetype yml :setlocal ts=2 sts=2 sw=2 expandtab


" ===============================
" Non-Neovim commands (most are ignored by Neovim)
" ===============================
set encoding=utf-8  " Set character encoding for vim.
set nocompatible    " Disable vi compatibility
set t_Co=256        " Enable 256 colors


" ===============================
" General Settings
" ===============================
set hidden          " Unload a buffer when it is abandoned.
set history=1000    " Remember 1000 commands.
set laststatus=2    " Influences when the last window will have a status line.
set lazyredraw      " Don't redraw while executing macros.
set magic           " Enable magical regular expressions by default.
set noerrorbells    " No beep on erros. Visual bell only.
set noswapfile      " Disable utilizing swapfile for buffer.
set scroll=5        " Set CTRL-U and CTRL-D movement amount
set undolevels=1000 " Set max undo history to 1000.
set visualbell      " Do not beep. Use visual bell.

set backspace=eol,start,indent "Allow for backspacing over everything in i-mode.

set list
set listchars=tab:\|\ 

" Enable mouse if possible.
if has('mouse')
    set mouse=a
endif

" Enable vertical color column at specified column index.
if exists("+colorcolumn")
	set colorcolumn=81
endif


    " ------------------==== Folding Options ====------------------
    " set foldenable
    " set foldlevelstart=0
    " set foldlevelstart=10
    " set foldmethod=indent

    " ------------------==== Backup Options ====------------------
    set backupdir=~/.local/share/nvim/backup    " Set backup-storage directory
    set backupext=.bak  " Set backup file extension
    set nobackup        " Disable backups.


    " ------------------==== Text Completion ====------------------
    set omnifunc=syntaxcomplete#Complete " Specified func used for auto-completion
    set wildmenu    " Show menu for tab-completion

    " Ignore compiled files
    set wildignore=*.o,*~,*.pyc,*.swp,*.bal,*.class
    
    " If windows...
    if has("win16") || has("win32")
        set wildignore+=*.git*,*.hg*,*.svn*,*.DS_Store
    else
        set wildignore+=.git*,.hg*,.svn*
    endif
    

    " ------------------==== Display Options ====------------------
    colorscheme fromthehell " Select (installed) color scheme
    set background=dark     " Select background mode ("dark" or "light")
    set cursorline          " Highlight current line
    set foldcolumn=1        " Add a bit of extra margin to the left.
    set mat=2               " How many 10ths of a second to blink matching brackets.
    set number              " Display line numbers
    set relativenumber      " Show line-numbers relative to cursor
    set ruler               " Display line and column number (ignored with airline)
    set showmatch           " Show matching parenthesis, braces, and brackets
    set title               " Set window title to filename (plus info)
    set wrap                " Wrap lines which exceed terminal width
    syntax enable           " Enable syntax highlighting


    " ------------------==== Indentation Options ====------------------
    set autoindent      " Use current indentation on next line.
    set copyindent      " Uses characters from previous line for 'tabbing'
    set expandtab       " Use spaces instead of tabs when <Tab> is pressed
    set shiftwidth=4    " Number of columns to re/indent on << and >>
    set smartindent     " Enable smart autoindenting when starting a new line
    set smarttab        " Does stuff when un/tabbing a line. Idk
    set tabstop=4       " How many columns wide a tab character procudes


    " ------------------==== Search Options ====------------------
    set hlsearch    " Highlight search results.
    set ignorecase  " Ignore case when searching.
    set smartcase   " Case-seach if query has uppercase letters. Otherwise ignore casing.

" ===============================
" Controls and Movement Settings
" ===============================
set whichwrap+=<,>,h,l,[,] " Enforce cursor linewrap when using arrow, <h> or <l> keys

set pastetoggle=<F2> " Enable paste-toggle mode with <F2>
nnoremap <leader>p :setlocal paste!<cr> " Paste shortcut

" Use unix as the standard file type.
set ffs=unix,dos,mac

" Open new split panes on the right and bottom
set splitbelow
set splitright

set path+=**    " Enable fuzzy-file searching via :find


" ###########################
" Custom Commands
" ###########################
" Forced-commands of standard equivallents.
command! E :e!
command! Q :q!
command! W :w!

" Create Tags file. Requires "ctags"
" - Then use <Ctrl + ]> to goto tag definition,
" - or use <g + Ctrl + ]> for ambiguous tags
" - or use <Ctrl + t> to jump back from viewing a tag definition
command! MakeTags !ctags -R .


" ###########################
" Remapping Keys
" ###########################
let mapleader = "\<space>"      " Set map leader
let g:mapleader = "\<Space>"    " Set map leader again?

" Remap the brackets, braces, parens, and quoates to autocomplete their opposites.
inoremap <silent> " ""<Left>
inoremap <silent> ( ()<Left>
"inoremap <silent> < <><Left>
inoremap <silent> [ []<Left>
inoremap <silent> { {}<Left>


" Map <F8> to toggle Tagbar UI.
nmap <F8> :TagbarToggle<CR>

" Enable "very magic" mode for searches (as a default).
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//

" Wrap current word in double-quotes
nnoremap <silent> " <S-Left>i"<Esc><Right><S-Right>i<Right>"<Esc>


" <C-r> will reload vim without closing the current session.
"noremap <silent> <C-r> :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" <C-d> will display the differnces between the current buffer 
" and the actual content of the current file.
"nnoremap <silent> <C-d> :w !diff % -<CR>
"inoremap <silent> <C-d> <Esc>:w !diff % -<CR>


    " ------------------==== Tab Controls ====------------------
    " Summary:
        " <t-j> goes to next tab.
        " <t-k> goes to previous tab.
        " <t-n> creates a new tab.
        " <t-d> deletes current tab.
        " <C-Insert> creates new tab (similar to when in i-mode).
        " <C-Delete> deletes current tab (similar to when in i-mode).
    nnoremap tj :bprev<CR>
    nnoremap t<Left> :bprev<CR>

    nnoremap tk :bnext<CR>
    nnoremap t<Right> :bnext<CR>

    nnoremap tn :enew<CR>
    nnoremap td :bd<CR>

    nnoremap th :bfirst<CR>
    nnoremap t<Down> :bfirst<CR>

    nnoremap tl :blast<CR>
    nnoremap t<Up> :blast<CR>

    " ------------------==== <Leader> Controls ====------------------
    " <Leader-Space> to clear last search highlight
    nmap <silent> <leader>/ :nohlsearch<CR>

    " Remap <Leader-0> to move cursor to first non-blank character
    map <leader>0 ^ 

    
    " Leader-based write, close, reload
    nnoremap <Leader>wq :wq<CR>
    nnoremap <Leader>wqf :w!<CR>:q<CR>

    nnoremap <Leader>w :w<CR>
    nnoremap <Leader>wf :w!<CR>

    nnoremap <Leader>q :q<CR>
    nnoremap <Leader>qf :q!<CR>

    nnoremap <Leader>e :e<Space>
    nnoremap <Leader>ef :e!<Space>

    "nnoremap zz :SemanticHighlightToggle<cr>
    nnoremap zz :SyntasticToggleMode<cr>

    " Autotab the current file.
    nnoremap <silent> <leader>tt mzgg=G'z<CR>


    nnoremap <silent> <leader>tb :TagbarToggle<CR>
    nnoremap <silent> <leader>i :TagbarToggle<CR>

    nnoremap <silent> <leader>f :NERDTreeToggle<CR>


    " ------------------==== Shift + Arrow Controls ====------------------
    inoremap <silent> <S-Up> <Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
    inoremap <silent> <S-Down> <Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>

    nnoremap <silent> <S-Up> 10<Up>
    nnoremap <silent> <S-Down> 10<Down>

    vnoremap <silent> <S-Up> 10<Up>
    vnoremap <silent> <S-Down> 10<Down>


" #########################
" Extras & Plugins
" #########################

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
" autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments

" Enable buffer-bar for Vim windows.
let g:airline#extensions#tabline#enabled = 1


"match ErrorMsg '\s\+$'

" Vim
let g:indentLine_color_term = 239

"GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)


"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_auto_trigger = 0

set completeopt=menu,menuone,longest
set tags=./tags;/

" set completeopt=menuone

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" let g:SuperTabDefaultCompletionType = "context"

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


autocmd BufWritePost *
      \ if filereadable('tags') |
      \   call system('ctags -a '.expand('%')) |
      \ endif


" Syntastic config options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers=['pycodestyle', 'pydocstyle', 'pylint']

nnoremap <C-e> :SyntasticToggleMode<CR>


" Configure python3 path
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" Enable deoplete
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


" go-vim options
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_term_enabled = 1
let g:go_fmt_autosave = 0
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
" Enable additional highlighting for Go code
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
" go back/forth to Golang test
nnoremap <C-j> :GoAlternate<CR> 

" semantic highlighting
let g:semanticTermColors = [28,1,2,3,4,5,6,7,25,9,10,34,12,13,14,15,16,125,124,19]
