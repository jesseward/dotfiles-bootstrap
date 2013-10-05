BUNDLE_DIR="${HOME}/.vim/bundle"
AUTOLOAD_DIR="${HOME}/.vim/autoload"

PACKAGES="https://github.com/bling/vim-airline 
https://github.com/tsaleh/vim-matchit
https://github.com/altercation/vim-colors-solarized"

rm -rf ${BUNDLE_DIR} ${AUTOLOAD_DIR}

mkdir -p ${BUNDLE_DIR} ${AUTOLOAD_DIR}

# install pathogen
curl -Sso ${AUTOLOAD_DIR}/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# install all PACKAGES
for P in ${PACKAGES}
do
    cd ${BUNDLE_DIR}
    git clone ${P}
done

# kill our .vimrc
[ -f ~/.vimrc ] && rm -f ~/.vimrc

# rebuild .vimrc
cat > ~/.vimrc <<__EOF__
call pathogen#infect()
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
set background=dark
colorscheme solarized
__EOF__
