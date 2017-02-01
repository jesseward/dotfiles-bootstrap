#!/bin/bash

# clean_files removes any existing files that may have been laid down by the base os. This is to be run once.
clean_files () {
    FILES=".vimrc .tmux.conf .vim .bashrc .bash_profile ~/bin/base16-ocean.dark.sh ~/bin/git-prompt.sh .gitignore .gitconfig"
    for f in ${FILES}
    do
        echo "INFO : removing file ${f}"
        rm -rf ${HOME}/${f}
    done
}

# run_stow executes gnu stow aginst all directories in cwd
run_stow () {
    ls -d *"/" |tr -d '/' |xargs -n 1 stow -vv
}

stow_check () {
    command -v stow >/dev/null 2>&1 || { echo "GNU Stow is not installed. Aborting." >&2; exit 1; }
}
case "$1" in
    clean)
        clean_files
        ;;
    link)
        stow_check
        run_stow
        ;;
    *)
        echo $"Usage: $0 {clean|link}"
        exit 2
esac
