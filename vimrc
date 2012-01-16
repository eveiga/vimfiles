filetype off
"" Start Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible       " Use Vim defaults instead of 100% vi compatibility
set autoindent         " Auto indent new lines
set smartindent        " Make autoindent smarter
set smarttab           " Proper indenting with <Tab>
set autowrite          " Automatically save before commands like :next and :make
set backspace=indent,eol,start " more powerful backspacing
set cursorline         " Highlight current line
set foldmethod=syntax
set foldlevel=99
set hidden             " Hide buffers when they are abandoned
set history=50         " keep 50 lines of command line history
set ignorecase         " Wait for smartcase...
set smartcase          " Do smart case matching when searching
set incsearch          " Incremental search
set hlsearch           " Highlight search results
set list               " Show invisibles
set listchars=tab:▸\ ,eol:¬
set mouse=a            " Enable mouse usage (all modes) in terminals
set number
set ruler              " show the cursor position all the time
set scrolloff=3        " Never lean to the top or bottom of the window
set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set softtabstop=4 tabstop=4 shiftwidth=4 expandtab " Default whitespace settings
set viminfo='20,\"50   " read/write a .viminfo file, don't store more than 50 lines of registers
set wildmenu           " Enhanced command-line completion.
set wildmode=list:longest " Show all alternatives and complete furtherest possible.
set completeopt=menuone,longest,preview " Better completion menu

"" Look and Feel
set background=dark
colorscheme molokai
set gfn=Monaco:h12     " Font type

if version >= 703
    set colorcolumn=80     " Vertical line on column 80
    set undofile           " Persistent undo history
    set undodir=$TEMP
endif

if !exists("syntax_on")
    syntax on          " Use syntax highlighting
endif

filetype plugin indent on  " Enables filetype specific stuff

"" Bind new movement keys
nmap <silent> <c-Up> :wincmd k<CR>
nmap <silent> <c-Down> :wincmd j<CR>
nmap <silent> <c-Left> :wincmd h<CR>
nmap <silent> <c-Right> :wincmd l<CR>

"" Bind a shortcut to Nerdtree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']

"" Disable pyflakes use of quickfix window
let g:pyflakes_use_quickfix = 0

"" Map for ropevim
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

"" Ack, fuck yeah
nmap <leader>a <Esc>:Ack!

"" Ignorable files
set suffixes+=.pyc,.pyo

"" Python specs
autocmd FileType python setl autoindent tabstop=4 expandtab shiftwidth=4 softtabstop=4 smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class
autocmd FileType python set omnifunc=pythoncomplete#Completei

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWritePre * :%s/\s\+$//e

autocmd FileType c setl autoindent tabstop=2 expandtab shiftwidth=2 softtabstop=2

