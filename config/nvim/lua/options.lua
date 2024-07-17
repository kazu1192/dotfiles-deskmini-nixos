-- options.lua

vim.opt.number = true
-- vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false

vim.opt.completeopt = menu, menuone, noselect

vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.syntax = enable
vim.opt.termguicolors = true

vim.opt.clipboard:append{'unnamedplus'}

vim.opt.ambiwidth = 'double'
