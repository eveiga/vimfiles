set encoding=utf-8

filetype off
"" Start Pathogen
execute pathogen#infect()

"" Start Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"" Load Vundle plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Bundle 'stephpy/vim-php-cs-fixer'

"" End Vundle
call vundle#end()

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
set listchars=tab:>.,trail:.,extends:#,nbsp:.
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
colorscheme hybrid
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

"" Bind a shortcut to Nerdtree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']

"" Disable pyflakes use of quickfix window
let g:pyflakes_use_quickfix = 0

"" Ack, fuck yeah
nmap <leader>a <Esc>:Ack!

"" Ignorable files
set suffixes+=.pyc,.pyo

"" Omni completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

"" Highlight extra whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"" Can't really expect that this is usefull on shitty repositories. Erase all empty spaces
autocmd BufWritePre * :%s/\s\+$//e

"" JSHINT options
let JSHintUpdateWriteOnly=1

"" Change shape of cursor in insert mode in iTerm 2
if exists('$ITERM_PROFILE')
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"" Allow copy/paste between clipboard
set clipboard=unnamed

"" airline custom
set laststatus=2

"" Deactivate arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"" php-cs-fixer specs
let g:php_cs_fixer_path = "./vendor/bin/php-cs-fixer"
let g:php_cs_fixer_level = "psr2"
let g:php_cs_fixer_config = "default"
let g:php_cs_fixer_php_path = "php"
let g:php_cs_fixer_fixers_list = "concat_with_spaces,short_array_syntax"
let g:php_cs_fixer_enable_default_mapping = 1
let g:php_cs_fixer_dry_run = 0
let g:php_cs_fixer_verbose = 0
