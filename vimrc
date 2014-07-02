" ====== AUTOCOMPLETE ==============
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" ====== FUNCTIONALITY =============
set nocompatible

" Make j,k move by screen lines instead of file lines.
" WARNING: If you use this vimrc, make sure you understand the implications
" of the following two mappings, especially if you use macros frequently.
" A temporary workaround for writing macros is to go into insert mode, use
" the up/down arrow keys, then exit to normal mode.
map j gj
map k gk

" backspace and cursor keys wrap to previous/next line
"set backspace=indent,eol,start whichwrap+=<,>,[,]

" backspace in Visual mode deletes selection
vnoremap <BS> d

" Make indenting and unindenting in visual mode retain the selection so
" you don't have to re-select or type gv every time.
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Make CTRL+u and CTRL+d less confusing
map <C-u> 10<C-Y>10k
map <C-d> 10<C-E>10j
" Scroll the /screen/ with ALT+{j,k}
map <A-j> 2<C-E>
map <A-k> 2<C-Y>

" Switch windows quickly with CTRL+{h,j,k,l}
" This breaks backspace in a terminal, but I never use backspace in normal mode
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
" This would break in a terminal where ^H is backspace.
if has("gui_running")
    imap <C-h> <Esc><C-W>h
endif
imap <C-j> <Esc><C-W>j
imap <C-k> <Esc><C-W>k
imap <C-l> <Esc><C-W>l

" Quickly switch between buffers with CTRL+b
map <C-b> :b#<Cr>

" Easy save from any mode
imap <C-\> <Esc>:w<Cr>
map <C-\> <Esc>:w<Cr>


" Smart home
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

set listchars=tab:>-,eol:$
set foldmethod=marker
set tabstop=4
set shiftwidth=4
set autoindent
set list
" Allow middle-click pasting of large texts in terminal
set pastetoggle=<F5>
" Clear paste mode when going back to normal mode
au InsertLeave * set nopaste
set sidescrolloff=20
" Automatic indentation based on file type
filetype indent on
filetype plugin on
set backspace=2
set history=1000
" First tab completes as much as possible and shows the list if there is
" more than one matching item. Next tabs iterate through the list.
set wildmode=list:longest,full
set wildmenu
set incsearch
set hidden
set splitright
set splitbelow
set shiftround
set nostartofline
set smarttab

" More intuitive selecting in visual mode
set selection=exclusive

" Easy access to NERDTree
if(!exists('vimrc_already_sourced'))
    command Nt NERDTree
    command Nc NERDTreeClose
endif

" Fix annoying surround.vim message
vmap s S

" tab navigation like firefox
nmap <C-S-tab> :tabprevious<CR>
nmap <C-tab> :tabnext<CR>
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
imap <C-S-tab> <Esc>:tabprevious<CR>i
imap <C-tab> <Esc>:tabnext<CR>i
"nmap <C-t> :tabnew<CR>
"imap <C-t> <Esc>:tabnew<CR>

" TAB on select indents:
" Note: Using > and < is a lot easier!
smap <Tab> <Esc>:'<,'> > <CR>
vmap <Tab> <Esc>:'<,'> > <CR>gv

" Omnicomplete
" TODO: Windows needs CTAGS http://vim.wikia.com/wiki/Omni_completion
" apt-get install exuberant-ctags
" set ofu=syntaxcomplete#Complete

set formatoptions+=l
set lbr

set ttyfast

" ---- PRINTING ----
set popt=left:1in,right:1in,top:1in,bottom:1in,header:2,syntax:a,paper:letter
" On PostScript systems, Vim ignores the font but NOT the size.
" So this will make us print in 8-pt (but not necessarily courier)
set printfont=courier:h8
set printoptions+=duplex:long

set iskeyword +=-,_

" Use unix line endings (LF) unless the file already has DOS line endings
set fileformats=unix,dos
" Set the initial buffer to unix line endings
set fileformat=unix

" Don't comment the new line when pressing o or O on a commented line
" This block must come after the other filetype lines in this file.
set formatoptions -=o
augroup myft
  au!
  au FileType * setlocal formatoptions-=o
augroup END

" Use strong encryption
" set cm=blowfish

" ============== VISUAL =================
set background=dark
syntax on
colorscheme jellybeans
    
" Make spelling mistake highlighting easier on the eyes.
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red
hi clear SpellCap
hi SpellCap cterm=underline ctermfg=blue
hi clear SpellLocal
hi SpellLocal cterm=underline ctermfg=blue
hi clear SpellRare
hi SpellRare cterm=underline ctermfg=blue

hi StatusLine cterm=NONE ctermbg=NONE ctermfg=gray guibg=#202020 guifg=white

" Highlight the line the cursor is on
set cursorline

" Always show the last line on the screen, even when it's too long (gets
" rid of the annoying @@@@@ crap)
set display+=lastline

" Always show the status line
set laststatus=2
" Status line content
"set statusline=%n:\ %F\ [%{&ff}]%y%m%h%w%r\ %=char=0x%B\ \ \ x=%v\ y=%l/%L\ -\ %p%%\ 
set statusline=%n:\ %F\ [%{&ff}]%y%m%h%w%r\ %=[char:\ 0x%B]\ \[column:\ %v]\ [line:\ %l\ of\ %L\ \(%p%%\)]\

" Make the default window size bigger
if has("gui_running") && !exists('vimrc_already_sourced')
    set lines=32 columns=120
endif

" No annoying flashes
set novb

" Fix GNOME disappearing mouse bug
set nomousehide

set mouse=nicr

"Hide the toolbar
"set guioptions-=T
" Hide the menu bar
"set guioptions-=m
" Scroll bars are for noobs
set guioptions-=r
set guioptions-=l
set guioptions-=L
" Make visual selection copy to the middle click buffer.
" If enabled on Windows, this will make selection copy to the Windows
" clipboard, which can be a pain if you need to select something and
" delete it before pasting.
if has("unix")
  set guioptions+=a
endif
" When in gui mode, don't open an entire messagebox to ask a question
set guioptions+=c

" Quickly jump to opening brace and back to avoid mistakes
set showmatch
set matchtime=1

" Line numbers
set nu

if has("unix")
    set guifont=Monospace\ 8
else
    set guifont=Lucida_Console:h10:cANSI
endif

" $ for change command instead of deleting word then insert
set cpoptions+=$

" Highlight search terms
set hlsearch

" Skip the splash screen
set shortmess+=I

" Don't update the display while executing macros
set lazyredraw

" When the page starts to scroll, keep the cursor 4 lines from the top and 8
" lines from the bottom
set scrolloff=4

" Show the command as it's being typed in the lower right
set showcmd

" Spell checking
setglobal spell spelllang=en_ca
" By default spelling is off...
set nospell
" ...but enable it for the English text files I use a lot.
au BufRead,BufNewFile,BufWrite *.txt,*.tex,*.latex set spell

" Keep more context when editing PHP files so Vim doesn't try to highlight
" PHP as HTML and vice-versa.
let php_minlines=500

" Rainbow parentheses colors.
" Left column is for terminal environment.
" Right column is for GUI environment.
" Outermost is determined by last.
let g:rbpt_colorpairs = [
    \ ['blue',       '#FF6000'],
    \ ['cyan', '#00FFFF'],
    \ ['darkmagenta',    '#CC00FF'],
    \ ['yellow',   '#FFFF00'],
    \ ['red',     '#FF0000'],
    \ ['darkgreen',    '#00FF00'],
    \ ['White',         '#c0c0c0'],
    \ ['blue',       '#FF6000'],
    \ ['cyan', '#00FFFF'],
    \ ['darkmagenta',    '#CC00FF'],
    \ ['yellow',   '#FFFF00'],
    \ ['red',     '#FF0000'],
    \ ['darkgreen',    '#00FF00'],
    \ ['White',         '#c0c0c0'],
    \ ['blue',       '#FF6000'],
    \ ['cyan', '#00FFFF'],
    \ ['darkmagenta',    '#CC00FF'],
    \ ['yellow',   '#FFFF00'],
    \ ['red',     '#FF0000'],
    \ ['darkgreen',    '#00FF00'],
    \ ['White',         '#c0c0c0'],
    \ ]

" Update this with the amount of supported colors
let g:rbpt_max = 21

" Turn rainbow parenthesis script on
"au VimEnter * RainbowParenthesesToggle
" These are necessary to re-load the stuff when syntax changes.
"au Syntax * RainbowParenthesesLoadRound
" I don't anything but ( and ) colored, so don't bother loading these
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

let vimrc_already_sourced = 1
