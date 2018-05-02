# Dependencies needed to install schemes

echo -e "\nStarting dependencies installation...\n"

sudo apt-get update
sudo apt-get install -y curl 

echo -e "\nFinished dependencies installation.\n"

echo -e "\nStarting nord installation...\n"

echo -e "\nThis might take a while...\n"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp .vimrc ~/.vimrc

echo -e "\nFinished nord installation...\n"

echo -e "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo -e "!!                    Next step                          !!"
echo -e "!!       Enter vim and use command :PlugInstall          !!"
echo -e "!!                                                       !!"
echo -e "!!                                                       !!"
echo -e "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
