"
" Config.
"

set background=dark

try
  colorscheme base16-flat
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
