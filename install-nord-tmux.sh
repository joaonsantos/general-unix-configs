# Dependencies needed to install tmux nord theme

echo -e "\nInstalling Tmux Plugin Manager (TPM)...\n"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo -e "\nWill copy .tmux.conf to ~/.tmux.conf...\n"

read -p "This will overwrite your current Tmux configuration. Are you sure? [Nn] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Proceeding..."
else
    echo "Quitting."
    exit 1
fi

cp ./.tmux.conf ~/.tmux.conf

echo -e "\nFinished nord tmux installation...\n"

echo -e "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo -e "!!                    Next steps                          !!"
echo -e "!! Enter tmux and press the prefix(Ctrl+b) then the I key !!"
echo -e "!!   to fetch and install the theme automatically.        !!"
echo -e "!!     Modify the tmux conf file to your liking.          !!"
echo -e "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
