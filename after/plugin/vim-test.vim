"
" https://github.com/janko-m/vim-test
"

" vim-test assumes it's being run from the project root. autochdir breaks this
" assumption and it's sometimes frequently inconvenient to start vim from the
" project root anyway, so explicitly set the root.
autocmd VimEnter,BufEnter * let test#project_root = ProjectRootGuess()

" Default test#javascript#has_package scans package.json, which doesn't work if
" your Mocha installation is a dependency of another package. Testing for the
" actual presence of the test runner works just as well.
function! test#javascript#has_package(package) abort
  if filereadable(resolve('node_modules/.bin/' . a:package))
    return 1
  endif

  return 0
endfunction

let test#filename_modifier = ':p'
let test#strategy = "vimux"

let g:test#javascript#mocha#file_pattern = '\v(test|tests?\/.*)\.(js|jsx|coffee)$'
" TODO(ndhoule): Genericize this using something like projectionist.vim
let test#javascript#mocha#options = '--growl --compilers js:babel-register'

augroup setProjectRootOnBufEnter
  autocmd BufEnter * let g:test#project_root = ProjectRootGuess()
augroup END

nmap <silent> Tn :TestNearest<CR>
nmap <silent> Tf :TestFile<CR>
nmap <silent> Ts :TestSuite<CR>
nmap <silent> Tl :TestLast<CR>
nmap <silent> Tg :TestVisit<CR>

function! MochaTransform(cmd) abort
  return 'NODE_ENV="test" ' . a:cmd
endfunction

let g:test#custom_transformations = {'mocha': function('MochaTransform')}
let g:test#transformation = 'mocha'
