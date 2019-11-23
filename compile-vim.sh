# Dependencies needed to compile vim
echo -e "\nStarting dependencies installation...\n"

sudo apt-get update
sudo apt-get install -y -qq \
    git \
    build-essential \
    lib64ncurses-dev \
    libcairo2-dev \
    libx11-dev \
    xorg-dev \
    ruby-dev \
    liblua5.3-dev \
    libperl-dev

echo -e "\nFinished dependencies installation.\n"

echo -e "\nStarting the installation process...\n"

cd ~/Downloads/
git clone -b master --single-branch https://github.com/vim/vim
cd vim/src

echo -e "\nStarting vim configuration for compilation...\n"

# In case it was compiled previously
make distclean

./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.7/config-3.7m-x86_64-linux-gnu \
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
