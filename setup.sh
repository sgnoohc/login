pushd $HOME
ln -sf login/.bashrc
ln -sf login/.vimrc
ln -sf login/.screenrc
ln -sf login/.vim
ln -sf login/.bashrc_logout
cd .ssh
if [ "${THISOS}" == "Windows" ]; then
    ln -sf ~/login/.ssh/leptonicconfig config
elif [ "${THISOS}" == "Mac" ]; then
    ln -sf ~/login/.ssh/config
    ln -sf ~/login/macpresets/.tmux.conf
else
    ln -sf ~/login/.ssh/config
fi
cd -
popd
