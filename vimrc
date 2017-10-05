call plug#begin('~/.vim/plugged')

Plug 'benjie/neomake-local-eslint.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'digitaltoad/vim-jade'
Plug 'elzr/vim-json'
Plug 'jason0x43/vim-js-indent', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'JofArnold/vim-template-literal'
Plug 'joshdick/onedark.vim'
Plug 'jparise/vim-graphql'
Plug 'jparise/vim-graphql'
Plug 'junegunn/vim-emoji'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mtscout6/vim-cjsx'
Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
Plug 'sbdchd/neoformat'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/MatchTagAlways'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'wakatime/vim-wakatime'
Plug 'wavded/vim-stylus'
Plug 'wavded/vim-stylus'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

call plug#end()


"*****************************************************************************
" Linting
"*****************************************************************************


let g:neoformat_enabled_javascript = ['eslint_d']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_scss = ['prettier']
augroup neoformat_group
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.css,*.scss silent Neoformat
augroup END

" Linting
let g:neomake_javascript_enabled_makers = ['eslint_d']
let g:neomake_jsx_enabled_makers = ['eslint_d']
let g:neomake_graphql_enabled_makers = ['eslint_d']

" Autofix entire buffer with eslint_d:
nnoremap <leader>f mF:%!eslint_d --stdin --fix-to-stdout<CR>`F
" Autofix visual selection with eslint_d:
vnoremap <leader>f :!eslint_d --stdin --fix-to-stdout<CR>gv

let g:ale_linters = {
\  'javascript': ['flow', 'eslint']
\}
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = '🔥'
let g:ale_sign_warning = '💭'
let g:ale_statusline_format = ['🔥 %d', '💭 %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

"*****************************************************************************
" Fugitive/Git
"*****************************************************************************


" Make fugitive work in new tabs
autocmd BufWinEnter * if empty(expand('<afile>'))|call fugitive#detect(getcwd())|endif

" Fugitive and general diff and git shortcuts
nmap <leader>gs :Gstatus<CR>
vmap <leader>gs :Gstatus<CR>
nmap <leader>ge :Gedit<CR>
vmap <leader>ge :Gedit<CR>
nmap <leader>gl :Glog -- %<CR>
vmap <leader>ge :Glog -- %<CR>
nmap <leader>gc :Gitcommit<CR>
vmap <leader>gc :Gitcommit<CR>
nmap <leader>gd :Gdiff<CR>
vmap <leader>gd :Gdiff<CR>

nmap <leader>dp :diffput<CR>
vmap <leader>dp :diffput<CR>
nmap <leader>dg :diffget<CR>
vmap <leader>dg :diffget<CR>


"*****************************************************************************
" Surround
"*****************************************************************************

" Surround word
nnoremap <leader>"" :normal ysiw"<Enter>


"*****************************************************************************
" GUI
"*****************************************************************************


" Airline config
let g:airline_theme='powerlineish'
let g:airline_section_x=0
let g:airline_section_y=0
let g:airline_powerline_fonts = 1


" Don't unload buffers when switching (preserves undo history):
set hidden

" Make Gdiff view side by site:
set diffopt+=vertical
"
" Enable mouse in all modes
set mouse+=a
" set ttymouse=xterm2
"  set ttyfast

set t_Co=256
set visualbell

set smartindent

syntax on
colorscheme onedark

" Sensible long lines
set nowrap
set nofoldenable
set formatoptions=qrn1

" Show invisble chars
set list
set listchars=tab:▸\ ,eol:¬
set linespace=1
"
" Better tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
"
" Lines
set number
"
" Ensure 5 lines of context always visible about cursor
set scrolloff=5

" Font
set guifont=Monaco\ For\ Powerline:h13

set nocompatible   " Disable vi-compatibility
set encoding=utf-8 " Necessary to show Unicode glyphs

set nowritebackup
set path=.,**,,

set laststatus=2


"*****************************************************************************
" ctrlp
"*****************************************************************************

" use ctrpl settings
let g:ctrlp_clear_cache_on_exit=0
" Have CtrlP use Vim's cwd not it's smarty pants stuff.
let g:ctrlp_working_path_mode=0
" ctrpl ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules$\|\.DS_Store$\.git$\|\.hg$\|\.svn\|doc$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


"*****************************************************************************
" Search and autocomplete
"*****************************************************************************

" Native search
set hlsearch
set incsearch
set smartcase
nnoremap <C-H> :noh<cr>
"
" Pattern ignore when use the completion in search file
set wig=*.o,*.obj,*~,#*#,*.pyc,*.tar*,*.avi,*.ogg,*.mp3

" Ag
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*


"*****************************************************************************
" File handling
"*****************************************************************************


filetype plugin on

" Yaml Configuration
au BufRead,BufNewFile *.{yml,yaml}

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,Guardfile}    set ft=ruby

" Mustache configuration
au BufNewFile,BufRead *.mustache        setf mustache

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79


"*****************************************************************************
" Syntax highlighting
"*****************************************************************************


let g:jsx_ext_required = 0

au ColorScheme *.{md,mdown,mkd,mkdn,markdown,mdwn} highlight ExtraWhitespace ctermbg=red guibg=red
" au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} setlocal spell spelllang=en
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} match ExtraWhitespace /\s\+$\|\t/
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.styl set filetype=stylus
highlight Normal ctermfg=145 ctermbg=235 guifg=#ABB2BF guibg=#1D1D1D
highlight ExtraWhitespace ctermfg=yellow guibg=yellow

" hi SpellBad guifg='#E06C75' ,{ 'gui 'fg': s:red, 'gui': 'underline', 'cterm': 'underline' }) ' Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
" { 'gui': '#E06C75', 'cterm': '204', 'cterm16': '1' }),
" Only match whitespace when not in insert mode
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Syntax highlighting for things that should probably not be in the file
au BufRead,BufNewFile * syn keyword DebugCommands console log alert

if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Show (partial) command in the status line
set showcmd
" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" No save backup by .swp
set nowb
set noswapfile
set noar

" Delete all whitespace in end of line
autocmd BufWritePre *.{coffee,js} :%s/\s\+$//e

" Autocomplete Fabricator gem
autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()

" Autocomplete Fabricator gem
autocmd User Rails Rnavcommand decorator app/decorators -suffix=_decorator.rb -default=model()

let Tlist_Auto_Update = 'true'
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

"spell check when writing commit logs
"autocmd filetype svn,*commit* set spell


"*****************************************************************************
" Keys
"*****************************************************************************

" Tag closing
let g:ragtag_global_maps = 1

" Multiple cursors
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_insert_maps={ "\<C-r>": 1 }

" Auto-bracketing
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i
" inoremap ' ''<Esc>i
" inoremap ` ``<Esc>i
" inoremap { {}<Esc>i
" inoremap < <><Esc>i

" jumping around files with gf
autocmd filetype jade setl suffixesadd=.jade
autocmd filetype stylus setl suffixesadd=.styl
autocmd filetype javascript setl suffixesadd=.coffee,.litcoffee,.cjsx,.js,.json,.jsx
autocmd filetype coffee setl suffixesadd=.coffee,.litcoffee,.cjsx,.js,.json,.jsx

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Reload vimrc; install plug
nmap <silent> <leader>rc :so ~/.vimrc \| :PlugInstall<CR>

" Sensible windows navigation (versus the painful <C-W>hjkl version)
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
"
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
"
" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1


" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

if has("gui_macvim") && has("gui_running")
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

  " Bubble single lines
  nmap <D-Up> [e
  nmap <D-Down> ]e
  nmap <D-k> [e
  nmap <D-j> ]e

  " Bubble multiple lines
  vmap <D-Up> [egv
  vmap <D-Down> ]egv
  vmap <D-k> [egv
  vmap <D-j> ]egv

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt
else
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <A-]> >gv
  vmap <A-[> <gv

  nmap <A-]> >>
  nmap <A-[> <<

  omap <A-]> >>
  omap <A-[> <<

  imap <A-]> <Esc>>>i
  imap <A-[> <Esc><<i

  " Bubble single lines
  nmap <C-Up> [e
  nmap <C-Down> ]e
  nmap <C-k> [e
  nmap <C-j> ]e

  " Bubble multiple lines
  vmap <C-Up> [egv
  vmap <C-Down> ]egv
  vmap <C-k> [egv
  vmap <C-j> ]egv

  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>

  " Map Control-# to switch tabs
  map  <C-0> 0gt
  imap <C-0> <Esc>0gt
  map  <C-1> 1gt
  imap <C-1> <Esc>1gt
  map  <C-2> 2gt
  imap <C-2> <Esc>2gt
  map  <C-3> 3gt
  imap <C-3> <Esc>3gt
  map  <C-4> 4gt
  imap <C-4> <Esc>4gt
  map  <C-5> 5gt
  imap <C-5> <Esc>5gt
  map  <C-6> 6gt
  imap <C-6> <Esc>6gt
  map  <C-7> 7gt
  imap <C-7> <Esc>7gt
  map  <C-8> 8gt
  imap <C-8> <Esc>8gt
  map  <C-9> 9gt
  imap <C-9> <Esc>9gt
endif

" ', ' maps to clear highlights
nnoremap <leader><space> :noh<cr>

" ',cd' changes directory to the current file's parent
nnoremap <leader>cd :lcd %:h<cr>
" Open a new vertical split and then switch to it.
nnoremap <leader>w <C-w>v<C-w>l
" Insert variable definition for default register content using last
" inserted text.
nnoremap <leader>v O<C-A> = <C-R>"<Esc>
" Control-[hjkl] navigate between splits.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>mh yypv$r
"nnoremap <leader>ml mLyi]Go[<Esc>pA]: <Esc>`L
nnoremap <leader>ml mLya]Go: <Esc>0P`L
nnoremap <leader>mL mLya]Go: <Esc>"*p0P`L
nnoremap <leader>bd :b#<bar>bd#<CR>
"

"*****************************************************************************
" Vim Sessions
"*****************************************************************************


function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

" nmap <leader>ss :call MakeSession()<CR>
" nmap <leader>ls :call LoadSession()<CR>
nmap <leader>os :OpenSession
nmap <leader>ss :SaveSession
" nmap <leader>os :GitSessionSave<CR>
" nmap <leader>ss :GitSessionLoad<CR>
"au VimEnter * nested :call LoadSession()
"au VimLeave * :call MakeSession()




"*****************************************************************************
" tmux
"*****************************************************************************

" Tmux cursor change
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Windows
set guioptions-=T
set guioptions-=r
set guioptions-=l
set guioptions-=L
set guioptions-=R

" Mouse dragging of panes in tmux
if &term =~ '^screen'
  set mouse+=a
  " tmux knows the extended mouse mode
endif


"*****************************************************************************
" Trigger scripts
"*****************************************************************************


function! AddComponent(name, subpath)
  exe "!./scripts/add_component.js ".shellescape(a:name)." ".shellescape(a:subpath)
  exe "edit src/components/".a:subpath."/".a:name.".js"
  exe "split src/components/".a:subpath."/".a:name.".css"
endfunction

function! RGAddComponent(name, subpath)
  exe "!./scripts/add_component.js ".shellescape(a:name)." ".shellescape(a:subpath)
  exe "edit src/components/".a:subpath."/".a:name.".js"
  exe "split src/components/".a:subpath."/".a:name.".css"
endfunction

function! BzAddComponent(name, subpath)
  exe "!./scripts/add_component.js ".shellescape(a:name)." ".shellescape(a:subpath)
  exe "vsplit styles/components/".a:subpath."/".a:name.".styl"
  exe "edit src/components/".a:subpath."/".a:name.".js"
endfunction

command! -nargs=1 AddComponent call AddComponent(<f-args>, "")
command! -nargs=1 AddUIComponent call AddComponent(<f-args>, "ui")
command! -nargs=1 BzAddComponent call BzAddComponent(<f-args>, "")
command! -nargs=1 RGAddComponent call RGAddComponent(<f-args>, "")
