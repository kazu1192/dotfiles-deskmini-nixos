" --------------------
" vim-plug
" --------------------

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" call plug#begin('$HOME/.local/share/nvim/plugged')
call plug#begin(glob($DATA.'/plugged'))

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
