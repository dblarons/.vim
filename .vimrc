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

"Generates .ycm_extra_conf.py files with the :YcmGenerateConfig command.
Plugin 'rdnetto/YCM-Generator'

" solarized theme
Plugin 'altercation/vim-colors-solarized'

"Autocomplete brackets, braces, and quotes
Plugin 'Raimondi/delimitMate'

"Syntax checking
Plugin 'scrooloose/syntastic'

"Haskell syntax
Plugin 'dag/vim2hs'

"Org Mode
Plugin 'jceb/vim-orgmode'

"Speeddating – required for org mode
Plugin 'tpope/vim-speeddating'

"RepeatVim
Plugin 'tpope/vim-repeat'

"HSpec Syntax
Plugin 'hspec/hspec.vim'

"JavaScript syntax
Plugin 'pangloss/vim-javascript'

"JSX syntax
Plugin 'mxw/vim-jsx'

"Omnicompletion support for JavaScript that hooks into YCM
Plugin 'marijnh/tern_for_vim'

"Tree explorer
Plugin 'scrooloose/nerdtree'

"Close Vim tags
Plugin 'alvan/vim-closetag'

"Search for files in the working directory
Plugin 'ctrlpvim/ctrlp.vim'

"Cycle through yanked text similar to Emacs killring
Plugin 'maxbrunsfeld/vim-yankstack'

"Ag commands (similar to built in grep ones)
Plugin 'rking/ag.vim'

"Ag shortcuts (gagiw searches a word; gagi' searches the words inside single quotes)
Plugin 'Chun-Yang/vim-action-ag'

"Stylus syntax highlighting
Plugin 'wavded/vim-stylus'

" Syntax highlighting for elm
Plugin 'lambdatoast/elm.vim'

"Note :: Install linting plugins globally so that they hook into Syntastic
" rather than installing them through Vundle, which will conflict with
" YouCompleteMe and cause weird buffer issues.

" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable

autocmd BufNewFile,BufReadPost *.tpp set filetype=cpp
autocmd BufNewFile,BufReadPost *.cxx set filetype=cpp
autocmd BufNewFile,BufReadPost *.txx set filetype=cpp

filetype on "Can set filetype back to on after vundle init
filetype indent on "fix bad indentation of '#' in python

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

"Write the old file out when switching between files.
set autowrite

"Enable ctrlp
let g:ctrlp_map = '<c-p>'

"Ignore annoying dirs in Ctrl-P
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"Set up delimitMate configurations
let delimitMate_balance_matchpairs = 1
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

"Set up vim2hs configurations
"There are also Haskell configs in ~/.vim/ftplugins/haskell.vim
let g:haskell_conceal = 0
let g:haskell_conceal_enumerations = 0

"Display current cursor position in lower right corner.
set ruler

"Want a different map leader than \
let mapleader = ","
let maplocalleader = "\\"

"Set the correct python so that YouCompleteMe doesn't complain
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

"Close the YCM preview buffer after completion
let g:ycm_autoclose_preview_window_after_completion = 1

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=1000

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
"set smartindent " De-indents Python comments. Remove if still commented out.
set autoindent

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=-2

"Better line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1t

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

"Hide mouse when typing
set mousehide

"Allow mouse use in vim
set mouse=a

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

"Closes a buffer in a vertical split without closing the split
nnoremap <leader>d :bp\|bd #<CR>

"Split windows below the current window.
set splitbelow

" session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,curdir,help

"Saves time; maps the spacebar to colon
nmap <space> :

"Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h

"Copying in Vim copies to system clipboard
set clipboard=unnamed

"Map folding/unfolding of individual section from za to ,a
nmap <leader>f za

"Toggle all folds beneath this point
nmap <leader>F zA

"Toggle foldeable on and off
nmap <leader>i zi

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

" ,b should open Ctrl-P buffer
nmap <leader>b :CtrlPBuffer<CR>

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
:nmap <leader>e :e $MYVIMRC

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Disable Ex-mode
nnoremap Q <nop>

" Shortcut to opening a virtual split to right of current pane
" Makes more sense than opening to the left
" nmap <leader>bv :bel vsp

" Backups
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap// " swap files
set backup " enable backup

" Keep the cursor n lines from the edge of the buffer.
set scrolloff=10

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign))

set showmatch " show matching brackets

" JavaScript indentation should be 2 instead of 4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" Start NERDTree if no files are specified when Vim starts.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Start NERDTree with Ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Reveal current file in NerdTree
nmap <leader>n :NERDTreeFind<CR>

" Close NERDTree upon opening a file
let NERDTreeQuitOnOpen=1

" Ignore files in NERDTree viewer
let NERDTreeIgnore = ['\.pyc$']

" Needed for closetag.vim plugin
" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.xml,*.jsx"

" Yankstack configuration
let g:yankstack_map_keys = 0 " remove old mappings
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" Configure Syntastic to use ESLint
let g:syntastic_javascript_checkers = ['eslint']

" Make ag.vim search from the project root instead of working dir
let g:ag_working_path_mode="r"

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Strip trailing whitespace on each save
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
