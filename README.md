Linux下vim编辑器的配置

一.安装


打开终端，执行下面的命令就自动安装好了：

wget -qO- https://raw.github.com/yiluohan1234/vim/master/setup.sh | sh -x

手动安装YouCompleteMe

cd ~/.vim/bundle/YouCompleteMe

./install.py --clang-completer

ubuntu16.04

python3 ./install.py --clang-completer

二.快捷键设置


1.键盘命令

ctrl + a <==> 全选

鼠标选中状态下，为ctrl + c 复制

F1 <==>注释与反注释

F2 <==>列出当前目录下的文件

F5 <==>编译执行(支持c,cpp,java,sh,python)

F6 <==>右边显示当前文件的函数等

F7 <==>左边显示当前目录下的文件

F8 <==>调试(c,cpp)

