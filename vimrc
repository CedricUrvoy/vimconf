"" GENERAL

" Set map leader
let mapleader= "\<Space>"
let g:mapleader= "\<Space>"

set nocompatible
filetype off

"
" PLUGINS
"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tweekmonster/startuptime.vim'

" Plugin YCM to autocomplete
Plugin 'Valloric/YouCompleteMe'


Plugin 'tpope/vim-surround'

" NERDTREE
Plugin 'scrooloose/nerdtree'
" CONF
map <leader>t :NERDTreeToggle <CR>
map <leader>r :NERDTreeFind<cr>
let g:NERDTreeMouseMode=2

Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'sheerun/vim-polyglot'

Plugin 'djoshea/vim-autoread'

Plugin 'davidoc/taskpaper.vim'
autocmd filetype taskpaper :WatchForChanges!
let g:task_paper_date_format = "%Y-%m-%d %H:%M"
au BufRead,BufNewFile *.taskpaper setlocal textwidth=80

if has('conceal')
  Plugin 'Yggdroot/indentLine'
  "let g: indentLine_fileTypeExclude=['help']
  "let g: indentLine_bufNameExclude=['NERD_tree.*']
endif

Plugin 'mattn/emmet-vim'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-unimpaired'
Plugin 'junegunn/goyo.vim'
Plugin 'qpkorr/vim-bufkill'

" Git plugins
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'

"Plugin for better javascripdev
Plugin 'moll/vim-node'

" Snippets plugins
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

"Visual Plugin
Plugin 'powerline/powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Themes
Plugin 'arcticicestudio/nord-vim'
Plugin 'tyrannicaltoucan/vim-quantum'

Plugin 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"Open last open files
Plugin 'vim-scripts/mru.vim'
map <leader>f :MRU<CR>

" Search
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'

"Provide linting on file
Plugin 'w0rp/ale'
let g:ale_linters = {
\ 'javascript': ['eslint'],
\}
" After this is configured, :ALEFix will try and fix your JS code with
" ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
"
" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

call vundle#end()            " required

filetype indent plugin on
syntax on
