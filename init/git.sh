# package list ignored, as git is installed in base..
# kill our .gitconfig
[ -f ~/.gitconfig ] && rm -f ~/.gitconfig

# rebuild .gitconfig
cat > ~/.gitconfig <<__EOF__
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
__EOF__

[ -f ~/.gitignore ] && rm -f ~/.gitignore

# rebuild gitignore
cat > ~/.gitignore <<__EOF__
# python specific
*.py[cod]
*.egg
*.egg-info
pip-log.txt
local_settings.py

# c specific
*.so

# global
*~
*.log

# osx
.DS_Store
__EOF__
