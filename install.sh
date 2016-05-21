#!/bin/bash

# clean_files removes any existing files that may have been laid down by the base os. This is to be run once.
clean_files () {
    FILES=".vimrc .tmux.conf .vim .bashrc .bash_profile ~/bin/base16-ocean.dark.sh .gitignore .gitconfig"
    for f in ${FILES}
    do
        echo "INFO : removing file ${f}"
        rm -f ${HOME}/${f}
    done
}

# run_stow executes gnu stow aginst all directories in cwd
run_stow () {
    find . -maxdepth 1 -mindepth 1 -type d -printf '%f\n'|grep -v "\.git" |xargs -n 1 stow -vv
}

case "$1" in
    clean)
        clean_files
        ;;
    link)
        run_stow
        ;;
    *)
        echo $"Usage: $0 {clean|link}"
        exit 2
esac
