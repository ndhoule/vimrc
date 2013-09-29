#!/usr/bin/env ruby

HOME = Dir.home

# TODO: Back up existing vimrc file

# Write a shim ~.vimrc file to load the file located at ~/.vim/vimrc
File.open(File.join(HOME, '.vimrc'), 'w') { |file| file.write(<<-EOF) }
if filereadable(expand('~/.vim/vimrc'))
  source ~/.vim/vimrc
endif
EOF

# Install vim bundles
system('vim +BundleInstall! +BundleClean +qall')
