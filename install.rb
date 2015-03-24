#!/usr/bin/env ruby

require 'etc'
require 'FileUtils'

HOME = Etc.getpwuid.dir
VIM_PATH = File.join(HOME, '.vim')
VIMRC_PATH = File.join(HOME, '.vimrc')
NVIMRC_PATH = File.join(HOME, '.nvimrc')
SCRIPT_PATH = File.expand_path(File.join(File.dirname(__FILE__)))
BUNDLES_PATH = File.join(SCRIPT_PATH, 'bundle')
VUNDLE_PATH = File.join(BUNDLES_PATH, 'vundle')
VUNDLE_URL = 'git://github.com/gmarik/Vundle.vim.git'

Dir.chdir(VIM_PATH)

# If Vundle hasn't been bootstrapped yet, clone it into place
if not File.directory?(VUNDLE_PATH)
  FileUtils.mkdir_p(File.dirname(VUNDLE_PATH))
  system("git clone #{VUNDLE_URL} #{VUNDLE_PATH}")
end

# Write a shim ~.vimrc file to load the file located at ~/.vim/vimrc
# TODO: Back up existing vimrc file
File.open(VIMRC_PATH, 'w') { |file| file.write(<<-EOF) }
if filereadable(expand('~/.vim/vimrc'))
  source ~/.vim/vimrc
endif
EOF
File.open(NVIMRC_PATH, 'w') { |file| file.write(<<-EOF) }
if filereadable(expand('~/.vim/vimrc'))
  source ~/.vim/vimrc
endif
EOF

# Install vim bundles
system('vim +BundleInstall! +BundleClean +qall')

# If Tern is an installed bundle, install its dependencies
if File.directory?(File.join(BUNDLES_PATH, 'tern_for_vim'))
  Dir.chdir(File.join(BUNDLES_PATH, 'tern_for_vim'))
  system("npm install")
  Dir.chdir(VIM_PATH)
end

# If YouCompleteMe is an installed bundle, run its bootstrap script
if File.directory?(File.join(BUNDLES_PATH, 'YouCompleteMe'))
  system("#{BUNDLES_PATH}/YouCompleteMe/install.sh --clang-completer")
end
