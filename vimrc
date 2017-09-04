call plug#begin('~/.vim/plugged')

Plug 'digitaltoad/vim-jade'
Plug 'wavded/vim-stylus'
Plug 'joshdick/onedark.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'kien/ctrlp.vim'
Plug 'mtscout6/vim-cjsx'
Plug 'elzr/vim-json'
Plug 'wavded/vim-stylus'
let g:jsx_ext_required = 0
Plug 'mxw/vim-jsx'
Plug 'rking/ag.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
let g:ragtag_global_maps = 1
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'xolox/vim-misc'
Plug 'jparise/vim-graphql'
" Plug 'xolox/vim-session'
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_insert_maps={ "\<C-r>": 1 }
Plug 'junegunn/vim-emoji'
Plug 'wakatime/vim-wakatime'
Plug 'michaeljsmith/vim-indent-object'
Plug 'JofArnold/vim-template-literal'
Plug 'christoomey/vim-tmux-navigator'
Plug 'thaerkh/vim-workspace'
Plug 'sbdchd/neoformat'

let g:neoformat_enabled_javascript = ['eslint_d']
augroup neoformat_group
  autocmd!
  autocmd BufWritePre *.js,*.jsx silent Neoformat
augroup END

Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.vim'] }
Plug 'gavocanov/vim-js-indent', { 'for': ['javascript', 'javascript.vim'] }

" Linting
Plug 'benjie/neomake-local-eslint.vim'
Plug 'benekastah/neomake'
" Autofix entire buffer with eslint_d:
nnoremap <leader>f mF:%!eslint_d --stdin --fix-to-stdout<CR>`F
" Autofix visual selection with eslint_d:
vnoremap <leader>f :!eslint_d --stdin --fix-to-stdout<CR>gv


call plug#end()


"*****************************************************************************
" Neomake
"*****************************************************************************

let g:neomake_javascript_enabled_makers = ['eslint_d']
let g:neomake_jsx_enabled_makers = ['eslint_d']
autocmd! BufWritePost *.js,*.jsx silent NeomakeFile
autocmd! BufWinEnter *.js,*.jsx silent NeomakeFile
let g:neomake_coffee_enabled_makers = ['coffeelint']
let g:neomake_cjsx_enabled_makers = ['coffeelint']
autocmd! BufWritePost *.coffee,*.cjsx silent NeomakeFile
autocmd! BufWinEnter *.coffee,*.cjsx silent NeomakeFile
let g:neomake_ruby_rubocop_args = ['--format', 'emacs', '-D']
let g:neomake_ruby_enabled_makers = ['rubocop']
autocmd! BufWritePost *.rb silent NeomakeFile
autocmd! BufWinEnter *.rb silent NeomakeFile
let g:neomake_list_height = 5

let g:neomake_warning_sign = {'text': '💩'}
let g:neomake_error_sign = {'text': '💩'}
let g:neomake_message_sign = {'text': '💩'}
let g:neomake_info_sign= {'text': '💩'}

set nowritebackup

set path=.,**,,

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
"
" Don't unload buffers when switching (preserves undo history):
set hidden


" Make Gdiff view side by site:
set diffopt+=vertical
"
" Enable mouse in all modes
set mouse+=a
set ttymouse=xterm2
set ttyfast

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


"*****************************************************************************
" Powerline
"*****************************************************************************

set laststatus=2
let g:powerline_symbols = 'unicode'
let g:powerline_dividers_override = ['>>', '>', '<<', '<']
let g:powerline_theme = 'solarized256'


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


au ColorScheme *.{md,mdown,mkd,mkdn,markdown,mdwn} highlight ExtraWhitespace ctermbg=red guibg=red
" au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} setlocal spell spelllang=en
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} match ExtraWhitespace /\s\+$\|\t/
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.styl set filetype=stylus
highlight Normal ctermfg=145 ctermbg=235 guifg=#ABB2BF guibg=#1D1D1D
highlight ExtraWhitespace ctermfg=yellow guibg=yellow

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
autocmd filetype svn,*commit* set spell



"*****************************************************************************
" Keys
"*****************************************************************************
"
"
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


nmap <leader>ww :ToggleWorkspace<CR>

" ignore 'options' because of latex-suite (would be pointless to save that!)

" let g:session_autoload = 'yes'
" set sessionoptions=blank,curdir,folds,help,resize,tabpages,winsize
" map <leader>ss :mksession! ~/.vim/.session<cr>
" map <leader>sr :source ~/.vim/.session<cr>
" let g:session_autosave = 'yes'


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
