#!/bin/bash
echo "安装将花费一定时间，请耐心等待直到安装完成^_^"
if which apt-get >/dev/null; then
    sudo apt-get install -y vim vim-gnome ctags xclip astyle python-setuptools python-dev git cscope
elif which yum >/dev/null; then
    sudo yum install -y gcc vim git ctags xclip astyle python-setuptools python-devel cscope
fi

##Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
    echo "You are using HomeBrew tool"
    brew install vim ctags git astyle
fi

sudo easy_install -ZU autopep8
sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
VIM_DIR=~/.vim
VIMRC_FILE=~/.vimrc
if [ -d "$VIM" ]; then
    mv -f ~/.vim ~/.vim_bak
fi
cd ~/ && git clone https://github.com/yiluohan1234/vim.git ~/.vim
if [ -f "$VIMRC_FILE" ]; then
    mv -f ~/.vimrc ~/.vimrc_bak
fi
mv -f ~/.vim/.vimrc ~/
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "正在努力为您安装bundle程序" > yiluohan1234
echo "安装完毕将自动退出" >> yiluohan1234
echo "请耐心等待" >> yiluohan1234
vim yiluohan1234 -c "BundleInstall" -c "q" -c "q"
rm yiluohan1234
echo "安装完成"
