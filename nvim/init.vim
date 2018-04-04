
" init.vim
" TODO write Intro
"

" TODO
" * visual select into pbcopy
" * setup markdown viewer (livedown)
" * learn pathogen plugin (git browsing)
"


" Some day maybe
" Plug 'sebdah/vim-delve'

"
" build hooks
"

"
" Plugins
"

" Source: https://github.com/junegunn/vim-plug
" Install: curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" General
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " better omnicompletion
Plug 'tomtom/tcomment_vim' " easy comment in/out in different languages
Plug 'w0rp/ale' " Asynchronous Lint Engine (supports almost anything)
Plug 'vim-airline/vim-airline' " status bar on steroides
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree' " file explorer (file drawer)
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/neocomplcache'        " Depenency for Shougo/neosnippet
Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'  " TODO breaks omnicompletion
Plug 'tpope/vim-fugitive' " Git
Plug 'shime/vim-livedown' " markdonw viewer

" Language specific
Plug 'zchee/deoplete-go', { 'do': 'make'} " go specific omnicompletion
Plug 'fatih/vim-go'
Plug 'dag/vim-fish'


" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'romainl/Apprentice'
Plug 'fatih/molokai' " port of the monokai theme for TextMate

call plug#end()

"
" Open Issues
"

" * :GoImplements does not jump to line number
" * :GoRename does not really work 



"
" Yank to System Clipboard
"

function! ClipboardYank()
  call system('pbcopy', @@)
endfunction
" function! ClipboardPaste()
"   let @@ = system('pbpaste')
" endfunction

" vnoremap <silent> y y:call ClipboardYank()<cr>
vmap <D-c>call ClipboardYank()
" vnoremap <silent> d d:call ClipboardYank()<cr>
" nnoremap <silent> p :call ClipboardPaste()<cr>p

set mouse=c

"
" General NeoVim
"

" setting bash as default
set shell=/bin/bash

" set leader key, default is '\'
let mapleader=","


" Path to python interpreter for neovim
let g:python_host_prog  = '/usr/local/bin/python2'
let g:python3_host_prog  = '/usr/local/bin/python3'

" disable indentation when pasting into Vim
" set paste " breaks omnicompletion

" show line numbers
set nu

" detects the type of file that is beeing edited
filetype plugin on

" automatically read in changed files outside of Vim
set autoread

" remember last position jump
" autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>


"
" Tabs and Spaces
"

" by default, the indent is 2 spaces.
set shiftwidth=2
set softtabstop=2
set tabstop=2

" file specific tabs and spaces
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript.jsx setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 expandtab

autocmd FileType go setlocal shiftwidth=4 tabstop=4 tabstop=4 softtabstop=4 noexpandtab
" au FileType go set noexpandtab
" au FileType go set shiftwidth=4
" au FileType go set softtabstop=4
" au FileType go set tabstop=4

"
" Navigation
"

" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"
" Colors
"

" apprentice
set background=dark
colorscheme apprentice
let g:airline_theme='minimalist'
" let g:airline_theme='distinguished'

" Override the search highlight color with a combination that is easier to
" read. The default PaperColor is dark green background with black foreground.
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
highlight Search guibg=DeepPink4 guifg=White ctermbg=53 ctermfg=White


"
" Plugin: Shougo/deoplete.nvim
"

" enable deoplete
let g:deoplete#enable_at_startup = 1

" <TAB>: completion, autocomplete, omnicompletion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" disable scratch preview window on autocompletion
set completeopt-=preview


"
" Plugin: zchee/deoplete-go
"

" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1


"
" Plugin: fatih/vim-go
"

" highlighting options
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" highlight same variables when cursor on it
let g:go_auto_sameids = 1

" disable mapping to 'K', which opens :GoDoc
let g:go_doc_keywordprg_enabled = 0

" auto import go-dependencies
let g:go_fmt_command = "goimports"

" fuzzy search functions in project files
" au FileType go nmap <leader>gt :GoDeclsDir<cr>

" show type definition in status line
let g:go_auto_type_info = 1

" :GoAddTags
let g:go_addtags_transform = "snakecase"

" search for Functions and jump there: ,gt
au FileType go nmap <leader>gt :GoDeclsDir<cr>

" :GoAlternate (with split windows)
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)

" :GoTest
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" :GoBuild
autocmd FileType go nmap <leader>b  <Plug>(go-build)

" :GoCoverageToggle
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" set snippet engine
let g:go_snippet_engine = "neosnippet"

" gometalinter settings:
" vet - Reports potential errors that otherwise compile.
" gotype - Syntactic and semantic analysis similar to the Go compiler.
" deadcode - Finds unused code.
" gocyclo - Computes the cyclomatic complexity of functions.
" golint - Google's (mostly stylistic) linter.
" varcheck - Find unused global variables and constants.
" structcheck - Find unused struct fields.
" aligncheck - Warn about un-optimally aligned structures.
" errcheck - Check that error return values are used.
" megacheck - Run staticcheck, gosimple and unused, sharing work.
" dupl - Reports potentially duplicated code.
" ineffassign - Detect when assignments to existing variables are not used.
" interfacer - Suggest narrower interfaces that can be used.
" unconvert - Detect redundant type conversions.
" goconst - Finds repeated strings that could be replaced by a constant.
" gas - Inspects source code for security problems by scanning the Go AST.
" testify - Show location of failed testify assertions.
" test - Show location of test failures from the stdlib testing module.
" gofmt -s - Checks if the code is properly formatted and could not be further simplified.
" goimports - Checks missing or unreferenced package imports.
" gosimple - Report simplifications in code.
" lll - Report long lines (see --line-length=N).
" misspell - Finds commonly misspelled English words.
" unparam - Find unused function parameters.
" unused - Find unused variables.
" safesql - Finds potential SQL injection vulnerabilities.
" staticcheck - Statically detect bugs, both obvious and subtle ones.
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'deadcode', 'gofmt', 'gocyclo', 'varcheck']
" TODO extend vim-go with custom metalinting error suppression
" /Users/florian/primary/go/bin/gometaliner
" ignore warning: exported method ZZZ should have comment or be unexported (golint)
" ignore warning: receiver name should be a reflection of its identity; don't use generic names such as "this" or "self" (golint)

" let g:go_metalinter_command = 'gometalinter --disable-all --enable=errcheck --enable=vet --enable=golint --enable=deadcode --enable=gofmt --enable=gocyclo --enable=varcheck -e "should have comment or be unexported" -e "receiver name should be a reflection of its identity"'

" let g:go_metalinter_command = 'gometalinter --disable-all --enable=errcheck --enable=vet --exclude=golint'

"
" Plugin: scrooloose/nerdtree
"

map <C-n> :NERDTreeToggle<CR>
" open file drawer when opening directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Files to ignore
let NERDTreeIgnore = [
    \ '\~$',
    \ '\.pyc$',
    \ '^\.DS_Store$',
    \ '^node_modules$',
    \ '^.ropeproject$',
    \ '^__pycache__$'
\]

" Show hidden files by default
let NERDTreeShowHidden = 1

" Allow NERDTree to change session root
let g:NERDTreeChDirMode = 2


"
" Plugin: w0rp/ale
"

" Error and warning signs
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

" let g:ale_linters = {'go': ['gometalinter', 'gofmt']}

" ignore warning: exported method ZZZ should have comment or be unexported (golint)
" ignore warning: receiver name should be a reflection of its identity; don't use generic names such as "this" or "self" (golint)
let g:ale_go_gometalinter_options = '-e "should have comment or be unexported" -e "receiver name should be a reflection of its identity"'

" 
" Plugin: ctrlpvim/ctrlp.vim
" 

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 1 " for now use caching

"
" Plugin: Shougo/neosnippet
"

" Below you can disable default snippets for specific languages. If you set the
" language to _ it sets the default for all languages.
let g:neosnippet#disable_runtime_snippets = {
    \ 'go': 1
\}

" Keybindings
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Set the path to our snippets
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'


"
" Plugin: shime/vim-livedown
"

" TODO execute LivedownKill on leave .md file (stop livedown server)

" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 1

" should the browser window pop-up upon previewing
let g:livedown_open = 1

" the port on which Livedown server will run
let g:livedown_port = 1337

" the browser to use
let g:livedown_browser = "\"'google chrome' --background\""

"
" Plugin: dag/vim-fish
"

if &shell =~# 'fish$'
    set shell=sh
endif

" Set up :make to use fish for syntax checking.
compiler fish

" Set this to have long lines wrap inside comments.
setlocal textwidth=79

" Enable folding of block structures in fish.
setlocal foldmethod=expr

