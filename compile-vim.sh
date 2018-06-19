# Dependencies needed to compile vim
echo -e "\nStarting dependencies installation...\n"

sudo apt-get update
sudo apt-get install \
    build-essential \
    libncurses5-dev \
    libgnome2-dev \
    libgnomeui-dev \
    libgtk2.0-dev \
    libatk1.0-dev \
    libbonoboui2-dev \
    libcairo2-dev \
    libx11-dev \
    libxpm-dev \
    libxt-dev \
    python-dev \
    python3-dev \
    ruby-dev \
    lua5.1 \
    lua5.1-dev \
    libperl-dev \
    xorg-dev

echo -e "\nFinished dependencies installation.\n"

echo -e "\nStarting the installation process...\n"

cd ~/Downloads/
git clone https://github.com/vim/vim
cd vim/src

echo -e "\nStarting vim configuration for compilation...\n"

# In case it was compiled previously
make distclean

./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --with-x=yes \
            --enable-cscope \
            --prefix=/usr/local

echo -e "\nThis might take a while...\n"

make && sudo make install

echo -e "\nFinished vim installation...\n"

echo -e "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo -e "!!                    Next steps                         !!"
echo -e "!!         Customize vim with a vimrc file.              !!"
echo -e "!!                                                       !!"
echo -e "!!                                                       !!"
echo -e "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
