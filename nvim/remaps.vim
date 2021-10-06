" These allow me to quickly save and quit vim
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Remaps to move line under the cursor up and down
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Remap to toggle markdown preview
nmap <C-m> <Plug>MarkdownPreviewToggle

" FuzzyFinder
nnoremap <leader>f :FZF<CR>

" Zen Mode
noremap <leader>z :ZenMode<CR>
