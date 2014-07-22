# environment specific variables
BUNDLE_DIR="${HOME}/.vim/bundle"
AUTOLOAD_DIR="${HOME}/.vim/autoload"

# vim plugins to install
PACKAGES="https://github.com/bling/vim-airline 
https://github.com/altercation/vim-colors-solarized
https://github.com/airblade/vim-gitgutter.git
https://github.com/fatih/vim-go.git"

# package list
centos_packages() {
    packages="vim"
}
ubuntu_packages() {
    packages="vim"
}

${DISTRO_NAME_L}_packages
# run package installer
${INSTALLER} ${packages}

rm -rf ${BUNDLE_DIR} ${AUTOLOAD_DIR}

mkdir -p ${BUNDLE_DIR} ${AUTOLOAD_DIR}

# install pathogen
wget -O ${AUTOLOAD_DIR}/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# install all vim plugins
for P in ${PACKAGES}
do
    cd ${BUNDLE_DIR}
    git clone ${P}
done

# kill our .vimrc
[ -f ~/.vimrc ] && rm -f ~/.vimrc

# rebuild .vimrc
cat > ~/.vimrc <<__EOF__
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
let g:solarized_termcolors=256
colorscheme solarized
au FileType python setl sw=4 sts=4 et
au FileType go setl sw=4 sts=4
__EOF__
