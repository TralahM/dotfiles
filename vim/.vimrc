" PLUGIN INSTALL USING VIM-PLUG (https://github.com/junegunn/vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically download and install vim-plug if it's not installed
set nocompatible
set encoding=utf-8
set nospell
set icm=nosplit
set dictionary+=~/words
" set complete+=k
let uname = substitute(system('uname'), '\n', '', '')
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

" Leader tt toggles checkbox
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
Plug 'cloudhead/neovim-fuzzy'
Plug 'neomake/neomake'
Plug 'Inazuma110/deoplete-greek'
Plug 'thaerkh/vim-workspace'
Plug 'thaerkh/vim-workspace'
Plug 'derekwyatt/vim-scala'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'Konfekt/FastFold'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'SevereOverfl0w/deoplete-github'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'SirVer/ultisnips'
Plug 'TralahM/Efficient-python-folding',{'for':'python'}
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'bfrg/vim-jq',{'for':'json'}
Plug 'bfrg/vim-jqplay',{'for':'json'}
Plug 'bps/vim-textobj-python',{'for':'python'}
Plug 'chrisbra/csv.vim',{'for':'csv'}
Plug 'coachshea/vim-textobj-markdown',{'for':'markdown'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'deoplete-plugins/deoplete-zsh'
Plug 'ehamberg/vim-cute-python',{'for':'python'}
Plug 'enricobacis/vim-airline-clock'
Plug 'euclio/vim-markdown-composer',{'for':'markdown'}
Plug 'fatih/vim-go',{'for':'go'}
Plug 'garbas/vim-snipmate'
Plug 'gcorne/vim-sass-lint'
Plug 'glts/vim-magnum'
Plug 'glts/vim-radical'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'jceb/vim-orgmode',{'for':'org'}
Plug 'jiangmiao/auto-pairs'
Plug 'jkramer/vim-checkbox',{'for':'markdown'}
Plug 'jmcantrell/vim-virtualenv',{'for':'python'}
Plug 'junegunn/fzf',{'dir':'~/.fzf','do':'./install --all'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-emoji'
Plug 'justinmk/vim-sneak'
Plug 'kalekundert/vim-coiled-snake'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-datetime'
Plug 'kana/vim-textobj-lastpat'
Plug 'kana/vim-textobj-user'
Plug 'leafoftree/vim-vue-plugin', {'for':'javascript'}
Plug 'lervag/vimtex',{'for':'markdown'}
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim'
Plug 'mattn/sonictemplate-vim'
Plug 'mattn/vim-lsp-settings'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mileszs/ack.vim'
Plug 'mjbrownie/django-template-textobjects'
Plug 'mxw/vim-jsx',{'for':'javascript'}
Plug 'nanotech/jellybeans.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nelstrom/vim-markdown-folding',{'for':'markdown'}
Plug 'osyo-manga/vim-over'
Plug 'pangloss/vim-javascript',{'for':'javascript'}
Plug 'pbrisbin/vim-mkdir'
Plug 'plasticboy/vim-markdown',{'for':'markdown'}
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'python-mode/python-mode',{'for':'python'}
Plug 'racer-rust/vim-racer',{'for':'rust'}
Plug 'rhysd/git-messenger.vim'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'rust-lang/rust.vim', {'for':'rust'}
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'sgur/vim-textobj-parameter'
Plug 'tell-k/vim-autopep8',{'for':'python'}
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-smooth-scroll'
Plug 'tmux-plugins/vim-tmux'
Plug 'tomtom/tlib_vim'
Plug 'tounaishouta/coq.vim', {'for':'coq'}
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-afterimage'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-heroku'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-unimpaired'
Plug 'tweekmonster/braceless.vim', {'for': ['python']}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-ruby/vim-ruby',{'for':'ruby'}
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-syntastic/syntastic'
Plug 'wellle/tmux-complete.vim'
Plug 'xuhdev/vim-latex-live-preview',{'for':'tex'}
Plug 'yegappan/mru' "most recently used

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    Plug 'davidhalter/jedi-vim'
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'davidhalter/jedi-vim'
    if uname=='Android'
        " Do Nothing
    else
        Plug 'zxqfl/tabnine-vim'
    endif
endif
if has('win32') || has('win64')
    Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
else
    if uname=='Android'
        " Do Nothing
    else
    endif
endif

call plug#end()

" BEGIN CONFIGURATIONS HERE
"
" Load my custom functions and keymappings
source ~/.vim/autoload/load_customs.vim
" GENERAL CONGIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some of the following is taken from Steve Losh:
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" Basic Internal Configurations
set undofile
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set undodir=~/.vim/undo "where to save undo histories"
set undolevels=1000 "How many Undos"
set undoreload=10000 "number of lines to save for undo"
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set wildignore+=*_build/*
set wildignore+=*.pyc,*.so,*.swp,*.zip,*.un~,.*.*~
set wildignore+=*/coverage/*

" autoreloading of the vimrc file.
autocmd! bufwritepost .vimrc source %
autocmd bufwritepre hosts setl filetype=dosini
autocmd bufread hosts setl filetype=dosini
" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala
set autoindent
set clipboard+=unnamedplus
" set cursorline
set modelines=2
set wrap
set linebreak
set nolist " disables libebreak"
set showcmd
set showmode
set visualbell

" easier better ident in visual
vnoremap < <gv
vnoremap > >gv
" map sort fx to a key

vnoremap <leader>s :sort <CR>
" Remove the underline from enabling cursorline
highlight Cursorline cterm=bold ctermbg=green ctermfg=white
highlight ColorColumn ctermbg=black
" Set line numbering to red background:
highlight CursorLineNR cterm=bold ctermbg=green ctermfg=white
set ruler
set undofile
set ignorecase
set smartcase
au FocusLost * :wa

set incsearch
set showmatch
set hlsearch
set t_Co=256
set ttimeoutlen=50
set noswapfile
" Set identation to 4 spaces
set noai ts=4 sw=4 expandtab
" Set an 80 char column
set textwidth=88
set wrapmargin=88
" read and write changes automatically
set autoread
set autowrite
set colorcolumn=90
" Line numbers
set number
highlight LineNr ctermfg=white
highlight SignColumn ctermfg=black
" Rule for Makefiles to use tab
autocmd BufEnter ?akefile* set noet ts=4 sw=4
" Syntax highlighting
syntax on
autocmd BufNewFile,BufRead *.ipy set filetype=python
autocmd BufNewFile,BufRead *.pyx set filetype=python
autocmd BufWritePre *.py execute ':Black'
autocmd BufNewFile,BufRead SConstruct set filetype=python
autocmd BufNewFile,BufRead *.md,*.markdown,*.mkdown,*.mkdn,*.mkd set filetype=markdown
autocmd BufNewFile,BufRead *.md,*.markdown,*.mkdown,*.mkdn,*.mkd setlocal foldmethod=syntax
autocmd BufNewFile,BufRead *.md,*.markdown,*.mkdown,*.mkdn,*.mkd UltiSnipsAddFiletypes markdown
autocmd BufNewFile,BufRead *.yml,*.yaml setlocal ts=2 sw=2
" Color scheme
syntax enable
let g:solarized_termcolors=256
let g:gitgutter_max_signs=1000
if emoji#available()
    let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
    let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
    let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
    let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif

let g:UltiSnipsSnippetDirectories=['~/.vim/plugged/vim-snippets/UltiSnips/', '~/.vim/Ultisnips/','~/.vim/snippets/']
let g:UltiSnipsEditSplit="vertical"
" set background=dark
colorscheme delek
let g:solarized_contrast="high"
highlight clear SpellBad
highlight SpellBad cterm=underline,bold ctermbg=white ctermfg=red
" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e
" Git commits
autocmd Filetype gitcommit setlocal spell textwidth=100
set pastetoggle=<M-v>
" Disable folding. It's really annoying and I never remeber the commands.
set nofoldenable
set laststatus=2
set number relativenumber
set smartindent


" Fuzzy File Finder
set path+=**
set wildmenu

"" Better navigation through omnicomplete option list
set completeopt=longest,menuone,preview,noinsert
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


set nofoldenable


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
" ]s and [s to move down-up marked words
" Spelling always on for some files
autocmd BufNewFile,BufRead *.ipy,*.py,*.md,*.tex,*.rst,*.c,*.h,Makefile setlocal nospell

" Run 'make' on save
function! EnableRunMakeOnSave()
    autocmd BufWritePost * silent! execute "!make >/dev/null 2>&1" | redraw! | echo "Done: make finished."
    echo "Running 'make' on save enabled."
endfunction
" map <leader>m :call EnableRunMakeOnSave()<cr>


" PLUGIN CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-indent-guides conf
let g:indent_guides_enable_on_vim_startup=1

" Deoplete Conf
" " deoplete completion
let g:deoplete#sources={}
let g:deoplete#sources._ = ['buffer', 'member', 'file', 'omni', 'tag', 'ultisnips']
let g:deoplete#enable_at_startup=1
let g:deoplete#sources.gitcommit=['github']
let g:deoplete#keyword_patterns = {}
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'
let g:deoplete#keyword_patterns.gitcommit = '.+'
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#enable_typeinfo = 0
let g:deoplete#sources#jedi#ignore_errors=1

" Vim-SCala Conf
let g:scala_scaladoc_indent = 1
"Linting with neomake
let g:neomake_sbt_maker = {
      \ 'exe': 'sbt',
      \ 'args': ['-Dsbt.log.noformat=true', 'compile'],
      \ 'append_file': 0,
      \ 'auto_enabled': 1,
      \ 'output_stream': 'stdout',
      \ 'errorformat':
          \ '%E[%trror]\ %f:%l:\ %m,' .
            \ '%-Z[error]\ %p^,' .
            \ '%-C%.%#,' .
            \ '%-G%.%#'
     \ }
let g:neomake_enabled_makers = ['sbt', 'make']
let g:neomake_verbose=3
" Neomake on text change
autocmd InsertLeave,TextChanged *.scala,*.sbt update | Neomake! sbt

"yankstack config
call yankstack#setup()
let g:yankstack_yank_keys = ['y', 'd']

"python-mode config
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'
let ropevim_enable_shortcuts = 1
let g:pymode_rope_lookup_project=0
let g:pymode_doc = 1
let g:pymode_doc_bind = '<leader>i'
let g:pymode_rope=0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_modules = ['os', 'datetime']
let g:pymode_rope_goto_definition_cmd="tab"

let g:pymode_rope_organize_imports_bind = '<leader>ri'
let g:pymode_rope_autoimport_bind = '<leader>ra'

let g:pymode_rope_extended_complete=0
let g:pymode_breakpoint=1
let g:pymode_syntax=1
let g:pymode_syntax_all = 1
let g:pymode_syntax_builtin_objs=0
let g:pymode_syntax_builtin_funcs=0
let g:pymode_lint_checkers = ['pep8',]


"CTRLP config
" The Silver Searcher
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command='ag %s -l --nocolor -g'
    let g:ctrlp_use_caching=1
endif

let g:ctrlp_max_height=7
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


"
" vim-Markdown customizations
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
let g:vim_markdown_edit_url_in="hsplit"
let g:vim_markdown_new_list_item_indent=1


" Nerdcommenter
filetype plugin indent on
" NerdTree
let NERDTreeShowLineNumbers=1
autocmd Filetype nerdtree setlocal relativenumber number


"
" AIRLINE POWERLINE STATUSLINE
let g:airline_detect_modified=1
let g:airline_theme='papercolor'
" let g:airline_statusline_on_top=1
let g:airline_detect_paste=1
let g:airline_powerline_fonts=1
" let g:airline_left_sep = ' '
" let g:airline_right_sep = '|'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline#extensions#languageclient#enabled = 1
let g:airline#extensions#promptline#enabled = 1
let g:airline#extensions#default#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
" let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#unicode#enabled = 1
let g:airline#extensions#fugitive#enabled = 1
let g:airline#extensions#branch#enabled = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{FugitiveStatusline()}



" VIMTEX
let g:vimtex_enabled=1
let g:vimtex_complete_enabled=1
let g:vimtex_complete_close_braces=1
let g:vimtex_compiler_progname='nvr'

" BRACELESS.VIM
autocmd filetype python BracelessEnable +indent +highlight

" SYNTASTIC SETTING
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
let g:syntastic_rst_checkers = ['text/language_check']
let g:syntastic_tex_checkers = ['text/language_check']
let g:syntastic_python_checkers = ['pep8']


" VIM-TEXTOBJ-MARKDOWN BUFFER CONFIGS
" To resolve possible conflict with vim-textobj-function
augroup markdown_textobjs
    au!
    au filetype markdown omap <buffer> af <plug>(textobj-markdown-chunk-a)
    au filetype markdown omap <buffer> if <plug>(textobj-markdown-chunk-i)
    au filetype markdown omap <buffer> aF <plug>(textobj-markdown-Bchunk-a)
    au filetype markdown omap <buffer> iF <plug>(textobj-markdown-Bchunk-i)
augroup END


"JS SYNTAX FOLDING
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
set conceallevel =2


" VIMTEX CONFIG FOR TEX FILES
let g:tex_flavour='latex'


" FILENAMES LIKE *.XML, *.HTML, *.XHTML, ...
" " These are the file extensions where this plugin is enabled.
" "
" " This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,.*.xml,*.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx'
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
" " Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" " Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'


" Autopep8 conf
let g:autopep8_disable_show_diff=1
let g:autopep8_on_save = 1


" Vim-overe conf
let g:over_enable_auto_nohlsearch=0
let g:over_enable_cmd_window=1
let g:over_command_line_prompt=">"



" " Ultisnips Config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" command! MakeTags !ctags -R -a *.*
" autocmd! bufwritepost * MakeTags


" Markdown Composer options
" Do not attempt to open the browser automatically i'll do it manually
let g:markdown_composer_open_browser=0
" Latex Live Preview conf
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer='mupdf'

" Neosnippets
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" VIM TEX CONF
let g:tex_flavor='latex'
let g:matchup_override_vimtex = 1
let g:vimtex_fold_enabled =1


" Rust Config
let g:rustfmt_autosave=1
let g:racer_insert_paren=1
let g:racer_experimental_completer=1


" EMMET CONFIG
let g:user_emmet_leader_key='<tab>'
let g:user_emmet_settings={
            \'php':{'extends':'html','filters':'c'},
            \'xml':{'extends':'html'},
            \'haml':{'extends':'html'},
                \}

" RAINBOW PARENTHESES
let g:rainbow_active=1


" FUZZYFIILE CONF
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
