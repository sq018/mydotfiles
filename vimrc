set nocompatible                    " be iMproved, required

" source Vunble plugins
so ~/.vim/plugins.vim

syntax enable
set background=dark
colorscheme spacedust


let mapleader=','

" /----------------- VISUALS ------------------/

" style up popup menu
" highlight Pmenu guibg=brown gui=bold

" set font face and size
set guifont=Fira\ Code:h14
set macligatures

" set mvim line height, set iterm lh in the app's setting
set linespace=3

" use 256 colors on cterm Vim
set t_CO=256

" set a mark for col 80th
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray guibg=#364757

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

" set vertical split bar syle
set fillchars=
hi vertsplit guifg=#1D2D3F

" /----------------- BEHAVIORS ------------------/

" detect file change outside Vim
set autoread

" auto write files
" set autowriteall

" set wrap 80 columns
" set wrapmargin=80

" keep cursor visible within 5 lines when scrolling
set scrolloff=5

set nobackup
set noswapfile
set linebreak
" disable vim mode info
set noshowmode

" lines' width is 80 col
set textwidth=80

" search settings
set incsearch                       " find the next match as we type the search
set hlsearch                        " highlight searches by default
set ic                              " ignore case
set smartcase                       " override ic with search pattern

" indentation settings
set autoindent                      " auto indent based on line above
set smartindent                     " smarter indent for C-like languages

" tabs settings
set expandtab                       " convert tab to spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2

" split windows management
set splitbelow
set splitright

" make backspace behave like every other editor.
set backspace=indent,eol,start


" /----------------- MAPPINGS ------------------/

nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>ep :vsp ~/.vim/plugins.vim<cr>
nmap <Leader><space> :nohlsearch<cr>
" auto indent tag in insert
inoremap <M-o> <cr><ESC>O<tab>

" compile js files
nnoremap <Leader><Leader>c :!node %<cr>

" go back to file explorer
nnoremap - :Explore<cr>
" clear all buffers
nnoremap <D-d> :bufdo bd!<cr>
" cycle between two last buffers
nnoremap <D-b> <C-^>


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
" autocmd BufReadPre *.js let b:javascript_lib_use_jquery=1
" autocmd BufReadPre *.js let b:javascript_lib_use_angularjs=0

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

" prevent NERDTree override netrw
let NERDTreeHijackNetrw=0
" let NERDTreeIgnore=['\.vim$', '\~$']
nmap <D-k>b :NERDTreeToggle<cr>


" CtrlP configs
" <C-d> for toggle between file and path
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
let g:syntastic_javascript_checkers = ['jshint']
nnoremap <f1> :SyntasticToggleMode<cr>
nnoremap <f2> :SyntasticCheck<cr>
nnoremap <f3> :SyntasticReset<cr>


" Multiple Cursors
" turn * search results into cursors
nnoremap <M-j> :MultipleCursorsFind <C-r>/<cr>
vnoremap <M-j> :MultipleCursorsFind <C-r>/<cr>

" /----------------- AUTO COMMAND ------------------/
" auto source the .vimrc file on save, autogroup autocmd!
" clear out the group, start from scratch, only autocmd once

augroup tab_config
  autocmd!
  autocmd Filetype javascript setlocal softtabstop=4
  autocmd Filetype javascript setlocal shiftwidth=4
augroup END

augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END


" /----------------- Laravel-Specific ------------------/

" nmap <Leader>lr :e app/Http/routes.php<cr>
" nmap <Leader>lm :!php artisan make:


" /----------------- Macvim-Specific ------------------/
if has("gui_macvim")
    " disable OS X to use Opt key
    set macmeta
endif


" /----------------- Notes -----------------/

" Syntastic
" :SyntasticInfo    // show checkers
" :h syntastic-checkers     // what checkers are supported
" :lclose | :lnexp | :lprevious  // close error pane | next | prev
" :SyntasticToggleMode
" :SyntasticReset           // reset location pane

" Auto_pairs
" after ; hit } to jump out
" <M-b> back edit
" <M-n> next matching pairs
" <M-p> toggle app
" <M-e> wrap

" Misc
" word count g, <C-g>
