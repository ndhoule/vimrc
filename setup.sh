#!/usr/bin/env bash

set -e

# Install vim bundles
git submodule init
git submodule update
vim +BundleInstall! +BundleClean +qall
