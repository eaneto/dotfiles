execute pathogen#infect()

" Enable the syntax syntax on filetype plugin indent on " This and the if statement must be set to lightline works

set laststatus=2

set noshowmode

let g:lightline = {
\   'active': {
\       'left': [['mode', 'paste'],
\                ['gitbranch', 'readonly', 'filename','modified']]
\   },
\   'component_function': {
\       'gitbranch': 'fugitive#head'
\   },
\ }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:jsx_ext_required = 0

" Activates sumplylFold
let g:SimpylFold_docstring_preview=1

" set autoclosing tags in filenames like *.html, *.xhtml
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php"

" Set the files encoding to UTF_8
set encoding=utf-8

set expandtab
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
retab

" Indents will have a width of 4
set shiftwidth=4

" Sets the number of columns for a TAB
set softtabstop=4

" Sets the auto indent to true
set autoindent

" Smart indent
set si

" Enables visual wrapping
set wrap

" Turns off Physical line wrapping
set textwidth=0 wrapmargin=0

" highlight matching [{()}]
set showmatch

" Sets the file format to be Unix
set fileformat=unix

" Highlights the current line
set cursorline

" Shows numbe line
set number

" Always show current position
set ruler

set showcmd

" set which area of the screen is gonna split
set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Remap the keys to move around panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Specific config for python files
let python_highlight_all = 1

" Adds PEP8 proper identation.
au BufNewFile,BufRead *.py:
        \ set shiftwidth=4
        \ set textwidth=79
        \ set autoindent
        \ set fileformat=unix
        \ set tabstop=4
        \ set expandtab
		\ retab

" Adds the correct identation to javascript, html and css files.
au BufNewFile,BufRead *.html:
        \ set tabstop=2
        \ set softtabstop=2
        \ set shiftwidth=2
        \ set fileformat=unix

autocmd Filetype javascript.jsx setlocal ts=2 sts=2 sw=2

au BufNewFile,BufRead *.css:
        \ set tabstop=2
        \ set softtabstop=2
        \ set shiftwidth=2
        \ set fileformat=unix

" Disables the arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Sets the colorscheme to onedark
set t_Co=256
set background=dark
" colorscheme onedark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif
