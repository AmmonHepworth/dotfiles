"------------------[Window]------------------"
" switch window
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" move windows
nnoremap <C-A-S-Right> <C-w>L
nnoremap <C-A-S-Left> <C-w>H
nnoremap <C-A-S-Up> <C-w>K
nnoremap <C-A-S-Down> <C-w>J

" resize window
nnoremap <silent> <C-Right> :vertical resize +5<CR>
nnoremap <silent> <C-Left> :vertical resize -5<CR>
nnoremap <silent> <C-Up> :resize +5<CR>
nnoremap <silent> <C-Down> :resize -5<CR>

nnoremap <silent> <C-S-Right> :vertical resize +1<CR>
nnoremap <silent> <C-S-Left> :vertical resize -1<CR>
nnoremap <silent> <C-S-Up> :resize +1<CR>
nnoremap <silent> <C-S-Down> :resize -1<CR>set t_Co=256

:colors wombat256

autocmd BufNewfile,BufReadPost *.ino,*.pde set filetype =cpp

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab



"--------------[Tab Completion]-------------"
set dictionary=/usr/share/dict/words
inoremap <S-Tab> <C-P>
set complete=.,w,b,u,t,i
set completeopt=menu,preview
filetype plugin on
set omnifunc=syntaxcomplete#Complete


"-----------[]-----------------"
set smartindent  "Auto-indent"
set smarttab
"autoformats code with F2"
nmap <F2> mzgg=G'z 
imap <F2> <Esc><F1>a

nmap <leader>rv :source $MYVIMRC<CR>  


set autoread
autocmd FileType javascript noremap <C-F> <ESC>:w<CR>:!eslint --fix '%:p'<CR>



"-------------SWAP FILE SHIT---------------"
set noswapfile


"------------Lines----------"
set number

"================AUTO EXECUTE=============="
"
let mapleader="\<Space>"
augroup configgroup
autocmd!
autocmd FileType tex nmap <F3> :w<CR> :!latex '%:t'<CR>
autocmd FileType tex imap <F3> <ESC>:w<CR> :!latex '%:t'<CR>

augroup END

augroup configgroup
autocmd!
autocmd FileType python nmap <F3> :w<CR> :!python '%:t'<CR>
autocmd FileType python imap <F3> <ESC>:w<CR> :!python '%:t'<CR>

augroup END


if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()


"=========SYNTASTIC========="
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = " -std=c++17 -Wall -Wextra -Wpedantic"

let g:syntastic_javascript_checkers = ['eslint']


"========NERDTREE========="
nnoremap <Leader>n :NERDTreeToggle<CR>


"======AIRLINE========
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#left_sep = ' '
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])

let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
