" ==========================================================================================================================
" ====== AUTOCOMPLETE ======================================================================================================
" ==========================================================================================================================
	autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType css set omnifunc=csscomplete#CompleteCSS
	autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" ==========================================================================================================================
" ====== KEYBINDINGS =======================================================================================================
" ==========================================================================================================================
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
	
	" Easy exit from any mode. NOTE: if the file was modified the changes will NOT be saved.
	imap <C-q> <Esc>:q!<Cr>
	map <C-q> <Esc>:q!<Cr>
	
	" Smart home
	noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
	imap <silent> <Home> <C-O><Home>
	
	" Tab navigation like firefox
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
	
" ==========================================================================================================================
" ====== FUNCTIONALITY =====================================================================================================
" ==========================================================================================================================
	set foldmethod=syntax
	
	" A tab will ocupy the size of 4 spaces
	set tabstop=4
	" Number of spaces to use for each step of (auto)indent.  Used for |'cindent'|, |>>|, |<<|, etc.
	set shiftwidth=4
	" Round indent to multiple of 'shiftwidth'.  Applies to > and < commands.
	set shiftround
	" When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.
	" 'tabstop' or 'softtabstop' is used in other places.  A <BS> will delete
	" a 'shiftwidth' worth of space at the start of the line.
	set smarttab
	
	" Copy indent from current line when starting a new line
	set autoindent
	
	" List tab (with >-) and end of line (with $) characthers
	set list
	set listchars=tab:>-,eol:$
	
	" Makes F5 toggle paste mode
	set pastetoggle=<F5>
	" Clear paste mode when going back to normal mode
	au InsertLeave * set nopaste
	
	set nowrap
	
	" Automatic indentation based on file type
	filetype indent on
	filetype plugin on
	
	" Allows backspacing over autoident, over line breaks (join lines)
	" and over the start of the line
	set backspace=indent,eol,start
	
	" Remembers the last 1000 search patterns
	set history=1000
	
	" First tab completes as much as possible and shows the list if there is
	" more than one matching item. Next tabs iterate through the list.
	set wildmenu
	set wildmode=list:longest,full
	
	" While typing a search command, show where the pattern, as it was typed
	" so far, matches. The matched string is highlighted.
	set incsearch
	
	" A new vsplited window will appear to the right of the current one
	set splitright
	" A new splited window will apperar bellow the current one.
	set splitbelow
	
	" When "on" the commands listed below move the cursor to the first non-blank of the line.
	set startofline
	
	" More intuitive selecting in visual mode
	set selection=exclusive
	
	" Easy access to NERDTree
	if(!exists('vimrc_already_sourced'))
	    command Nt NERDTree
	    command Nc NERDTreeClose
	endif
	
	" Fix annoying surround.vim message
	vmap s S
	
	" Use unix line endings (LF) unless the file already has DOS line endings
	set fileformats=unix,dos
	" Set the initial buffer to unix line endings
	set fileformat=unix
	
	"Indicates a fast terminal connection.  More characters will be sent to
	"the screen for redrawing, instead of using insert/delete line commands.
	set ttyfast
	
" ==========================================================================================================================
" ====== VISUAL ============================================================================================================
" ==========================================================================================================================
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
	
	" Hides all scroll bars
	set guioptions-=r,l,L
	
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
	
	" Show line numbers
	set nu
	
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
	" setglobal spell spelllang=en_gb
	
	" Keep more context when editing PHP files so Vim doesn't try to highlight
	" PHP as HTML and vice-versa.
	" let php_minlines=500
	
	" Rainbow parentheses colors.
	" Left column is for terminal environment.
	" Right column is for GUI environment.
	" Outermost is determined by last.
	"let g:rbpt_colorpairs = [
	"	\ ['blue',       '#FF6000'],
	"	\ ['cyan', '#00FFFF'],
	"	\ ['darkmagenta',    '#CC00FF'],
	"	\ ['yellow',   '#FFFF00'],
	"	\ ['red',     '#FF0000'],
	"	\ ['darkgreen',    '#00FF00'],
	"	\ ['White',         '#c0c0c0'],
	"	\ ['blue',       '#FF6000'],
	"	\ ['cyan', '#00FFFF'],
	"	\ ['darkmagenta',    '#CC00FF'],
	"	\ ['yellow',   '#FFFF00'],
	"	\ ['red',     '#FF0000'],
	"	\ ['darkgreen',    '#00FF00'],
	"	\ ['White',         '#c0c0c0'],
	"	\ ['blue',       '#FF6000'],
	"	\ ['cyan', '#00FFFF'],
	"	\ ['darkmagenta',    '#CC00FF'],
	"	\ ['yellow',   '#FFFF00'],
	"	\ ['red',     '#FF0000'],
	"	\ ['darkgreen',    '#00FF00'],
	"	\ ['White',         '#c0c0c0'],
	"	\ ]
	
	" Update this with the amount of supported colors
	" let g:rbpt_max = 21
	
	" Turn rainbow parenthesis script on
	"au VimEnter * RainbowParenthesesToggle
	" These are necessary to re-load the stuff when syntax changes.
	"au Syntax * RainbowParenthesesLoadRound
	" I don't anything but ( and ) colored, so don't bother loading these
	"au Syntax * RainbowParenthesesLoadSquare
	"au Syntax * RainbowParenthesesLoadBraces
	
	let vimrc_already_sourced = 1
