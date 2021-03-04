syntax on

set nu
"set clipboard=unnamed
set mouse=a
set tabstop=4
set autoindent
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set smartcase
"set number
set smartindent
set incsearch

set splitbelow
set splitright

set relativenumber
set signcolumn=no

"to show file name
set laststatus=2 


autocmd filetype cpp nnoremap <F5> :w <bar> :! g++ -ulimit -Wall -Wno-unused-result -std=c++17   -O2   % -o %:r <CR>
autocmd filetype cpp nnoremap <F6> :w <bar> :! g++ -Wall -Wextra -pedantic -std=c++17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector  % -o %:r <CR>


set t_Co=256
set background=light

"for gruvbox
hi Normal          ctermfg=252 ctermbg=252


let mapleader = " "

nnoremap <leader>y ggVG"+y''
nnoremap <leader>s :w<Enter>


imap jk <Esc>



"Cursor
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
\ if v:insertmode == 'i' | 
\   silent execute '!echo -ne "\e[6 q"' | redraw! |
\ elseif v:insertmode == 'r' |
\   silent execute '!echo -ne "\e[4 q"' | redraw! |
\ endif
au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif





"yy to copy a line and p to paste
"cntrl r to redo

set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin('~/.vim/plugged')

Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'git@github.com:tpope/vim-commentary'
Plug 'git@github.com:morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'git@github.com:ayu-theme/ayu-vim'
Plug 'ryanoasis/vim-devicons'

call plug#end()



let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_contrast_dark = 'hard'
"colorscheme ayu


"Ayu
"set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
colorscheme gruvbox 


"pulumi
hi Normal guibg=NONE ctermbg=NONE ctermfg=256


let g:airline_powerline_fonts = 1
let g:airline_section_y = ''



nmap <leader>nt :NERDTreeToggle<CR>



"Better window navigation
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l


"Tab navigation
nnoremap H gT
nnoremap L gt


"hover for ycm
nmap <leader>D <plug>(YCMHover)

"diags for ycm
nmap <leader>yd :YcmDiags<CR>


"new tabe in normal
nnoremap <Tab> :bnext<Enter>
nnoremap <S-Tab> :bprev<Enter>


let g:ycm_autoclose_preview_window_after_insertion = 1


"Comment 
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
noremap <leader>/ :Commentary<cr>




"preview window disable ycm
set completeopt-=preview



"vnoremap <leader>/ :s!^!//!<CR> :noh <CR> 
"vnoremap \u :s!^//!!<CR>
