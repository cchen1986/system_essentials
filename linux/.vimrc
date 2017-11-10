set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'gerw/vim-latex-suite'
Plugin 'Raimondi/delimitMate'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-endwise'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'neomake/neomake'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/a.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'"
Plugin 'gcmt/wildfire.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'reedes/vim-lexical'
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'luochen1990/rainbow'
Plugin 'othree/html5.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'marijnh/tern_for_vim'

" Project directory
Plugin 'airblade/vim-rooter'
Plugin 'tikhomirov/vim-glsl'

" All of your Plugins must be added before the following line
call vundle#end()            " require
filetype on
filetype plugin indent on    " required

colorscheme jelleybeans

let g:mapleader=";" "Change leader to ;

" ================ General Config ====================
"set t_Co=256 "Set 256 colors
set title "Change the terminal's title
set number "Line numbers
set textwidth=80
set formatoptions+=t
set guifont=Liberation\ Mono\ Powerline:h13 "make sure to escape the spaces in the name properly
set nohlsearch
set ignorecase
set wildmenu
" Disable cursor blinking
set gcr=a:block-blinkon0
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T
set laststatus=2
set wrap lbr
" Allows loading local .vimrc
set exrc
set secure

syntax enable
syntax on

" ================ Indentation ======================
set shiftwidth=2
set tabstop=2
set expandtab

" ================ Auto commands ======================
autocmd BufEnter * silent! :lcd%:p:h


" Easy-align mapping
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"Vim airline
let g:airline_powerline_fonts=1
let g:airline_section_y = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'  "Set relative path
let g:airline#extensions#tabline#enabled = 1

"Vim Ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Vim rooter
let g:rooter_patterns = ['Rakefile', '.git/', '.vimrc']
let g:rooter_silent_chdir = 1

" Vim bookmark
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=60 ctermfg=NONE
let g:bookmark_highlight_lines = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_auto_close = 1
let g:bookmark_highlight_lines = 1

" map to <Leader>cf in C++ code
nnoremap <Leader>cf :<C-u>FormatCode<CR>
vnoremap <Leader>cf :FormatCode<CR>

" Vim easymotion
" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
"nmap <C-s> <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1

" Ctrlp
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Vim-vinegar
"let g:netrw_banner = 0
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"    autocmd!
"    autocmd VimEnter * :Vexplore
"augroup END

" Nerdtree tabs
map <C-n> <plug>NERDTreeTabsToggle<CR>
map <leader>f :NERDTreeFind<CR>

let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_smart_startup_focus=1
let g:nerdtree_tabs_autoclose=1
let g:nerdtree_tabs_autofind=1

" wildfire
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]

" Neosnippet
" Plugin key-mappings.
"imap <Leader><tab>     <Plug>(neosnippet_expand_or_jump)
"smap <Leader><tab>     <Plug>(neosnippet_expand_or_jump)
"xmap <Leader><tab>    <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Use deoplete.
"let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" Close the documentation window when completion is done
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"let g:deoplete#sources#clang#libclang_path = "/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1"
"let g:deoplete#sources#clang#clang_header = "/usr/include/clang/"
"let g:deoplete#sources#clang#flags = [
"  \ "-cc1",
"  \ "-isystem", "/home/chenchen/git/deepmap/bazel-deepmap/external/eigen_archive/include/eigen3/",
"  \ "-isystem", "/home/chenchen/git/deepmap/bazel-deepmap/external/precompiled_pcl/include/",
"  \ "-isystem", "/home/chenchen/git/deepmap/bazel-deepmap/external/precompiled_g2o/include/",
"  \ "-isystem", "/home/chenchen/git/deepmap/bazel-deepmap/external/protobuf_git/src/",
"  \ "-isystem", "/home/chenchen/git/deepmap/bazel-deepmap/external/precompiled_flann/include/",
"  \ "-isystem", "/home/chenchen/git/deepmap/bazel-deepmap/external/gtest_git/googletest/include/",
"  \ "-isystem", "/home/chenchen/git/deepmap/bazel-deepmap/external/gtest_git/googlemock/include/",
"  \ "-isystem", "/home/chenchen/git/deepmap/bazel-deepmap/external/glog_archive/include/",
"  \ "-isystem", "/home/chenchen/git/deepmap/bazel-genfiles/external/gflags_git/include/",
"  \ "-I", "/home/chenchen/git/deepmap/alignment/",
"  \ "-I", "/home/chenchen/git/deepmap/common/",
"  \ "-I", "/home/chenchen/git/deepmap/bazel-deepmap/",
"  \ "-isystem", "/home/chenchen/git/deepmap/bazel-genfiles/",
"  \ "-isystem", "/home/chenchen/git/deepmap/bazel-genfiles/",
"  \]

" tab conflict between ultisnips and youcompleteme
"let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<Leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<Leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

let g:indexer_ctagsCommandLineOptions="--c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

" next tag
nmap <Leader>tn :tnext<CR>
" prev tag
nmap <Leader>tp :tprevious<CR>

" Setup YouCompleteMe
imap '<SPACE> <C-SPACE>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 1
let g:ycm_collect_identifiers_from_tags_files = 1
set tags+=./.tags
inoremap <Leader>; <C-x><C-o>
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_show_diagnostics_ui = 0
nnoremap <leader>gd :YcmCompleter GoToImprecise<CR>

"" Vim indent
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level=2
"let g:indent_guides_guide_size=1
":nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" Switch between cc and h
nmap <Leader>ch :A<CR>
nmap <Leader>sch :AS<CR>

" Vim indent
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_compact=1

" Rainbow parenthesis
let g:rainbow_active = 1

" Neomake
"let g:neomake_cpp_enabled_makers = ['clang']
"let g:neomake_cpp_clang_maker = {
"   \ 'exe': 'clang',
"   \ }

" Javascript
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"

" Setup vim latex
let g:tex_flavor = 'latex'
let g:Tex_MultipleCompileFormats = 'pdf, aux'
let g:Tex_TreatMacViewerAsUNIX = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'Skim'
let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""
let g:Tex_IgnoredWarnings ='
            \"Underfull\n".
            \"Overfull\n".
            \"specifier changed to\n".
            \"You have requested\n".
            \"Missing number, treated as zero.\n".
            \"There were undefined references\n".
            \"Citation %.%# undefined\n".
            \"Marginpar on page %.%# moved\n".
            \"Citation %.%# undefined\n".
            \"Marginpar on page %.%# moved\n".
            \"\oval, \circle, or \line size unavailable\n"'

noremap  k gk
noremap  j gj
noremap  ^ g^
noremap  0 g0
noremap  $ g$

nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>WQ :wa<CR>:q<CR>
nmap <Leader>Q :qa!<CR>

nnoremap <Leader>l <C-W>l
nnoremap <Leader>h <C-W>h
nnoremap <Leader>k <C-W>k
nnoremap <Leader>j <C-W>j
nnoremap <Leader>u <C-W>R

" Check spelling
setlocal spell spelllang=en_us
set spell
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight SpellBad term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" Map ESC
inoremap jk <Esc>
inoremap kj <Esc>

" Remove trailing space
autocmd BufWritePre * :%s/\s\+$//e
set clipboard=unnamed
set pastetoggle=<F10>
set splitright
set splitbelow

nnoremap <leader>z :vsp<CR>:terminal<CR>
"source $HOME/.bashrc<CR>
"nnoremap <leader>z <C-z>
tnoremap kj <C-\><C-n>

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END
