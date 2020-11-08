" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

"# Configuration

let g:vimspector_install_gadgets = ['debugger-for-chrome', 'vscode-node-debug2']

"# Keybindings

nmap <F5>         <Plug>VimspectorContinue
nmap <S-F5>       <Plug>VimspectorStop
nmap <C-S-F5>     <Plug>VimspectorRestart
nmap <F6>         <Plug>VimspectorPause
nmap <F9>         <Plug>VimspectorToggleBreakpoint
nmap <S-F9>       <Plug>VimspectorAddFunctionBreakpoint
nmap <F10>        <Plug>VimspectorStepOver
nmap <F11>        <Plug>VimspectorStepInto
nmap <S-F11>      <Plug>VimspectorStepOut
