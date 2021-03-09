set nocompatible              " be iMproved, required
filetype off                  " required

" Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'bling/vim-bufferline'
" Plug 'lifepillar/vim-solarized8'
" Plug 'jacoborus/tender.vim'
" Plug 'sjl/badwolf'
" Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'

" Highlights pairs of tags.
Plug 'valloric/matchtagalways'

" gcc command comments / uncomments lines
Plug 'tpope/vim-commentary'

" git
Plug 'tpope/vim-fugitive'

" Language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Smooth scrolling with Ctrl + u / Ctrl + d
Plug 'psliwka/vim-smoothie'

" Marks
Plug 'Yilin-Yang/vim-markbar'
Plug 'kshenoy/vim-signature'

" Self-explanatory
Plug 'machakann/vim-highlightedyank'

" Remove highlights after searching
Plug 'junegunn/vim-slash'

" Initialize plugin system
call plug#end()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","
let g:mapleader=" "

" Security
set modelines=0

" Show line numbers
set number relativenumber
set nu rnu

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
" set wrap
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=8
set shiftwidth=8
set softtabstop=8
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Always show statusline
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
" set t_Co=256
set laststatus=2

" Disable beeping
set noeb vb t_vb=

" Console shows filename
set title 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

source ~/.vimrc_ccls
" nnoremap <C-j> :bprev<CR>                                                                            
" nnoremap <C-k> :bnext<CR>
" nnoremap <C-Left> :bprev<CR>                                                                            
" nnoremap <C-Right> :bnext<CR>
nnoremap <C-f> :Files<CR>
nnoremap <C-b> :Buffers<CR>

" Terminal bindings, switch across splits while
tnoremap <Esc> <C-\><C-n>
" tnoremap <C-w>h <C-\><C-n><C-w>h
" tnoremap <C-w>j <C-\><C-n><C-w>j
" tnoremap <C-w>k <C-\><C-n><C-w>k
" tnoremap <C-w>l <C-\><C-n><C-w>l

" CTRL-Tab is next tab
" noremap <C-Tab> :<C-U>tabnext<CR>
" inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
" cnoremap <C-Tab> <C-C>:tabnext<CR>
" tnoremap <C-Tab> <C-\><C-n><C-w>:tabnext

" CTRL-SHIFT-Tab is previous tab
" noremap <C-S-Tab> :<C-U>tabprevious<CR>
" inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
" cnoremap <C-S-Tab> <C-C>:tabprevious<CR>
" tnoremap <C-S-Tab> <C-\><C-n><C-w>:tabprevious

autocmd FileType xml :setlocal sw=1 ts=1 sts=0 expandtab smarttab shiftwidth=1

if (has("termguicolors"))
 set termguicolors
endif

set t_Co=256
" let g:solarized_termtrans = 1
" let g:solarized_termcolors=256
" set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-ocean
let g:airline_powerline_fonts = 1
" let g:airline_theme='badwolf'
let g:airline#extensions#bufferline#enabled = 0
let g:airline_section_c = '%t%m'
let g:clang_library_path='/usr/lib/llvm-9/lib'
let g:clang_close_preview = 1
" let g:xml_syntax_folding=1
" au FileType xml setlocal foldmethod=syntax

"vim-markbar
" only display alphabetic marks a-i and A-I
" let g:markbar_marks_to_display = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTVUWXYZ'
nmap <Leader>m <Plug>ToggleMarkbar
let g:markbar_marks_to_display = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTVUWXYZ'
let g:markbar_enable_peekaboo = v:false
let g:markbar_width = 60

let g:highlightedyank_highlight_duration = 1500

" Line number gutter changes size depending on if symbols exist
set scl=auto

