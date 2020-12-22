function! AleEditorconfigShfmtHook(config)
  let l:shfmt_options = []
  if &filetype == 'sh'
    if has_key(a:config, 'indent_style')
      if a:config['indent_style'] == 'tab'
        let l:shfmt_options += ['-i', '0']
      elseif a:config['indent_style'] == 'space' && has_key(a:config, 'indent_size')
        let l:shfmt_options += ['-i', a:config['indent_size']]
      endif
    endif

    " shfmt-specific flags
    if has_key(a:config, 'shell_variant') && a:config['shell_variant']
      let l:shfmt_options += ['-ln', a:config['shell_variant']]
    endif
    if has_key(a:config, 'binary_next_line') && a:config['binary_next_line'] == 'true'
      let l:shfmt_options += ['-bn']
    endif
    if has_key(a:config, 'switch_case_indent') && a:config['switch_case_indent'] == 'true'
      let l:shfmt_options += ['-ci']
    endif
    if has_key(a:config, 'space_redirects') && a:config['space_redirects'] == 'true'
      let l:shfmt_options += ['-sr']
    endif
    if has_key(a:config, 'keep_padding') && a:config['keep_padding'] == 'true'
      let l:shfmt_options += ['-kp']
    endif
    if has_key(a:config, 'function_next_line') && a:config['function_next_line'] == 'true'
      let l:shfmt_options += ['-fn']
    endif
  endif

  let g:lol = 1
  if len(l:shfmt_options) > 0
    let b:ale_sh_shfmt_options = join(l:shfmt_options, " ")
  endif

  return 0
endfunction

call editorconfig#AddNewHook(function('AleEditorconfigShfmtHook'))
