notes for a current config. Will likely change this to an ansible task. 


Colours
=======
- gnome terminal colours - https://raw.githubusercontent.com/chriskempson/base16-gnome-terminal/master/base16-ocean.dark.sh
- Linux Shell - https://github.com/chriskempson/base16-shell (https://raw.githubusercontent.com/chriskempson/base16-shell/master/base16-ocean.dark.sh)

Vim
===
```
cd ~/.vim/bundle
git clone https://github.com/chriskempson/base16-vim.git
git clone https://github.com/bling/vim-airline
git clone https://github.com/jwhitley/vim-matchit.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/fatih/vim-go.git

```

.vimrc
```
execute pathogen#infect()
syntax on
filetype plugin indent on
set ts=4
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set number
set smartindent
set title
set whichwrap+=<>[]hl
set laststatus=2
set cursorline
set background=dark
set incsearch
set hlsearch
let base16colorspace=256
colorscheme base16-ocean
let g:rehash256 = 1
```

tmux
====
```
# Switch me back to ^A, thanks
set-option -g prefix C-a
unbind-key C-b
bind-key a send-prefix
# Options
set-option -sg escape-time 50 # this makes vim fucking awful to use
set-option -g base-index 1
set-option -g default-terminal screen-256color
set-option -g lock-command vlock
set-window-option -g xterm-keys on # to make ctrl-arrow, etc. work
# http://stackoverflow.com/questions/4292572/why-does-tmux-erase-terminal-contents-on-editor-exit
set-window-option -g alternate-screen on
set-option -g set-titles on
set-option -g set-titles-string '[#S:#I #H] #W' # use screen title
```

git config
==========
```
[alias]
    ls = log --pretty=format:"%C(yellow)%h%Cred%d\\\ %Creset%s%Cblue\\\ [%cn]" --decorate
    ll = log --pretty=format:"%C(yellow)%h%Cred%d\\\ %Creset%s%Cblue\\\ [%cn]" --decorate --numstat
    lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
[color]
    branch = auto
    diff = auto
    interactive = auto
    status = auto
[core]
    excludesfile = ${HOME}/.gitignore
```

git ignore
==========
```
# python specific
*.py[cod]
*.egg
*.egg-info
# my virtenv directories
ve
# build directories
build
pip-log.txt
local_settings.py
# c specific
*.so
# global
*~
*.log
# osx
.DS_Store
```
