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

"nnoremap ii ggVG=:w<CR>

"Auto load file
"set autoread
"au CursorHold * checktime

set relativenumber
set signcolumn=no

"to show file name
set laststatus=2 



set t_Co=256
"set background=light

"for gruvbox
"hi Normal          ctermfg=252 ctermbg=252


let mapleader = " "

nnoremap <leader>y ggVG"+y''
nnoremap <leader>s :w<Enter>


imap jk <Esc>



" this for cursor
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

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe.git'
Plugin 'tpope/vim-commentary'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'
Plugin 'ryanoasis/vim-devicons'

"File Auto Load
Plugin 'djoshea/vim-autoread'

"Window Swap
Plugin 'wesQ3/vim-windowswap'

"kotlin
Plugin 'udalov/kotlin-vim'

"Snippets
Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'


"Themes
Plugin 'kaicataldo/material.vim', { 'branch': 'main' }
Plugin 'lifepillar/vim-solarized8'
Plugin 'ayu-theme/ayu-vim'
Plugin 'morhetz/gruvbox'
Plugin 'arcticicestudio/nord-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'haishanh/night-owl.vim'
Plugin 'rakr/vim-one'
Plugin 'overcache/NeoSolarized'

call vundle#end()  


set hidden

let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_contrast_dark = 'hard'


"Ayu
set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme

"solarized
let g:solarized_visibility = 'low'
"let g:solarized_old_cursor_style = 0
let g:solarized_extra_hi_groups = 1

"material
let g:material_theme_style = 'darker-community'



" colorscheme solarized8_light_high
" colorscheme solarized8_light_high
colorscheme night-owl
" colorscheme gruvbox
" colorscheme NeoSolarized


set background=dark

" colorscheme one

"pulumi
"hi Normal guibg=NONE ctermbg=NONE ctermfg=256


let g:airline_powerline_fonts = 1
let g:airline_section_y = ''




nnoremap <leader>nt :NERDTreeToggle<CR>



"Better window navigation
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

"Tab navigation
nnoremap H gT
nnoremap L gt

"new tabe in normal
nnoremap <Tab> :bnext<Enter>
nnoremap <S-Tab> :bprev<Enter>



"hover for ycm
nmap <leader>D <plug>(YCMHover)

"diags for ycm
nmap <leader>yd :YcmDiags<CR>



let g:ycm_autoclose_preview_window_after_insertion = 1


"Comment 
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
autocmd FileType python setlocal commentstring=#\ %s
noremap <leader>/ :Commentary<cr>


"Snippets
let g:UltiSnipsExpandTrigger = 'cm'


"preview window disable ycm
set completeopt-=preview



"vnoremap <leader>/ :s!^!//!<CR> :noh <CR> 
"vnoremap \u :s!^//!!<CR>

augroup exe_code
    autocmd!
    autocmd FileType python nnoremap <buffer> <F6>
        \ :w <CR> :sp<CR> :term /usr/bin/time -f "-----------------\n  Real: \%e sec\n  User: \%U sec\nMemory: \%M KB" 
        \ python3 %<CR> :startinsert<CR>

    autocmd Filetype cpp nnoremap <buffer> <F5> 
        \ :w <bar> :! g++ -Wall -Wextra -std=c++17 % -o %:r <CR>

    autocmd Filetype cpp nnoremap <buffer> <F7> 
        \ :w <bar> :! g++ -Wall -Wextra -pedantic -std=c++17 -O2 -Wshadow -Wformat=2 -Wfloat-equal 
        \ -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align 
        \ -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address 
        \ -fsanitize=undefined -fno-sanitize-recover -fstack-protector  % -o %:r <CR>

    autocmd FileType cpp nnoremap <buffer> <F6>
        \ :w <CR> :sp<CR> :term /usr/bin/time -f "-----------------\n  Real: \%e sec\n  User: \%U sec\nMemory: \%M KB" 
        \ ./%:r<CR> :startinsert<CR>

    autocmd FileType java nnoremap <buffer> <F5>
        \ :w <bar> :! javac % <CR>

    autocmd FileType java nnoremap <buffer> <F7>
        \ :w <bar> :! javac -Xlint:all % <CR>

    autocmd Filetype java nnoremap <buffer> <F6>
        \ :w <CR> :sp<CR> :term /usr/bin/time -f "-----------------\n  Real: \%e sec\n  User: \%U sec\nMemory: \%M KB" 
        \ java %:r<CR> :startinsert<CR>

augroup END


" function RunFile()
"     if v:shell_error == 0
"         :! gnome-terminal -- bash -c "time ./%:r; echo ""; echo 'Press Enter to exit......'; read x"
"     endif
" endfunction

" autocmd filetype cpp nnoremap <F5> :w <bar> :! g++ -Wall -Wextra -std=c++17 % -o %:r <CR>
" autocmd filetype cpp nnoremap <F7> :w <bar> :! g++ -Wall -Wextra -pedantic -std=c++17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector  % -o %:r <CR>
" autocmd filetype cpp nnoremap <F6> :w <bar> call RunFile() <CR> <CR>

" autocmd filetype python nnoremap <F6> :w <bar>  :! gnome-terminal -- bash -c "time python3 %; echo ""; echo 'Press Enter to exit......'; read x;" <CR><CR>
"
let g:python3_host_prog = '/usr/bin/python3.9'
let g:python_host_prog = '/usr/bin/python2.7'
