"
" Config.
"

set background=dark

try
  colorscheme base16-default
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
