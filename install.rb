#!/usr/bin/env ruby

require 'etc'

HOME = Etc.getpwuid.dir

# Write a shim ~.vimrc file to load the file located at ~/.vim/vimrc
# TODO: Back up existing vimrc file
File.open(File.join(HOME, '.vimrc'), 'w') { |file| file.write(<<-EOF) }
if filereadable(expand('~/.vim/vimrc'))
  source ~/.vim/vimrc
endif
EOF

# Install vim bundles
system('vim +BundleInstall! +BundleClean +qall')
