" These allow me to quickly save and quit vim
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Remaps to move line under the cursor up and down
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" move between panes to left/bottom/top/right
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" Remove search highlighting
noremap <leader>nh :nohl<CR>

" Use Ctrl+A to select the whole file
nnoremap <C-a> ggVG

" function! OpenTerminal()
"   split term://bash
"   resize 10
" endfunction
" " Open terminal
" nnoremap <leader>t :call OpenTerminal()<CR>
nnoremap <leader>t :ToggleTerminal<CR>

" Use Escape to go to normal mode
tnoremap <Esc> <C-\><C-n>

" Open splits
nnoremap <leader>sv :vs<CR>
nnoremap <leader>sh :sp<CR>

" Use Ctrl+Shift+hjkl to resize panes
nnoremap <C-j> :resize -2<CR>
nnoremap <C-k> :resize +2<CR>
nnoremap <C-h> :vert resize -10<CR>
nnoremap <C-l> :vert resize +10<CR>
