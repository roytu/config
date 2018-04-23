" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Custom
set nu
set tabstop=4
set shiftwidth=4
set expandtab
set runtimepath^=~/.vim/bundle/ctrlp.vim
set pastetoggle=<F3>

" Airline
set encoding=utf-8
let g:airline#extensions#tabline#enabled = 1

let g:airline_theme='bubblegum'
set t_Co=256
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" Folding
set foldmethod=indent

" Single character insert
nnoremap <Space> i_<Esc>r

" PDFLatex render
nnoremap <F2> :!pdflatex %<CR>

" Bpython run render
nnoremap <F3> :!PYTHONPATH=~/python/bpython python2.7 -m bpython.cli %<CR>

" Unmap help
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

" Auto save on Ctrl+S
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

" Ctags maps
" https://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Highlight search
set hls

" Jedi
let g:jedi#auto_initialization = 0
