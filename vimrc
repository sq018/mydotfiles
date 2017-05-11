set nocompatible                    " be iMproved, required

" source Vunble plugins
so ~/.vim/plugins.vim

syntax enable
set background=dark
colorscheme solarized


let mapleader=','

" /----------------- VISUALS ------------------/

set guifont=Fira\ Code:h14
" set macligatures

" set mvim line height, set iterm lh in the app's setting
set linespace=3

" no blinking cursor
set gcr=a:blinkon0

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
"
" set line display
set number
" set line number background
highlight LineNr guibg=bg

" disable gui tabs
set guioptions-=e
" normally disable scrollbar and when split
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" set a mark for col 80th
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray guibg=#073642

" set vertical split bar syle
set fillchars=
hi vertsplit guifg=#444759

" use 256 colors on cterm Vim
set t_CO=256

" /----------------- BEHAVIORS ------------------/

" make backspace behave like every other editor.
set backspace=indent,eol,start

" buffers become hidden if they are abandoned, no prompt save, yes!
set hidden

" detect file change outside Vim
set autoread

" set noshowmode
set showcmd

" hard wrap lines by inserting newline, using gq to reformat
set textwidth=80

" keep cursor visible within 3 lines when scrolling
set scrolloff=3

" no backups
set nobackup nowritebackup noswapfile


" search settings
set incsearch                       " find the next match as we type the search
set hlsearch                        " highlight searches by default
set ignorecase
set smartcase                       " override ic with search pattern

" indentation settings
set autoindent                      " auto indent based on line above
set smartindent                     " smarter indent for C-like languages

" tabs settings
set expandtab                       " use spaces instead of tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab

" split windows management
set splitbelow
set splitright

" /----------------- MAPPINGS ------------------/

inoremap jk <esc>

nnoremap <Leader>ev :tabedit $MYVIMRC<cr>
nnoremap <Leader>ep :vsp $HOME/.vim/plugins.vim<cr>
nnoremap <Leader>sv :so $MYVIMRC<cr>

" nnoremap <Leader><space> :nohlsearch<cr>

" remap for Fugitive :Gstatus Command-g
nnoremap <D-g> :Gstatus<cr>

" go back to file explorer
nnoremap - :Explore<cr>
" clear all buffers
nnoremap <D-d> :bufdo bd!<cr>
" cycle between two last buffers
nnoremap <D-b> <C-^>

" auto indent tag in insert by Option-o
inoremap <M-o> <cr><ESC>O


" /----------------- PLUGINS CONFIGS ------------------/

" Vim Airline
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'eruby': 1,
    \}

" Javascript syntax libraries
let g:used_javascript_libs='jquery,angularjs'

" Colorizer
let g:colorizer_auto_filetype='scss,css,html'
let g:colorizer_skip_comments = 1

" Emmet-vim
let g:user_emmet_leader_key='<C-e>'

" netrw
" hide dot files
" let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'

" Ag configs
let g:ag_working_path_mode="r"            " search from root

" Greplace configs
" use ag for searching
set grepprg=ag\ --nogroup\ --nocolor
let g:grep_cmd_opts='--line-numbers --noheading'

" CtrlP configs
" <C-d> for toggle between file and path
" Command-P for trigger ctrlp
let g:ctrlp_map='<D-p>'
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRU<cr>
" restrict results to 30, bottom to top
let g:ctrlp_match_window='bottom,order:btt,min:1,max:30,results:30'
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command='ag -Q -l --nocolor --hidden -g "" %s'
" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching=0

" UltiSnips
" trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"         " UltiSnip split vertically


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height= 7
" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": [],
        \ "passive_filetypes": ["html", "css", "scss"] }

let g:syntastic_javascript_jshint_quiet_messages = {
      \ "regex": 'use strict' }

" Syntastic quiet messages template
" let g:syntastic_quiet_messages = {
"       \ "!level":  "errors",  " or warnings
"       \ "type":    "style",   " or syntax
"       \ "regex":   '\m\[C03\d\d\]',   " matched error msg
"       \ "file:p":  ['\m^/usr/include/', '\m\c\.h$'] }   " matched filename

nnoremap <f1> :SyntasticToggleMode<cr>
nnoremap <f2> :SyntasticCheck<cr>
nnoremap <f3> :SyntasticReset<cr>


" Multiple Cursors
" turn * search results into cursors
nnoremap <M-j> :MultipleCursorsFind <C-r>/<cr>
vnoremap <M-j> :MultipleCursorsFind <C-r>/<cr>

" /----------------- AUTO COMMAND ------------------/

" augroup js_tab_config
"   autocmd!
"   autocmd Filetype javascript setlocal softtabstop=4
"   autocmd Filetype javascript setlocal shiftwidth=4
" augroup END

" augroup reload_vimrc
"   autocmd!
"   autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
" augroup END


" /----------------- Macvim-Specific ------------------/
if has("gui_macvim")
    " enable bindings to <M-..>
    set macmeta
endif

