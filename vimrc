"" GENERAL

" Set map leader
let mapleader= "\<Space>"
let g:mapleader= "\<Space>"

filetype indent plugin on
syntax on
set nocompatible

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

Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'sheerun/vim-polyglot'

" Plugin for auto-save
Plugin 'vim-scripts/vim-auto-save'
Plugin 'djoshea/vim-autoread'

Plugin 'davidoc/taskpaper.vim'
" Autosave taskpaper files
autocmd filetype taskpaper let g:auto_save = 1
autocmd filetype taskpaper :WatchForChanges!

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
" Ultisnip conf.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
Plugin 'honza/vim-snippets'

"Visual Plugin
Plugin 'powerline/powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" air-line conf
let g:airline_powerline_fonts = 1
let g:airline_theme = 'nord'

" Themes
Plugin 'arcticicestudio/nord-vim'
Plugin 'tyrannicaltoucan/vim-quantum'

Plugin 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

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

" FZF CONF
 nmap ; :Buffers<CR>
 nmap <Leader>y :Tags<CR>
 nnoremap <c-p> :Files<CR>
 nnoremap <leader>a :Rg

" Customize fzf colors to match your color scheme
let g:fzf_colors =
	\ { 'fg':      ['fg', 'Normal'],
	\ 'bg':      ['bg', 'Normal'],
	\ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

set grepprg=rg\ --vimgrep
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --fixed-strings --follow  --color=always --ignore-case --glob "!.git/*" '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
