# package list
centos_packages() {
    packages="tmux"
}
ubuntu_packages() {
    packages="tmux"
}

${DISTRO_NAME_L}_packages
# run package installer
${INSTALLER} ${packages}

# kill our .tmux.conf
[ -f ~/.tmux.conf ] && rm -f ~/.tmux.conf

# rebuild .tmux.conf
cat > ~/.tmux.conf <<__EOF__
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

#### COLOUR (Solarized 256)

# default statusbar colors
set-option -g status-bg colour235 #base02
set-option -g status-fg colour136 #yellow
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg colour244 #base0
set-window-option -g window-status-bg default
#set-window-option -g window-status-attr dim

# active window title colors
set-window-option -g window-status-current-fg colour166 #orange
set-window-option -g window-status-current-bg default
#set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-fg colour235 #base02
set-option -g pane-active-border-fg colour240 #base01

# message text
set-option -g message-bg colour235 #base02
set-option -g message-fg colour166 #orange

# pane number display
set-option -g display-panes-active-colour colour33 #blue
set-option -g display-panes-colour colour166 #orange

# clock
set-window-option -g clock-mode-colour colour64 #green

__EOF__
