" dein.vim
augroup PluginInstall
  autocmd!
  autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END
command! -nargs=0 PluginUpdate call dein#update()

let s:dein_dir = '~/.local/share/dein'

if &runtimepath !~# '/dein.vim'
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo.dein.vim'

  if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . s:dein_repo_dir)
  endif

  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

let g:dein#install_pax_processed = 48

let s:toml_file = '~/.config/nvim/dein/dein.toml'
let s:lazy_file = '~/.config/nvim/dein/lazy.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#load_toml(s:lazy_file, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
