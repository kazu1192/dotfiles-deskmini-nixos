" autocmd.rc.vim

augroup MyAutoCmd
  " filetype settings
  autocmd BufNewFile,BufRead *.rb setfiletype ruby
  autocmd BufNewFile,BufRead *.erb setfiletype erb.html
  autocmd BufNewFile,BufRead *.scss setfiletype scss
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} setfiletype markdown

  " Turn off paste mode when leaving insert
  autocmd InsertLeave * set nopaste
augroup END
