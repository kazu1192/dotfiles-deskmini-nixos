" ale
let g:ale_linters = {
      \ 'html': [],
      \ 'css': ['stylelint'],
      \ 'javascript': ['eslint'],
      \ 'vue': ['eslint'],
      \}
let g:ale_linter_aliases = {'vue': 'css'}
let g:ale_fixers = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'javascript': ['eslint'],
      \}
let g:ale_fix_on_save = 1
