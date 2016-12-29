mkdir ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s ~/.vim/duduainankai_vim/.vimrc ~/.vimrc
vim +BundleInstall +qall
