" All my keymaps go here
" Taking a modularized approach
" Quickly Edit My VIMRC
" VIM8
nnoremap <leader>sd :tabedit ~/.vimrc <CR>

"Neovim
nnoremap <leader>sv :tabedit $MYVIMRC <CR>

" Git shortcuts
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gw :Gwrite<CR>
" Tabularize shortcuts
noremap <leader>a= :Tabularize /=<CR>
noremap <leader>a: :Tabularize /:<CR>
noremap <leader>a:: :Tabularize /:\zs<CR>
noremap <leader>a, :Tabularize /,<CR>
noremap <leader>a<Bar> :Tabularize /<Bar><CR>
" Enforcing Purity
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

nmap <leader>1 :!chmod +x % <CR>
nmap <leader>4 :source ~/.vimrc <CR>
nnoremap <leader>1 :!chmod +x % <CR>
nnoremap <leader>4 :source ~/.vimrc <CR>

" Improve regex handling
" nmap / /\v
" zoom a vim pane, <C-w>= to rebalance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
nnoremap <leader><space> :noh<cr>
" Map F2 to paste mode so that pasting in the terminal doesn't mess identation
nnoremap <F12> :set invpaste paste?<CR>
"Ommit the <C-W> when moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Window switching keys
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Paste Line with Y
nmap Y y$
vmap Q gq
nmap Q gqap
"yankstack config
nmap Y y$
nmap <leader>z <Plug>yankstack_substitute_older_paste
nmap <leader>c <Plug>yankstack_substitute_newer_paste

" easier better ident in visual
vnoremap < <gv
vnoremap > >gv
" map sort fx to a key

vnoremap <leader>s :sort <CR>
map <leader>ss :call ToggleSpell()<cr>
"easier movement between tabs
map <leader>t <esc>:tabnew<CR>
map <leader>x <esc>:tabclose<CR>
map <leader>f :MRU<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
map <leader>w :w!<CR>
map <space> /\v
map <c-space> ?
map <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/
map <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader>t <esc>:tabnew<CR>
nnoremap <leader>x <esc>:tabclose<CR>
nnoremap <leader>f :MRU<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>e :NERDTreeFind<CR>
nnoremap <space> /\v
nnoremap <c-space> ?
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap ; :
nnoremap : ;

map <leader>sa zg
nnoremap <leader>sa za
" Substitution option for marked word
"python-mode config
au Filetype python map <leader>d :call RopeGotoDefinition()<CR>
au Filetype python nnoremap <leader>d :call RopeGotoDefinition()<CR>
au Filetype python map <leader>b Oimport ipdb; ipdb.set_trace() #BREAKPOINT<C-c>
au Filetype python nnoremap <leader>b Oimport ipdb; ipdb.set_trace() #BREAKPOINT<C-c>
au Filetype markdown map <leader>[ :HeaderDecrease <cr>
au Filetype markdown map <leader>] :HeaderIncrease <cr>
au Filetype markdown map <leader>/ :TableFormat <cr>
nnoremap <leader>we :tabe ~/Documents/notes/index.md <cr>
"Escape: exit autocompletion, go to Normal mode
inoremap <silent><expr> <Esc> pumvisible() ? "<C-e><Esc>" : "<Esc>"

au FileType rust nmap gx <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gd <Plug>(rust-def-vertical)
au FileType rust nmap gt <Plug>(rust-def-tab)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

nnoremap <leader><tab> :tabnext <CR>
nnoremap <leader>` :tabprevious <CR>

nnoremap <C-f> :FuzzyOpen <CR>
