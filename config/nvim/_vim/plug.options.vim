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
