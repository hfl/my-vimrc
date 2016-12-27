set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" 自动缩进插件
Plugin 'vim-scripts/indentpython.vim'

" 自动完成插件
Bundle 'Valloric/YouCompleteMe'

" 语法检查和高亮
Plugin 'scrooloose/syntastic'

" BadWhitespace
Plugin 'bitc/vim-bad-whitespace'

" 自动补全插件
Bundle 'Raimondi/delimitMate'

" PEP8检查
Plugin 'nvie/vim-flake8'

" 主题颜色方案
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" 文件浏览器
Plugin 'scrooloose/nerdtree'
" 使用TAB键实现转换
Plugin 'jistr/vim-nerdtree-tabs'

" 超级检索
Plugin 'kien/ctrlp.vim'

" 集成Git
Plugin 'tpope/vim-fugitive'

" 状态条
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后

" 分割窗口导航
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 启用代码折叠
set foldmethod=indent
set foldlevel=99
" 启用空格键实现对折叠的控制
nnoremap <space> za

" 识别.py 文件，执行pep8标准
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" 使用Unicode
set encoding=utf-8

let python_highlight_all=1
syntax on
set nu

" 启用系统剪贴板
set clipboard=unnamed

" 颜色主题设置
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" 主题转换快捷键
call togglebg#map("<F5>")
