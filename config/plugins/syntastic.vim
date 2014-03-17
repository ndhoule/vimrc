let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_html_tidy_ignore_errors = [
  \"proprietary attribute \"ng-",
  \"trimming empty <i>",
  \"trimming empty <span>",
  \"<input> proprietary attribute \"autocomplete\"",
\]

" Open syntastic window
map <leader> :Errors<CR>
