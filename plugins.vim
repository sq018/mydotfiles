filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'

" Ruby & Rails
Plugin 'tpope/vim-rails'

" File Searching
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'greplace.vim'
Plugin 'rking/ag.vim'

" File Editing
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'

" Auto Completion
Plugin 'mattn/emmet-vim'
Plugin 'jiangmiao/auto-pairs'

" Statusline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Themes and stuff
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'

" syntax highligh
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'chrisbra/Colorizer'
Plugin 'Valloric/MatchTagAlways'

" Vim Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Version Control
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Linting
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
