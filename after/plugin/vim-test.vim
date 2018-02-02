" TODO(ndhoule): Use a dispatch plugin like vimux or neomake
" TODO(ndhoule): Set this via autocmd using FindRootDirectory()
" let test#project_root = "/path/to/your/project"

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
  autocmd BufEnter * let g:test#project_root = FindRootDirectory()
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
