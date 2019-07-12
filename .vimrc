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

let g:airline_theme='deus'
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

imap <C-P> import bpdb; bpdb.set_trace()

" Highlight search
set hls

" Jedi
let g:jedi#auto_initialization = 0

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Fixes tmux https://github.com/tmux/tmux/issues/699#issuecomment-269572025
set background=dark

autocmd FileType python setlocal omnifunc=jedi#completions

set tags=./tags;/

" JSON
nmap <C-J> :%!jq .<CR>
nmap <S-J> :%!jq -c .<CR>

" Base64
nmap <C-L> :%!base64 -d<CR>
nmap <S-L> :set nofixendofline<CR>:%!base64 -w0<CR>

" JWT
nmap <C-K> :%!set tmp=%; pyjwt decode --no-verify $(cat $tmp)<CR>
nmap <S-K> :%!set tmp=%; pyjwt encode $(cat $tmp)<CR>

" URL encode
nmap <C-H> :%!set tmp=%; python3 -c "x=\"\"\"$(cat $tmp)\"\"\";from urllib.parse import unquote;print(unquote(x))"<CR>
nmap <S-H> :%!set tmp=%; python3 -c "x=\"\"\"$(cat $tmp)\"\"\";from urllib.parse import quote;print(quote(x))"<CR>

" Encoding
nmap <C-U> :%!set tmp=%; python -c "x=\"\"\"$(cat $tmp)\"\"\";print(x.replace('&', '\n'))"<CR>
nmap <S-U> :%!set tmp=%; python -c "x=\"\"\"$(cat $tmp)\"\"\";print(x.replace('\n', '&'))"<CR>
nmap <C-I> :%!set tmp=%; python -c "x=\"\"\"$(cat $tmp)\"\"\";print(x.replace('; ', '\n'))"<CR>
nmap <S-I> :%!set tmp=%; python -c "x=\"\"\"$(cat $tmp)\"\"\";print(x.replace('\n', '; '))"<CR>
