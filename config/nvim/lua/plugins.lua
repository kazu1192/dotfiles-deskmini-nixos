-- packer.nvim

-- auto install packer.nvim
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system { 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.api.nvim_command('packadd packer.nvim')
end

-- packerが`opt`として構成されている場合のみ必要。
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage inself
  use 'wbthomason/packer.nvim'

  -- Auto close pairs such as (), {}, "",...
  use 'cohama/lexima.vim'
  -- Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tag, and more.
  use 'tpope/vim-surround'

  use 'itchyny/lightline.vim'

  -- colorscheme
  use 'cocopon/iceberg.vim'
end)
