" --------------------
"       vimrc
" --------------------

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

" view
set number
set title
set relativenumber
set nowrap
set showcmd
set cmdheight=1
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" inputs
set clipboard+=unnamedplus
set encoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,latin
set fileformats=unix,dos,mac
set ambiwidth=double
set autoindent

" indents
filetype indent on
set smarttab
set expandtab
set tabstop=2
set shiftwidth=0
set smartindent
set ai "Auto indent
set si "Smart indent

" search
set ignorecase
set smartcase
set hlsearch

" others
set shell=fish
set scrolloff=10
" set showmatch
set noswapfile
set laststatus=2
set noshowmode
set nobackup
set backupskip=/tmp/*,/private/tmp/*

if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
" How many tenths of a second to blink when matching brackets
set mat=2
" Ignore case when searching
set ignorecase

" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Add asterisks in block comments
set formatoptions+=r

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescript
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

" Tern
" Disable auto preview window
set completeopt-=preview

" --------------------
" Cursor line
" --------------------
set cursorline

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40
highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

" --------------------
" imports
" --------------------
" source ~/.vim/vimrc.dein
source ~/.vim/vimrc.plugins
source ~/.vim/vimrc.cmds
source ~/.vim/vimrc.maps

" --------------------
" Color scheme
" --------------------
syntax enable
set background=dark
colorscheme iceberg

set exrc
