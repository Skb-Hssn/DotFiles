" curl -fLO $HOME/.config/nvim/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath=&runtimepath
" source ~/.vimrc

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

set updatetime=300


"to show file name
set laststatus=2 

set hidden


set t_Co=256

let mapleader = " "

nnoremap <leader>y ggVG"+y''
nnoremap <leader>s :w<Enter>
nnoremap J 4j
nnoremap K 4k


imap jk <Esc>


"========================cursor=================================
" if has("autocmd")
"  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
"  au InsertEnter,InsertChange *
" \ if v:insertmode == 'i' | 
" \   silent execute '!echo -ne "\e[6 q"' | redraw! |
" \ elseif v:insertmode == 'r' |
" \   silent execute '!echo -ne "\e[4 q"' | redraw! |
" \ endif
" au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
" endif
" ================================================================




"===========================Plugins==============================

call plug#begin('~/.config/nvim/plugged')

"Plug 'https://github.com/ycm-core/YouCompleteMe.git'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-commentary'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

"File Auto Load
Plug 'djoshea/vim-autoread'

"Window Swap
Plug 'wesQ3/vim-windowswap'

"kotlin
Plug 'udalov/kotlin-vim'

"Dart
Plug 'dart-lang/dart-vim-plugin'

"Go
Plug 'fatih/vim-go'

"Snippets
Plug 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'

Plug 'octol/vim-cpp-enhanced-highlight'
"

Plug 'voldikss/vim-floaterm'

Plug 'preservim/tagbar'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

Plug 'nvim-lualine/lualine.nvim'


"Themes
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'lifepillar/vim-solarized8'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'flazz/vim-colorschemes'
Plug 'haishanh/night-owl.vim'
Plug 'rakr/vim-one'
Plug 'overcache/NeoSolarized'
Plug 'chriskempson/tomorrow-theme'
Plug 'sainnhe/gruvbox-material'
Plug 'savq/melange'


Plug 'searleser97/cpbooster.vim'

call plug#end()
"=================================================================



"=========================ColorSchemes============================

let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_bold=0
let g:gruvbox_transparent_bg=1
" let g:gruvbox_improved_strings=1
let g:gruvbox_improved_warnings=1


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
" colorscheme night-owl
" colorscheme gruvbox
" colorscheme NeoSolarized
" colorscheme Tomorrow-Night
" colorscheme melange
colorscheme ayu 

set background=dark

" let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_enable_italic = 1
" let g:gruvbox_material_disable_italic_comment = 1

" colorscheme gruvbox-material


" colorscheme one

"pulumi
"hi Normal guibg=NONE ctermbg=NONE ctermfg=256

"Transparent bg
highlight Normal guibg=none
highlight NonText guibg=none



"==================================================================




"==========================Airline=================================

let g:airline_powerline_fonts = 1
let g:airline_section_y = ''

"==================================================================



"========================NerdTree==================================

nnoremap <leader>nt :NERDTreeToggle<CR>

"==================================================================



"=========================CPP-HighLight=============================

" let g:cpp_class_scope_highlight = 1
" let g:cpp_member_variable_highlight = 1
" let g:cpp_class_decl_highlight = 0
" let g:cpp_posix_standard = 1
" let g:cpp_experimental_simple_template_highlight = 1
" let g:cpp_experimental_template_highlight = 1

"===================================================================



"==================== Better window navigation =====================

nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

"===================================================================





"==========================Tab navigation===========================

nnoremap H gT
nnoremap L gt

"===================================================================



"====================== new tabe in normal =========================

nnoremap <Tab> :bnext<Enter>
nnoremap <S-Tab> :bprev<Enter>

"===================================================================





"=========================== YCM ====================================
"hover for ycm
" nmap <leader>D <plug>(YCMHover)

"diags for ycm
nmap <leader>yd :YcmDiags<CR>



" let g:ycm_autoclose_preview_window_after_insertion = 1

"preview window disable ycm
set completeopt-=preview

"=====================================================================




"=========================== Coc ======================================

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"rename
"nmap <leader>rn <Plug>(coc-rename)

""navigate to diagonstic
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Show all diagnostics.
nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>

"" Definition
"nmap <silent> gd <Plug>(coc-definition)

"=======================================================================





"============================ Comment ==================================

autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
autocmd FileType python setlocal commentstring=#\ %s
noremap <leader>/ :Commentary<cr>

"=======================================================================




"=========================== Snippet ===================================

let g:UltiSnipsExpandTrigger = '<C-j>'

"=======================================================================




"==========================Comment=======================================
"vnoremap <leader>/ :s!^!//!<CR> :noh <CR> 
"vnoremap \u :s!^//!!<CR>
"========================================================================




"========================CPBooster=======================================

nnoremap <leader>t :Test<CR>
nnoremap <leader>qt <C-w>l:q<CR>

"========================================================================





"========================LuaLine=======================================
lua << END
require('lualine').setup
{
    options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

END
"========================================================================



"============================Compile and Run=============================

function RunFileGo()
    :! go build -o %:r %
    if v:shell_error == 0
        :! gnome-terminal -- bash -c "time ./%:r; echo ""; echo 'Press Enter to exit......'; read x"
    endif
endfunction

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

    autocmd Filetype go nnoremap <buffer> <F5> 
        \ :w <bar> :! go build -o %:r % <CR>
    
    autocmd Filetype go nnoremap <buffer> <F6> 
        \ :w <bar> call RunFileGo() <CR>


augroup END

"============================================================================




"================================Floaterm====================================
let g:floaterm_keymap_new = '<Leader>ft'
let g:floaterm_keymap_toggle = '<F12>'
"============================================================================


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
