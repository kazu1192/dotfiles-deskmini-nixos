" --------------------
" vim-plug
" --------------------

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('$DATA/plugged')

" lsp plug
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" complete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-buffer'

Plug 'hrsh7th/vim-vsnip'

" formatter/linter plug
Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'jlanzarotta/bufexplorer'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'

Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'cocopon/iceberg.vim'

Plug 'elzr/vim-json', {'for': 'json'}
Plug 'groenewege/vim-less', {'for': 'less'}
Plug 'stephpy/vim-yaml', {'for': 'yaml'}
Plug 'keith/swift.vim', {'for': 'swift'}
Plug 'wavded/vim-stylus', {'for': 'stylus'}
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'dag/vim-fish', {'for': 'fish'}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'yuezk/vim-js', {'for': ['javascript', 'javascript.jsx']}
Plug 'maxmellon/vim-jsx-pretty', {'for': ['javascript', 'javascript.jsx']}

" Initialize plugin system
call plug#end()

" --------------------
" Plugins setting
" --------------------
" vim-go
let g:go_disable_autoinstall = 1

" vim-json
let g:vim_json_syntax_conceal = 0

" JSX
let g:jsx_ext_required = 0

" localvimrc
let g:localvimrc_ask = 0

" lightline
let g:lightline = {
\   'colorscheme': 'wombat',
\   'active': {
\     'left': [ [ 'mode', 'paste' ],
\               [ 'readonly', 'filename', 'modified' ] ]
\   },
\ }

" fern.vim
nnoremap <C-f> :Fern . -reveal=% -drawer -toggle -width=30<CR>
let g:fern#renderer = 'nerdfont'

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

lua <<EOF
local cmp = require"cmp"
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-;>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
  }, {
    { name = "buffer" },
  })
})
EOF
