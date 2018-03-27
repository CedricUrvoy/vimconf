"
" Theme settings
"

colorscheme nord

let g:nord_italic=1
let g:nord_italic_comments=1
let g:nord_comment_brightness=15

autocmd! BufEnter,BufNewFile *.taskpaper colorscheme default
autocmd! BufLeave  *.taskpaper colorscheme nord
