!/bin/bash
# Minimal Bash Setup - Debian Linux

# Vim Config Files
cd
cd .config
if [ ! -d "~/.config/nvim" ]
then
    mkdir nvim
fi
cd nvim
if [ ! -d "~/.config/nvim/autoload" ]
then
    mkdir autoload
fi
cd autoload
if [ ! -d "~/.config/nvim/autoload/plugged" ]
then
    mkdir plugged
fi
cd ..
cat > init.vim << EOF
" vim-plug {{{
call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'Yggdroot/LeaderF'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'justinmk/vim-sneak'

call plug#end()
" }}} vim-plug


" Spaces & Tabs {{{
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
" }}} Spaces & Tabs

" UI Config {{{
set hidden
set number                   " show line number
set showcmd                  " show command in bottom bar
set cursorline               " highlight current line
" }}} UI Config

autocmd BufNewFile * :COQnow
autocmd BufReadPre * :COQnow
EOF
cd
cd ../..

# Install Python3.8 
sudo apt update
sudo apt-get install python3.8

# Install Git
sudo apt-get install git

# !!!!!
# [SET UP GIT ACCOUNT HERE]

# Install keyd
git clone https://github.com/rvaiya/keyd
cd keyd
make && sudo make install
sudo systemctl enable keyd && sudo systemctl start keyd

# keyd config files
cd etc
if [ ! -d "/etc/keyd" ]
then
    mkdir keyd
fi
cd keyd
sudo cat > default.conf << EOF
[ids]

*

[main]
capslock = overload(capslock_layer, esc)

[capslock_layer]
h = left
j = down
k = up
l = right
[ = esc
; = home
' = end

q = C-q
w = C-w
e = C-e
r = C-r
t = C-t
y = C-y
u = C-u
i = C-i
o = C-o
p = C-p
] = C-]
a = C-a
s = C-s
d = C-d
f = C-f
g = C-g
z = C-z
x = C-x
c = C-c
v = C-v
b = C-b
n = C-n
m = C-m
, = C-,
. = C-.
/ = C-/
shift = C-shift
tab = C-tab
EOF
keyd reload

# Install NeoVim
sudo apt-get install neovim

# Install curl
sudo apt-get install curl

# Install Vim-Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


