"" Vim-plug ""

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
" call plug#begin('~/.vim/plugged')
call plug#begin('~/.cache/vim/plugged')

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" syntax file type
Plug 'posva/vim-vue'
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'

" Quickrun
Plug 'thinca/vim-quickrun'

" emmet
Plug 'mattn/emmet-vim'

" lexima
Plug 'cohama/lexima.vim'

" prettier
Plug 'prettier/vim-prettier', {
\ 'do': 'yarn install',
\ 'branch': 'release/0.x'
\ }

" previm
Plug 'previm/previm'

" winresizer
Plug 'simeji/winresizer'

" manage session
Plug 'skanehira/vsession'

" signature
Plug 'kshenoy/vim-signature'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" trancelate language
Plug 'skanehira/translate.vim'

" preview markdown
Plug 'skanehira/preview-markdown.vim'

" lightline
Plug 'itchyny/lightline.vim'

" theme
Plug 'cocopon/iceberg.vim'

" Initialize plugin system
call plug#end()

"" plugin settings  ""

" fzf
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
nnoremap <C-p> :Files<CR>

" asyncomplete
let g:lsp_async_completion = 1
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)
augroup asyncomplete
  autocmd!
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
augroup end

" emmet-vim
let g:user_emmet_leader_key='<Tab>'

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
            \ 'left': [ ['mode', 'paste'], ['readonly', 'branchName', 'filepath', 'modified'] ]
            \ },
      \ 'component_function': {
            \ 'filepath': 'FilePath',
            \ },
      \ }

function! FilePath()
  if winwidth(0) > 90
    return expand('%:s')
  else
    return expand('%:t')
  endif
endfunction

