notes for a current config. Will likely change this to an ansible task. 


Colours
=======
- gnome terminal colours - https://raw.githubusercontent.com/chriskempson/base16-gnome-terminal/master/base16-ocean.dark.sh
- iterm2 colours - https://raw.githubusercontent.com/chriskempson/base16-iterm2/master/base16-ocean.dark.256.itermcolors
- Linux Shell - https://github.com/chriskempson/base16-shell (https://raw.githubusercontent.com/chriskempson/base16-shell/master/base16-ocean.dark.sh)
- .Xresources base16-ocean.dark.256. - https://raw.githubusercontent.com/chriskempson/base16-xresources/master/base16-ocean.dark.256.xresources

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
======
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

set -g default-terminal "screen-256color"
set -g status-bg colour235
set -g status-fg white

set-window-option -g window-status-current-fg black
set-window-option -g window-status-current-bg green

set -g pane-border-fg colour235
set -g pane-border-bg black
set -g pane-active-border-fg green
set -g pane-active-border-bg black
```

xmonad
=======
```
import System.Posix.Env (getEnv)
import Data.Maybe (maybe)

import XMonad
import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Config.Kde
import XMonad.Config.Xfce

main = do
     session <- getEnv "DESKTOP_SESSION"
     let config = maybe desktopConfig desktop session
     xmonad $ config  {
      terminal = "urxvt256c" -- set default terminal urxvt. Config specified in ~/.Xdefaults
     } 

desktop "gnome" = gnomeConfig
desktop "kde" = kde4Config
desktop "xfce" = xfceConfig
desktop "xmonad-gnome" = gnomeConfig
desktop _ = desktopConfig

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

Xresources
==========
```
! URxvt

!URxvt.termName:           rxvt-256color
*customization:           -color
URxvt.title:              Terminal
Urxvt.loginShell:         true

URxvt*visualBell:         false
URxvt*urgentOnBell:       true
URxvt*scrollBar:          false
URxvt*internalBorder:     0

URxvt.depth:              32

! Fonts
!
URxvt.font: xft:Anonymous Pro:size=12
URxvt.colorBD:            #000000
URxvt.xftAntialias:       true
URxvt.letterSpace: 1

! urxvt will force a screen refresh on each new line it received
URxvt*jumpScroll:         false
URxvt*saveLines:          10000

! Match URLs
! urlLauncher (ubuntu) url-launcher (archlinux)
URxvt*perl-ext-common:    default,matcher
urxvt*url-launcher:       /usr/bin/google-chrome-stable
URxvt*underlinedURLs:     true
URxvt*matcher.button:     1
URxvt*matcher.pattern.1:  \\bwww\\.[\\w-]+\\.[\\w./?&@#-]*[\\w/-]
! Dont select special chars
URxvt.cutchars:           "`()'*[]{|}"

! Disable Keycap Picture Insert and ISO-14755 Mode. Trigger by Ctrl-Shift
! https://bitbucket.org/sme/dotfiles/src/0b4387472283/.Xdefaults
URxvt.iso14755_52:        false
URxvt.iso14755:           false
```

