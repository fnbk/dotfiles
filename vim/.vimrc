
"
" backup file: *.ext~ 
" source: http://stackoverflow.com/a/607475
"

"set nobackup
"set nowritebackup
set backupdir=/tmp


"
" swap file: *.ext.swp
"

set swapfile
set directory=/tmp


"
" colors
"

set t_Co=256

"
" syntax highlighting
"

syntax on

"
" color scheme
"

colorscheme github
" colorscheme vividchalk
" set background=dark
" colorscheme solarized


"
" split windows
"

noremap <C-w>- :split<cr>
noremap <C-w>\| :vsplit<cr>

"
" resize current buffer by +/- 5 increments
"

nnoremap <C-h> :vertical resize -5<cr>
nnoremap <C-l> :vertical resize +5<cr>
nnoremap <C-j> :resize +5<cr>
nnoremap <C-k> :resize -5<cr>

"
" leader
"

"let mapleader = " "
"let mapleader = ','


"
" history
"

set history=50


"
" general settings
"

set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " always display the status line
set nocompatible  " use Vim settings, rather then Vi settings



"
" get off my lawn
"

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>


"
" Treat <li> and <p> tags like the block tags they are
"

let g:html_indent_tags = 'li\|p'


"
" Tab completion
"

" will insert tab at beginning of line,
" will use completion if not at beginning

set wildmode=list:longest,list:full
set complete=.,w,t

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>


"
" display line numbers
"

set number
set numberwidth=5


"
" activate pathogen
"
execute pathogen#infect()


"
" enable file type detection
"

filetype plugin on
filetype indent on


"
" highlight tabs
"

set list lcs=tab:▸\
highlight SpecialKey guifg=grey guibg=bg

