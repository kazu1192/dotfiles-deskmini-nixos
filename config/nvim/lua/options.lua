-- options.lua

-- 行表示
vim.opt.number = true
-- 相対表示
vim.opt.relativenumber = true
-- クリップボード設定
vim.opt.clipboard:append{'unnamedplus'}
-- CJK対策
vim.opt.ambiwidth = double
-- タブをスペースベースに
vim.opt.expandtab = true
-- タブスペース幅
vim.opt.tabstop = 2
-- インデントに使われるスペース幅 0の場合'tabstop'と同じ値
vim.opt.shiftwidth = 0
-- indent機能の高度版 Cなどに対応してるらしい。
vim.opt.smartindent = true
-- 検索において大文字と小文字を区別しない
vim.opt.ignorecase = true
-- 検索に大文字を含む場合'ignorecase'を上書きする。
vim.opt.smartcase = true
-- カーソル上下に最低でも指定した行数が表示される。
vim.opt.scrolloff = 10
-- swapファイルを作成しなくなる
vim.opt.swapfile = false
-- 補完'ins-completion'についてのオプション
vim.opt.completeopt = menu, menuone, noselect
-- カーソル行の強調。'CursorLine' 'hl-CursorLine'
vim.opt.cursorline = true
-- 構文ハイライトを有効
vim.opt.syntax = enable
