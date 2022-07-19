#!/bin/bash
set -e
echo -e "\nStarting dependencies installation...\n"

# install deps
# git - needed for this script
# gpm - mouse server for console and xterm
# acl - access control list utilities, libraries and headers
# glibc - GNU C library
sudo pacman -Sqyy \
    git \
    gpm \
    acl \
    glibc
echo -e "\nFinished dependencies installation.\n"

echo -e "\nStarting the installation process...\n"
cd ~/Downloads/
git clone -b master -depth=1 git@github.com:vim/vim.git
cd vim/src

echo -e "\nStarting vim configuration for compilation...\n"

# in case it was compiled previously
make distclean
make clean

# just in case use this flag to avoid errors with YCM
# https://github.com/ycm-core/YouCompleteMe/issues/3760
 export LD_FLAGS="-rdynamic"

# note: clipboard support does not work on wayland
./configure --with-features=huge \
            --enable-multibyte \
            --enable-python3interp=yes \
            --with-x=yes \
            --enable-gui=no \
            --enable-cscope \
            --prefix=/usr/local

echo -e "\nThis might take a while...\n"
make && sudo make install
echo -e "\nFinished vim installation...\n"
