# Dependencies needed to install schemes

echo -e "\nStarting dependencies installation...\n"

sudo apt-get update
sudo apt-get install -y util-linux \
                        dconf-tools dconf-gsettings-backend \
                        dconf-cli dconf-service uuid-runtime

echo -e "\nFinished dependencies installation.\n"

echo -e "\nStarting nord installation...\n"

echo -e "\nThis might take a while...\n"

sudo git clone --depth 1 --branch \
               release https://github.com/adobe-fonts/source-code-pro.git ~/.fonts/adobe-fonts/source-code-pro

fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro

git clone https://github.com/arcticicestudio/nord-gnome-terminal.git

chmod 750 ./nord-gnome-terminal/src/nord.sh

./nord-gnome-terminal/src/nord.sh

echo -e "\nFinished nord installation...\n"
