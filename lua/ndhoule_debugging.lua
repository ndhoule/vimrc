--
-- Configuration
--

vim.g.vimspector_install_gadgets = {'debugger-for-chrome', 'vscode-node-debug2'}

--
-- Keybindings
--

vim.cmd('nmap <F5>      <Plug>VimspectorContinue')
vim.cmd('nmap <S-F5>    <Plug>VimspectorStop')
vim.cmd('nmap <C-S-F5>  <Plug>VimspectorRestart')
vim.cmd('nmap <F6>      <Plug>VimspectorPause')
vim.cmd('nmap <F9>      <Plug>VimspectorToggleBreakpoint')
vim.cmd('nmap <S-F9>    <Plug>VimspectorAddFunctionBreakpoint')
vim.cmd('nmap <F10>     <Plug>VimspectorStepOver')
vim.cmd('nmap <F11>     <Plug>VimspectorStepInto')
vim.cmd('nmap <S-F11>   <Plug>VimspectorStepOut')
