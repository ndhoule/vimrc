"
" Text Display and Formatting
"

syntax on

set cursorline            " Highlight the current line
set cursorcolumn          " Highlight the current column

set relativenumber        " Set line numbering relative to current line
set number                " Show the current line number in relative linenum mode

set tabstop=2             " Set tab width to two spaces
set softtabstop=2         " Make tabs easier to delete
set shiftwidth=2          " Auto-indent this many spaces
set shiftround            " <Tab> inserts to the nearest multiple of `shiftwidth`
set expandtab             " <Tab> inserts `tabstop` number of characters

let &colorcolumn="80,100" " Show max width warning columns
set textwidth=80          " Wrap long lines automatically

set list listchars=tab:→\ ,trail:· " Highlight trailing spaces, tab chars
