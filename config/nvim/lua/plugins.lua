-- packer.nvim

-- auto install packer.nvim
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system { 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.api.nvim_command('packadd packer.nvim')
end

-- packerが`opt`として構成されている場合のみ必要。
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage inself
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'

  -- Auto close pairs such as (), {}, "",...
  use 'cohama/lexima.vim'
  -- Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tag, and more.
  use 'tpope/vim-surround'
  -- A light and configurable statusline/tabline plugin for vim
  use 'itchyny/lightline.vim'

  -- cmp plugins
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lua'

  use 'onsails/lspkind-nvim'

  -- snippets
  use 'L3MON4D3/LuaSnip' -- snippet engine
  use 'saadparwaiz1/cmp_luasnip'

  -- LSP
  use 'neovim/nvim-lspconfig' -- enable LSP
  use {
    'williamboman/mason.nvim', -- simple to use language server installer
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
  }
  use 'williamboman/mason-lspconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters
  use 'glepnir/lspsaga.nvim' -- LSP UIs

  -- Support for writing Nix expressions in Vim.
  use 'LnL7/vim-nix'

  use 'lambdalisue/fern.vim'
  use 'lambdalisue/fern-git-status.vim'
  use 'lambdalisue/glyph-palette.vim'
  use 'lambdalisue/nerdfont.vim'
  use 'lambdalisue/fern-renderer-nerdfont.vim'

  use 'ibhagwan/fzf-lua'

  -- colorscheme
  use 'cocopon/iceberg.vim'

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

-- mason.nvim
require("mason").setup()
require("mason-lspconfig").setup()

capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.opt.completeopt = "menu,menuone,noselect"

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
    { name = "path" },
  })
})
