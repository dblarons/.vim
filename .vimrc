"Required for Vundle
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"Autocomplete
Plugin 'Valloric/YouCompleteMe'

" solarized theme
Plugin 'altercation/vim-colors-solarized'

"Autocomplete brackets, braces, and quotes
Plugin 'Raimondi/delimitMate'

"Session restore - used for tmux-resurrect to restore Vim sessions
Plugin 'tpope/vim-obsession'

"Syntax checking
Plugin 'scrooloose/syntastic'

"Haskell syntax
"Plugin 'dag/vim2hs'

" " All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable

autocmd BufNewFile,BufReadPost *.tpp set filetype=cpp

filetype on "Can set filetype back to on after vundle init
filetype indent on "fix bad indentation of '#' in python

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

"Write the old file out when switching between files.
set autowrite

"Enable ctrlp
let g:ctrlp_map = '<c-p>'

"Set up delimitMate configurations
let delimitMate_balance_matchpairs = 1
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

"Set up vim2hs configurations
let g:haskell_conceal = 0
let g:haskell_conceal_enumerations = 0

"Display current cursor position in lower right corner.
set ruler

"Want a different map leader than \
let mapleader = ","

"Set the correct python so that YouCompleteMe doesn't complain
let g:ycm_path_to_python_interpreter = '/usr/bin/python'


"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=200

"Switch between buffers without saving
set hidden

"Set font type and size. Depends on the resolution. Larger screens, prefer h20
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set background=dark
      colorscheme solarized
      set guifont=Inconsolata-dz\ for\ Powerline:h13
   endif
else
   let g:solarized_termtrans = 1
   set background=dark
   colorscheme solarized
   set guifont=Inconsolata-dz\ for\ Powerline:h13
endif

"Turn line number ON with highlighting
set number
set cursorline

"Color codes: http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
:highlight CursorLineNr term=bold cterm=NONE ctermfg=184 ctermbg=black

"Tab stuff
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"Allow many types of line endings
set fileformats=unix,mac,dos 

"Show command in bottom right portion of the screen
set showcmd

"Indent stuff
set smartindent
set autoindent

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=-2

"Better line wrapping 
set wrap
set textwidth=79
set formatoptions=qrn1

"No beeping
set visualbell

"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase

"Hide MacVim toolbar by default
set go-=T

"Hard-wrap paragraphs of text
nnoremap <leader>q gqip

"Enable code folding
set foldenable

"Hide mouse when typing
set mousehide

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

"Split windows below the current window.
set splitbelow              

"Allow system clipboard to be accessed
"set clipboard=unnamed

" session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"Faster shortcut for commenting. Requires T-Comment plugin
map <leader>c <c-_><c-_>

"Saves time; maps the spacebar to colon
nmap <space> :

"Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h

"Map code completion to , + tab
imap <leader><tab> <C-x><C-o>

" More useful command-line completion
set wildmenu

"Auto-completion menu
set wildmode=list:longest

"Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"remove right-hand scroll bar
:set guioptions-=r 

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif

":source $MYVIMRC reloads the saved .vimrc
:nmap <leader>s :source $MYVIMRC

":e $MYVIMRC opens the .vimrc for editing
:nmap <leader>v :e $MYVIMRC

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Disable Ex-mode
nnoremap Q <nop>

" Shortcut to opening a virtual split to right of current pane
" Makes more sense than opening to the left
nmap <leader>bv :bel vsp

" Backups
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap// " swap files
set backup " enable backup

" No more stretching for navigating files
"noremap h ;
"noremap j h
"noremap k gj
"noremap l gk
"noremap ; l

set showmatch " show matching brackets
