" PLUGIN INSTALL USING VIM-PLUG (https://github.com/junegunn/vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically download and install vim-plug if it's not installed
set nocompatible
syntax on
filetype on
filetype indent plugin on    " required
syn on
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

Plug 'mattn/sonictemplate-vim'
Plug 'euclio/vim-markdown-composer'
Plug 'mattn/emmet-vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'osyo-manga/vim-over'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-eunuch'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'nelstrom/vim-markdown-folding'
Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'tweekmonster/braceless.vim', {'for': ['python']}
Plug 'vim-syntastic/syntastic'
Plug 'alvan/vim-closetag'
Plug 'kien/ctrlp.vim'
Plug 'python-mode/python-mode'
Plug 'Lokaltog/vim-powerline'
Plug 'vim-ruby/vim-ruby'
Plug 'TralahM/Efficient-python-folding'
Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'
Plug 'yegappan/mru' "most recently used
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'dense-analysis/ale'
Plug 'amix/open_file_under_cursor.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'michaeljsmith/vim-indent-object'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'altercation/vim-colors-solarized'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'justinmk/vim-sneak'
Plug 'nanotech/jellybeans.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/context_filetype.vim'
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'vim-scripts/IndexedSearch'
Plug 'ehamberg/vim-cute-python'


if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    Plug 'davidhalter/jedi-vim'
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'davidhalter/jedi-vim'
endif

call plug#end()

" BEGIN CONFIGURATIONS HERE
"vim POwerline config
set laststatus=3

" Deoplete Conf
let g:deoplete#enable_at_startup=1
let g:indent_guides_enable_on_vim_startup=1

"yankstack config
nmap <leader>v <Plug>yankstack_substitute_older_paste
nmap <leader>V <Plug>yankstack_substitute_newer_paste
let g:yankstack_yank_keys = ['y', 'd']

"python-mode config
map <leader>d :call RopeGotoDefinition()<CR>
nnoremap <leader>d :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 0
let g:pymode_rope_goto_def_newwin="vsplit"
let g:pymode_rope_extended_complete=0
let g:pymode_breakpoint=1
let g:pymode_syntax=1
let g:pymode_syntax_builtin_objs=1
let g:pymode_syntax_builtin_funcs=1
map <leader>b Oimport ipdb; ipdb.set_trace() #BREAKPOINT<C-c>
nnoremap <leader>b Oimport ipdb; ipdb.set_trace() #BREAKPOINT<C-c>

" Window switching keys
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"easier movement between tabs

map <leader>. <esc>:tabnext<CR>
map <leader>, <esc>:tabprevious<CR>
map <leader>t <esc>:tabnew<CR>
map <leader>x <esc>:tabclose<CR>
map <leader>f :MRU<CR>
map <leader>nn :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
map <leader>w :w!<CR>
map <space> /
map <c-space> ?
map <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/
map <leader>cd :cd %:p:h<CR>:pwd<CR>
map <leader>g :Ack
nnoremap <leader>w :w!<CR>
nnoremap <leader>. <esc>:tabnext<CR>
nnoremap <leader>, <esc>:tabprevious<CR>
nnoremap <leader>t <esc>:tabnew<CR>
nnoremap <leader>x <esc>:tabclose<CR>
nnoremap <leader>f :MRU<CR>
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>e :NERDTreeFind<CR>
nnoremap <space> /
nnoremap <c-space> ?
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>g :Ack
nnoremap ; :
nnoremap : ;

" Fuzzy File Finder
set path+=**
set wildmenu

"" Better navigation through omnicomplete option list
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action=='j'
            return "\<C-N>"
        elseif a:action =='k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

set nofoldenable

"CTRLP config

" The Silver Searcher
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command='ag %s -l --nocolor -g'
    let g:ctrlp_use_caching=1
endif

let g:ctrlp_max_height=7
let g:ctrlp_map='<C-f>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'

" GENERAL CONGIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some of the following is taken from Steve Losh:
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" autoreloading of the vimrc file.
set wildignore+=*_build/*
set wildignore+=*.pyc,*.so,*.swp,*.zip,*.un~,.*.*~
set wildignore+=*/coverage/*

autocmd! bufwritepost .vimrc source %
set autoindent
set clipboard=unnamed
" set cursorline
set laststatus=2
set modelines=0
set nocompatible
set nojoinspaces
set showcmd
set showmode
set visualbell

" easier better ident in visual
vnoremap < <gv
vnoremap > >gv
" map sort fx to a key

vnoremap <leader>s :sort <CR>
" Remove the underline from enabling cursorline
highlight Cursorline cterm=none
" Set line numbering to red background:
highlight CursorLineNR cterm=bold ctermbg=cyan ctermfg=white
set ruler
set undofile
set ignorecase
set smartcase
au FocusLost * :wa

vmap Q gq
nmap Q gqap
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
" vnoremap <tab> %
set encoding=utf-8
set t_Co=256
set ttimeoutlen=50
set history=720
set undolevels=720
set nobackup
set nowritebackup
set noswapfile
" Set identation to 4 spaces
set noai ts=4 sw=4 expandtab
" Set an 80 char column
set textwidth=90
set colorcolumn=91
highlight ColorColumn ctermbg=black
" Line numbers
set number
highlight LineNr ctermfg=white
highlight SignColumn ctermbg=black
" Rule for Makefiles to use tab
autocmd BufEnter ?akefile* set noet ts=4 sw=4
" Syntax highlighting
syntax on
autocmd BufNewFile,BufRead *.ipy set filetype=python
autocmd BufNewFile,BufRead *.pyx set filetype=python
autocmd BufNewFile,BufRead SConstruct set filetype=python
autocmd BufNewFile,BufRead *.md set filetype=markdown
" Color scheme
syntax enable
let g:solarized_termcolors=256
let g:gitgutter_max_signs=1000
let g:UltiSnipsSnippetDirectories=["/home/african/.vim/plugged/vim-snippets/UltiSnips"]
set background=dark
colorscheme delek
" let g:solarized_contrast="high"
highlight clear SpellBad
highlight SpellBad cterm=underline,bold ctermbg=none ctermfg=red
" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e
" Git commits
autocmd Filetype gitcommit setlocal spell textwidth=89
" Map F2 to paste mode so that pasting in the terminal doesn't mess identation
nnoremap <M-V> :set invpaste paste?<CR>
set pastetoggle=<M-v>
set showmode
" Disable folding. It's really annoying and I never remeber the commands.
set nofoldenable
" use python folding style for markdown.
let g:vim_markdown_folding_style_pythonic=1
let g:vim_markdown_follow_anchor=1
" Turn on latex math syntax
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_toml_frontmatter=1
let g:vim_markdown_json_frontmatter=1
let g:vim_markdown_strikethrough=1
let g:vim_markdown_no_extensions_in_markdown=1
let g:vim_markdown_autowrite=1
let g:vim_markdown_edit_url_in="tab"

" Ommit the <C-W> when moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Spell Check
" Function to rotate the spell language that is used
let b:myLang=0
let g:myLangList=["nospell","pt_br","en_us"]
function! ToggleSpell()
    let b:myLang=b:myLang+1
    if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
    if b:myLang==0
        setlocal nospell
    else
        execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
    endif
    echo "spell checking language:" g:myLangList[b:myLang]
endfunction
" Pressing \ss will toggle and untoggle spell checking
map <leader>ss :call ToggleSpell()<cr>
" ]s and [s to move down-up marked words
" Shortcuts using <leader> (\)
" Add word to dictionary
map <leader>sa zg
nnoremap <leader>sa zg
" Substitution option for marked word
map <leader>s? z=
" Spelling always on for some files
autocmd BufNewFile,BufRead *.ipy,*.py,*.md,*.tex,*.rst,*.c,*.h,Makefile setlocal nospell

" Run 'make' on save
function! EnableRunMakeOnSave()
    autocmd BufWritePost * silent! execute "!make >/dev/null 2>&1" | redraw! | echo "Done: make finished."
    echo "Running 'make' on save enabled."
endfunction
" map <leader>m :call EnableRunMakeOnSave()<cr>
" Replace Esc with Ctrl+L to make this work better on Termux.
" Android uses Esc as a shortcut for the home screen.
" Use solution in:
" http://vim.wikia.com/wiki/Avoid_the_escape_key
" This is a variation on the previous mapping that additionally checks for
" the popup menu (present when doing completions). During completions, <C-L>
" adds a character from the current match, so this mapping will preserve that
" behavior. See :help popupmenu-keys for more.
:inoremap <expr> <C-L> (pumvisible() <bar><bar> &insertmode) ? '<C-L>' : '<Esc>'


" PLUGIN CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter
filetype plugin indent on

" airline
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#symbol = '⎇  '
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1

" vimtex
let g:vimtex_enabled=1
let g:vimtex_complete_enabled=1
let g:vimtex_complete_close_braces=1

" braceless.vim
autocmd filetype python BracelessEnable +indent +highlight

" " deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#enable_typeinfo = 0
let g:deoplete#sources#jedi#ignore_errors=1
" " Escape: exit autocompletion, go to Normal mode
inoremap <silent><expr> <Esc> pumvisible() ? "<C-e><Esc>" : "<Esc>"

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" set statusline+=%{FugitiveStatusline()}
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_rst_checkers = ['text/language_check']
"let g:syntastic_tex_checkers = ['text/language_check']
let g:syntastic_python_checkers = ['flake8']
"js syntax folding
augroup javascript_folding
    au!
    au filetype javascript setlocal foldmethod=syntax
augroup END
let g:javascript_conceal_function = "ƒ"
let g:javascript_conceal_null = "ø"
let g:javascript_conceal_this = "@"
let g:javascript_conceal_return = "⇚"
let g:javascript_conceal_undefined = "¿"
let g:javascript_conceal_NaN = "N"
let g:javascript_conceal_prototype = "¶"
let g:javascript_conceal_static = "•"
let g:javascript_conceal_super = "Ω"
let g:javascript_conceal_arrow_function = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel =3

" vimtex config for tex files
let g:tex_flavour='latex'

set number relativenumber
set smartindent

" filenames like *.xml, *.html, *.xhtml, ...
" " These are the file extensions where this plugin is enabled.
" "
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,.*.xml,*.jsx'
"
" " filenames like *.xml, *.xhtml, ...
" " This will make the list of non-closing tags self-closing in the specified files.
" "
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
"
" " filetypes like xml, html, xhtml, ...
" " These are the file types where this plugin is enabled.
" "
let g:closetag_filetypes = 'html,xhtml,phtml,jsx'
"
" " filetypes like xml, xhtml, ...
" " This will make the list of non-closing tags self-closing in the specified files.
" "
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
"
" " integer value [0|1]
" " This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be
" closed while `<link>` won't.)
" "
let g:closetag_emptyTags_caseSensitive = 1
"
" " Shortcut for closing tags, default is '>'
" "
let g:closetag_shortcut = '>'
"
" " Add > at current position without closing the current tag, default is ''
" "
let g:closetag_close_shortcut = '<leader>>'

let g:autopep8_disable_show_diff=1
let g:autopep8_on_save = 1
let g:over_enable_auto_nohlsearch=1
let g:over_enable_cmd_window=1
let g:over_command_line_prompt=">"

" " Ultisnips Config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
command! MakeTags !ctags -R -a *.*
" autocmd! bufwritepost * MakeTags
set nospell


