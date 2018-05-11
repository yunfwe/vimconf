#!/bin/bash
mv ~/.vimrc ~/.vimrc.bak &>/dev/null
mv ~/.vim ~/.vim.bak &>/dev/null
echo "Downloading... please wait"
curl -s -fLo  ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cat > ~/.vimrc <<END
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'      " 目录树插件
Plug 'vim-airline/vim-airline'  " 状态栏插件
Plug 'vim-airline/vim-airline-themes' " 状态栏主题插件
Plug 'joshdick/onedark.vim'     " 状态栏主题使用的颜色
Plug 'jiangmiao/auto-pairs'     " 自动补全引号括号
Plug 'vim-scripts/SuperTab'     " 提高Tab键能力的插件
"Plug 'vim-scripts/c.vim'        " 官方C语言插件
Plug 'rkulla/pydiction'         " 轻量级的Python补全插件
Plug 'luochen1990/rainbow'      " 为不同的括号添加颜色的插件
call plug#end()
END

vim -c "PlugInstall" -c "q" -c "q"
# cp -rf .vimrc ~/.vimrc &>/dev/null
rm -rf ~/.vimrc &>/dev/null
curl -s -fLo  ~/.vimrc https://raw.githubusercontent.com/yunfwe/vimconf/master/install.sh
echo "Install done! engoy it..."

