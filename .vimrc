" ============================================================================
" .vimrc of Shilong Jiang
" ============================================================================j

let s:darwin = has('mac')

" ----------------------------------------------------------------------------
" Use vim settings
" ----------------------------------------------------------------------------
set nocompatible

" ----------------------------------------------------------------------------
" Setup Vim-plug to manage plugins
" ----------------------------------------------------------------------------

call plug#begin()

if s:darwin
  let g:plug_url_format = 'git@github.com:%s.git'
else
  let $GIT_SSL_NO_VERIFY = 'true'
endif

" Colors
if !exists('g:gui_oni')
  Plug 'altercation/vim-colors-solarized'
  Plug 'flazz/vim-colorschemes'
endif

" Edit
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
" Plug 'ternjs/tern_for_vim'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
"Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-entire'

" Browsing
if !exists('g:gui_oni')
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
endif

Plug 'Yggdroot/indentLine'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeTabsToggle', 'NERDTreeFind', 'NerdTreeToggle' ] } | Plug 'jistr/vim-nerdtree-tabs'
Plug 'easymotion/vim-easymotion'
" Plug 'majutsushi/tagbar'
Plug 'vim-scripts/taglist.vim'
Plug 'milkypostman/vim-togglelist'
Plug 'mileszs/ack.vim'
Plug 'moll/vim-bbye' "for Bdelete

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Lint
" Plug 'neomake/neomake'
Plug 'w0rp/ale'

" Lang
Plug 'Shougo/echodoc.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'pangloss/vim-javascript'
"Plug 'othree/yajs.vim', { 'for': 'javascript' }
"Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
"Plug 'mxw/vim-jsx'
" Plug 'modille/groovy.vim'
Plug 'git@github.com:martinda/Jenkinsfile-vim-syntax.git'
Plug 'vim-scripts/groovyindent-unix'

Plug 'HerringtonDarkholme/yats.vim'
" Plug 'leafgarland/typescript-vim'
if !exists('g:gui_oni')
  Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
endif

Plug 'othree/html5.vim'
Plug 'vim-scripts/HTML-AutoCloseTag'
Plug 'Valloric/MatchTagAlways'
Plug 'mattn/emmet-vim'
Plug 'digitaltoad/vim-jade'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'wannesm/wmgraphviz.vim'
"Plugin 'posva/vim-vue'
Plug 'plasticboy/vim-markdown'
"Plug 'suan/vim-instant-markdown'
Plug 'fatih/vim-go'
Plug 'AndrewRadev/splitjoin.vim'

" Tools
Plug 'kassio/neoterm'
Plug 'kristijanhusak/vim-carbon-now-sh'

" Others
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

set rtp+=/usr/local/opt/fzf
Plug 'junegunn/fzf.vim' | Plug '~/Projects/fzf-filemru-darwin'

" Plug 'edkolev/tmuxline.vim'

call plug#end()

" ----------------------------------------------------------------------------
" Change mapleader
" ----------------------------------------------------------------------------
let mapleader = ','

" ----------------------------------------------------------------------------
" Init
" ----------------------------------------------------------------------------
if exists('g:gui_oni')
  filetype off                  " required

  " Turn off statusbar, because it is externalized
  set noshowmode
  set noruler
  set laststatus=0
  set noshowcmd

  set listchars=tab:→\ ,trail:·,extends:#,nbsp:. " Highlight problematic whitespace
else
  filetype on
  color solarized
  set laststatus=2
  set listchars=tab:→\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
  set showmode                    " Display the current mode
endif


" ----------------------------------------------------------------------------
" Basic options
" ----------------------------------------------------------------------------
set autoindent " autoindent based on line above, works most of the time

set autoread " Reload files changed outside vim
" Force reloading
au FocusGained,BufEnter * :silent! !

set backspace=indent,eol,start " Enable delete over line breaks and automatically-inserted indentation
set backupdir=~/.tmp " set backup directory to ~/.tmp
set cursorline
set copyindent " copy the previous indentation on autoindenting
set directory=~/.tmp
"set encoding=utf-8
set expandtab " use spaces instead of tabs
set fileencoding=utf-8
set fileformat=unix " Set unix line endings
set fileformats=unix,mac,dos
set hidden " Don't unload buffers when they are abandoned, instead stay in the background
set history=10000
set noswapfile
set number
set shiftwidth=2 " when reading, tabs are 2 spaces
set smartindent " smarter indent for C-like languages
set softtabstop=2 " in insert mode, tabs are 2 spaces
syntax on
set undodir=~/.tmp/undodir " set undo file location
set undofile
set undolevels=1000 " use many muchos levels of undo
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
set visualbell " Turn off audible bell
set viminfo='100,f1 " Save up to 100 marks, enable capital marks
set visualbell
set wildmenu
set wildmode=list:longest
set noerrorbells
set updatetime=250
set cmdheight=2
if !exists('g:gui_oni')
  set clipboard=unnamed
endif

" ----------------------------------------------------------------------------
" Editor layout
" ----------------------------------------------------------------------------
set background=dark
set linespace=0                 " No extra spaces between rows
set scrolloff=3 " Keep the cursor visible within 3 lines when scrolling
set scrolljump=5                " Lines to scroll when cursor leaves screen
set list
set foldmethod=syntax
set foldlevelstart=4
set completeopt-=preview

" Window split settings
highlight TermCursor ctermfg=red guifg=red
set splitbelow
set splitright

" ----------------------------------------------------------------------------
" Text options
" ----------------------------------------------------------------------------
set wrap
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set virtualedit=onemore             " Allow for cursor beyond last character

" ----------------------------------------------------------------------------
" Saving
" ----------------------------------------------------------------------------
" Automatically removing all trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Restore cursor to file position in previous editing session
function! ResCur()
  if line("'\"") <= line("$")
    silent! normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Instead of reverting the cursor to the last position in the buffer, we set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" ----------------------------------------------------------------------------
" Moving and searching
" ----------------------------------------------------------------------------
set hlsearch " highlight searches by default
set ignorecase
set incsearch " find the next match as we type the search
set showmatch
set smartcase

" ----------------------------------------------------------------------------
" Others
" ----------------------------------------------------------------------------
set winminheight=0              " Windows can be 0 line high
set tabstop=2                   " An indentation every two columns
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set tabpagemax=15               " Only show 15 tabs
set autowrite                   " For GoBuild

set indentkeys+=0.

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode

command! -nargs=0 Sw w !sudo tee % > /dev/null

" ----------------------------------------------------------------------------
" Filetypes
" ----------------------------------------------------------------------------

" Syntax of these languages is fussy over tabs Vs spaces
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType groovy setlocal ts=4 sts=4 sw=4 expandtab

" Golang
augroup go
  autocmd!
  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  " :GoRun
  autocmd FileType go nmap <silent> <leader>r :Topen <bar> T go run *.go <cr>
  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)
  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>o <Plug>(go-coverage-toggle)
  " :GoInfo
  autocmd FileType go nmap <c-i> <Plug>(go-info)
  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
  " :GoRename
  autocmd FileType go nmap <Leader>re <Plug>(go-rename)
  autocmd FileType go nmap <c-]> <Plug>(go-def)
  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Typescript
if exists('g:gui_oni')
  augroup typescript
    autocmd FileType typescript let b:deoplete_disable_auto_complete=1
    autocmd FileType typescript nmap <C-]> gd
  augroup END
endif

augroup typescript
  autocmd!
  autocmd FileType typescript nmap <silent> <c-i> :TSType<cr>
  autocmd FileType Typescript nmap <Leader>re :TSRefs<cr>
augroup END

" ----------------------------------------------------------------------------
" Key mappings
" ----------------------------------------------------------------------------
nnoremap <silent> <esc> :noh<CR><esc>

" Strip trailing whitespace
nnoremap <silent> <F9> :call <SID>StripTrailingWhitespaces()<CR>

" Space to toggle folds
nnoremap <leader><Space> zR
vnoremap <leader><Space> zR
nnoremap <Space> za
vnoremap <Space> za

" Make Y not dumb
nnoremap Y y$

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Reloads .vimrc
nmap <Leader>s :source ~/.vimrc<CR>

" Quick escaping in insert mode
inoremap jk <ESC>
tnoremap jk <C-\><C-n>

" map <leader>q and <leader>w to buffer prev/next buffer
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Graphviz
noremap <silent> <F12> :! open -a Graphviz %<CR><CR>

" Ctrl-6
noremap <BS> <C-^>

" qq to record, Q to replay (recursive map due to peekaboo)
nmap Q @q

" Location List
nnoremap <silent> <F1> :call ToggleLocationList()<CR>
nnoremap <silent> <F2> :lnext<CR>
nnoremap <silent> <F3> :lprevious<CR>

" Quickfix
function! QFixToggle()
  if exists("g:qfix_win")
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

nnoremap <silent> <F4> :call QFixToggle()<CR>
nnoremap <silent> <F5> :cnext<CR>
nnoremap <silent> <F6> :cprevious<CR>

" Fast move between windows
"map <C-J> <C-W>j
"map <C-K> <C-W>k
"map <C-L> <C-W>l
"map <C-H> <C-W>h

" Window navigation function
" Make ctrl-h/j/k/l move between windows and auto-insert in terminals
func! s:mapMoveToWindowInDirection(direction)
  func! s:maybeInsertMode(direction)
    stopinsert
    execute "wincmd" a:direction

    if &buftype == 'terminal'
      startinsert!
    endif
  endfunc

  execute "map" "<silent>" "<C-" . a:direction . ">"
        \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
endfunc
for dir in ["h", "j", "l", "k"]
  call s:mapMoveToWindowInDirection(dir)
endfor

" command Bd bp\|bd \#
nnoremap <silent> <leader>bd :Bd<CR>
nnoremap <silent> <leader>ba :bufdo Bdelete<CR>

" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------

" NerdTree
map <c-e> <plug>NERDTreeTabsToggle<CR>
map <leader>e :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" UndoTree
nnoremap <Leader>u :UndotreeToggle<CR>
" If undotree is opened, it is likely one wants to interact with it.
let g:undotree_SetFocusWhenToggle=1

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
if !exists('g:airline_powerline_fonts')
  " Use the default set of separators with a few customizations
  let g:airline_left_sep='›'  " Slightly fancier than '>'
  let g:airline_right_sep='‹' " Slightly fancier than '<'
endif
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"function! RefreshUI()
"if exists(':AirlineRefresh')
"AirlineRefresh
"else
"" Clear & redraw the screen, then redraw all statuslines.
"redraw!
"redrawstatus!
"endif
"endfunction

"au BufWritePost .vimrc source $MYVIMRC | :call RefreshUI()

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0
let g:tern_remove_async_await = 1

let g:SuperTabDefaultCompletionType = "<c-n>"
autocmd CompleteDone * pclose!

function! g:Multiple_cursors_before()
  let g:deoplete#disable_auto_complete = 1
endfunction
function! g:Multiple_cursors_after()
  let g:deoplete#disable_auto_complete = 0
endfunction

call deoplete#custom#source('ultisnips', 'rank', 1000)

" UltiSnips
let g:UltiSnipsExpandTrigger       ="<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

" Tern
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" TagBar
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <leader>t :TagbarToggle<CR>

" indent_guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" vim-gitgutter
let g:gitgutter_max_signs = 10000

" Session
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

" Ack.vim
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" JsDoc
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_enable_es6=1
let g:jsdoc_input_description=1
nmap <silent> <leader>j <Plug>(jsdoc)

" Neomake
" autocmd! BufWritePost * Neomake
" let g:neomake_javascript_enabled_makers = ['eslint']

" if exists('g:gui_oni')
  " let g:neomake_typescript_enabled_makers = ['tslint']
" endif

" let g:neomake_go_enabled_makers = []

" Neovim
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Fzf
let g:fzf_command_prefix = 'Fzf'
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FilesMru --tiebreak=end<CR>
nnoremap <silent> <leader>. :FzfHistory<CR>
nnoremap <silent> <leader>/ :execute 'FzfAg ' . input('Ag/')<CR>
nnoremap <silent> <leader>fb :FzfBuffers<CR>
nnoremap <silent> <leader>fl :FzfBLines<CR>
nnoremap <silent> <leader>ft :FzfBTags<CR>
nnoremap <silent> <leader>fT :FzfTags<CR>

nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>fc :FzfBCommits<CR>
nnoremap <silent> <leader>fC :FzfCommits<CR>

imap <C-x><C-l> <plug>(fzf-complete-line)

function! SearchWordWithAg()
  execute 'FzfAg' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'FzfAg' selection
endfunction

command! FzfGulp call fzf#run({
      \ 'source': split(gulpVim#GetTasks()),
      \ 'sink': 'GulpExt',
      \ 'down': '40%'
      \ })

nnoremap <silent> <leader>gp :FzfGulp<CR>
let g:gv_custom_cmd = 'T clear && %s'

" echodoc
if !exists('g:gui_oni')
  let g:echodoc_enable_at_startup = 1
endif

" vim-javascript
"let g:javascript_opfirst = 1

" Neoterm
nnoremap <silent> <c-t> :Ttoggle<cr>
tnoremap <silent> <c-t> <c-\><c-n>:Ttoggle<cr>
let g:neoterm_size=15

" vim-markdown
let g:vim_markdown_conceal = 0

" vim-go
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
" let g:go_auto_sameids = 1
let g:go_list_type = "quickfix"
let g:go_term_mode = "split"
let g:go_def_mapping_enabled = 0
let g:go_metalinter_autosave = 1
let g:go_metalinter_excludes = ["'or be unexported'"]
"let g:go_metalinter_autosave_enabled = ['vet', 'golint']

" deoplete-go
let g:deoplete#sources#go#gocode_binary = "/Users/jsl/go/bin/gocode"

" nvim_typescript
if !exists('g:gui_oni')
  " let g:nvim_typescript#type_info_on_hold = 1
endif
let g:nvim_typescript#default_mappings = 1

" jsx
let g:jsx_ext_required = 0

" tagbar
let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" taglist
let g:Tlist_Use_Right_Window = 1

" ale
let g:ale_sign_column_always = 1
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)
let g:ale_linters = {
\   'typescript': ['tslint', 'tsserver', 'typecheck'],
\}

filetype plugin indent on
