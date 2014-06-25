" Don't load delimitMate for Clojure files; instead, use paredit
autocmd FileType clojure let b:loaded_delimitMate = 1
autocmd FileType clojure setlocal lispwords+=describe,it,xit,context,around,should=,should-not,should,should-be,with,run-specs
