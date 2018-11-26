# File to install vim deps

sudo apt-get install build-essential python3-dev \
    libncurses5-dev libncursesw5-dev \
    libatk1.0-dev libx11-dev \
    libxpm-dev libxt-dev libxtst-dev

# Uninstall VIM
# sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common

# Vim configuration command
# ./configure --with-features=huge \
#             --enable-multibyte \
#             --enable-rubyinterp=yes \
#             --enable-python3interp=yes \
#             --with-python3-config-dir=/usr/lib/python3.7/config-3.7m-x86_64-linux-gnu \
#             --enable-perlinterp=yes \
#             --enable-luainterp=yes \
#             --enable-gui=gtk2 \
#             --enable-cscope \
#             --prefix=/usr/local \
#             --with-x=yes \
#             --with-compiledby="João Santos"
