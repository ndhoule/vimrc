#!/usr/bin/env ruby

require 'etc'
require 'FileUtils'

VUNDLE_URL = 'git://github.com/gmarik/Vundle.vim.git'
VUNDLE_PATH = File.expand_path(File.join(File.dirname(__FILE__), 'bundle/vundle'))
HOME = Etc.getpwuid.dir

# TODO: npm install tern, jsctags, jshint, jsbeautify

# If Vundle hasn't been bootstrapped yet, clone it into place
if not File.directory?(VUNDLE_PATH)
  FileUtils.mkdir_p(File.dirname(VUNDLE_PATH))
  system("git clone #{VUNDLE_URL} #{VUNDLE_PATH}")
end

# Write a shim ~.vimrc file to load the file located at ~/.vim/vimrc
# TODO: Back up existing vimrc file
File.open(File.join(HOME, '.vimrc'), 'w') { |file| file.write(<<-EOF) }
if filereadable(expand('~/.vim/vimrc'))
  source ~/.vim/vimrc
endif
EOF

# Install vim bundles
system('vim +BundleInstall! +BundleClean +qall')
