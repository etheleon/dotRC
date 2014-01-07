""""""""""""""""""""""""""""""""""""""""""""""""
""" Maintainer: Wesley Goi <picy2k@gmail.com>
"""    Created: Fri 23 May 2008 06:56:06 PM SGT
"""   Modified: Mon 06 Jan 2014 02:40:52 PM CST
""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""
""" Cheatsheet:
""""""""""""""""""""""
"
"   ctrl-o  # retrace your movement in file (old)
"   ctrl-i  # retrace your movement in file (new)
"
"   :reg  # list of registers
"   "bp   # use register b to do put (or yank, or delete)
"
"   qx    # start recording, store in register x
"   q     # stop recording
"   @x    # execute recording stored in register x
"   @@    # repeate last execution
"
"   .   # repeat last change
"   ~   # change case
"   g~m	# switch case of movement command m
"   guu # change whole line to lower case
"   gUU # change whole line to upper case
"   gum # lowercase text of movement m
"   gUm # uppercase text of movement m
"   3yy # yank 3 lines
"   cw  # change word
"   cc  # change line
"   c$  # change to end of line
"   C   # same as above
"   D   # delete to end of line
"   rx  # replace character with x
"   R   # replace - typeover
"   s   # substitute - 1 char with text
"   S   # substitute - rest of line with text
"   J   # join two lines
"   A   # append text at end of line
"
"   ctrl-A  # reconfigured to ^; Originally number increament
"   ctrl-X  # number decrement
"   
"   ctrl-d  # scroll down half a screen
"   ctrl-u  # scroll up half a screen
"   
"   z<CR>  # reposition window: cursor at top
"   z.     # reposition window: cursor in middle
"   z-     # reposition window: cursor at bottom
"   
"   w    # one word forward; cursor at begining
"   b    # one word back; cursor at begining
"   e    # one word forward; cursor at end
"   ge   # one word back; cursor at end
"   gk   # moving with screen/display line
"
"   80%  # move to 80% of the file
"   H    # cursor position: upper left corner
"   M    # middle line
"   L    # lower left corner
"   3|   # move the the 3rd column of the line
"
"   fx   # find x
"   Fx   # find x, backward
"   tx   # find x, non-inclusive
"   Tx   # backward
"   ;    # repeat find
"   %    # match braces {[(
"   
"   *   # search current word
"   #   # search current word, backward
"   n   # repeat search
"   N   # repeat search reverse
"   nhls  # nohlsearch
"
"   ctrl-N  # (insert mode) omini complete
"   ctrl-P  # (I) another compelte ?
"   ctrl-W  # (I) delete previous word/token
"   ctrl-U  # (I) detete inserted text in current line, or the whole line
"   ctrl-Rx # (I) insert text in regester x
"
"   :%range% perldo s/replace/with/g  # use perl regexp, if complied with +perl check :ver
"
"   p       # put after cursor position
"   P       # put before cursor position
"   ]p      # paste like `p', but match local indent
"   [P      # paste like `P', but match local indent
"
"   ==      # (re) indent line
"   <m      # shift left text of movement m 
"   >m      # shift right text of movement m
"   n<<     # shift n lines left
"   n>>     #shift n lines right
"
"   zs      # toggle open/close fold using SimpleFold.vim; customized
"   set spell  # enable spell checker
"   ]s   # move to next misspelled word
"   [s   # move backwards
"   zg   # mark the word as good
"   zw   # mark the word as wrong
"   z=   # show me the corrections
"   
"   g,   # previously modified line: forward search
"   g;   # previously modified line: backward search
"   '.   # jump to last modified line
"   `.   # jump to exact spot of last modification
"
"   mx   # mark current cursor position with x
"   'x   # move cursor to first character of the line marked as x
"   `x   # move cursor to the character maked as x
"   ''   # return to first character of last jump or m'
"   ``   # return to exact character of last jump or m`
"   
"   u      # undo 
"   ctrl-R # redo
"   
"   :set list   # display tabs; customized
"   :set nolist # hide tabs
"   \m          # remove all ^M; customized
"
"   co    # comment out current line, 
"         # or (in visual mode) block of lines; customized
"         # supports perl, R, vim, javascript, latex, python
"   oo    # revert co; customized
"   
"   :split another_file   # open another window for another_file
"   :vsplit another_file  # open another vertical window for another_file
"   ctrl-w w             # cycle through splitted windows
"   ctrl-w j             # move to the next (vertical) window
"   ctrl-w =             # resize windows to equal size
"   ctrl-w +             # increase window size
"   :resize +8           # increase window size by 8
"
"   :set all  # show all options used
"   :set      # show options you changed
"   :set opt? # show current value for opt
"
"   :h x[TAB] # cycle through help subjects related to x
"   Ctr-]       # go to |tag|, like in help
"
"""""""""""""""""""""
""" Settings: 
"""""""""""""""""""""
set nocompatible    "why vi ?!?
set term=xterm-256color
" Colors:
if &t_Co > 2 || has("gui_running") " for terminal that has colors
	set t_Co=256
	if has('syntax')
		syntax on
	endif
	set background=dark
	colorscheme Monokai

endif

if &term =~ '256color'
	set t_ut=
endif

set mouse=a
			 " mouse is clickable; 
             " use shift when use putty to copy and paste;
             " use Option-key + click on Mac

" Display:
set number               "line numbers; set nonumber to disable
set relativenumber
set hlsearch             "highlighting searches
set showmatch            "show matching brackets
set visualbell t_vb=     "stop beeping
set scrolloff=3          "keep at least 3 lines around the cursor
set listchars=tab:._     "use 'set list' to display tabs as '.__'
set laststatus=2         "always display status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%p%%]\ [LEN=%L]

" Indent:
set autoindent      "set cursor at the same indent as line above
set smartindent     "try to be smart, C-style
set shiftwidth=4    "space for each step of autoindent
set tabstop=4       "for proper display of files with tabs
set shiftround      "always round indents to multiple of shiftwidth
set copyindent      "use existing indent for new indents
set preserveindent  "save as much indent structure as possible
filetype plugin indent on   "load filetype plugins and indent settings

" Misc:
set nobackup
"set foldmethod=syntax
set whichwrap=bs[]<>
set backspace=indent,eol,start
set ignorecase smartcase               "smart search
set incsearch                          "search as you type
set encoding=utf-8
set fileformat=unix
set autoread
set completeopt=menu,longest,preview   "more Ctrl-P autocomplete options
set viminfo='50,<1000,s100             "save up to 1000 lines or 100KB in each register
set backupskip=/tmp/*,/private/tmp/*   " make vim work with crontab -e in Mac
set clipboard=unnamed
" restore last cursor position
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif

autocmd Filetype perl compiler perl                           "enable 'make' for perl
autocmd Filetype tex,plaintex setlocal spell                  "set spell checker for latex
autocmd Filetype tex,plaintex,text setlocal textwidth=120      "set 
autocmd BufNewFile,BufRead .r,.R  setf R                      "force R format; REXX ?!?
au BufNewFile,BufRead *.r set filetype=r
au BufNewFile,BufRead *.R set filetype=r
" "for timestamp.vim
" "limited autotimestamp to html files
"let g:timestamp_automask = "*.html"

"
"################ Key Mappings ###################

" map zs to fold funtion in SimpleFold.vim
nmap  zs \f
"Remove the Windows ^M
noremap \m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Backspace to delete in Insert and Visual mode
imap	<BS>	<left><del>
vmap	<BS>	<del>

"Perl,Python
" code to coment for perl, python
vmap	co		<Esc><Esc>:'<,'>s/^/#/<CR><Esc>:nohlsearch<CR>
nmap	co		<Esc><Esc>:s/^/#/<CR><Esc>:nohlsearch<CR>
" remove coment for perl, python
vmap	oo		<Esc><Esc>:'<,'>s/^#\+//<CR><Esc>:nohlsearch<CR>
nmap	oo		<Esc><Esc>:s/^#\+//<CR><Esc>:nohlsearch<CR>

"TEX
" code to coment for tex
autocmd Filetype tex,plaintex vmap	co		<Esc><Esc>:'<,'>s/^/%/<CR><Esc>:nohlsearch<CR>
autocmd Filetype tex,plaintex nmap	co		<Esc><Esc>:s/^/%/<CR><Esc>:nohlsearch<CR>
" remove comment for tex
autocmd Filetype tex,plaintex vmap	oo		<Esc><Esc>:'<,'>s/^%\+//<CR><Esc>:nohlsearch<CR>
autocmd Filetype tex,plaintex nmap	oo		<Esc><Esc>:s/^%\+//<CR><Esc>:nohlsearch<CR>

" code to coment for vim 
autocmd Filetype vim vmap	co		<Esc><Esc>:'<,'>s/^/"/<CR><Esc>:nohlsearch<CR>
autocmd Filetype vim nmap	co		<Esc><Esc>:s/^/"/<CR><Esc>:nohlsearch<CR>

" coment to code for tex
autocmd Filetype vim vmap	oo		<Esc><Esc>:'<,'>s/^"\+//<CR><Esc>:nohlsearch<CR>
autocmd Filetype vim nmap	oo		<Esc><Esc>:s/^"\+//<CR><Esc>:nohlsearch<CR>

" code to coment for javascript 
autocmd Filetype javascript vmap	co		<Esc><Esc>:'<,'>s/^/\/\//<CR><Esc>:nohlsearch<CR>
autocmd Filetype javascript nmap	co		<Esc><Esc>:s/^/\/\//<CR><Esc>:nohlsearch<CR>

" coment to code for javascript
autocmd Filetype javascript vmap	oo		<Esc><Esc>:'<,'>s/^\/\/\+//<CR><Esc>:nohlsearch<CR>
autocmd Filetype javascript nmap	oo		<Esc><Esc>:s/^\/\/\+//<CR><Esc>:nohlsearch<CR>

" HJKL mode disables the arrow keys 
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"tab movement 
map <leader>tn :tabnew<CR>
map <leader>tc :tabclose<CR>
"moving left and right between tabs
nnoremap <leader><left> :tabmove -1<cr>
nnoremap <leader><right> :tabmove +1<cr>

""""""""""""""""""""
""" Functions
""""""""""""""""""""

" Merge a tab into a split in the previous window
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction
nmap <C-W>u :call MergeTabs()<CR>

" Removes readonly 
function! g:ChmodOnWrite()
  if v:cmdbang
    silent !chmod u+w %
  endif
endfunction

autocmd BufWrite * call g:ChmodOnWrite()

"""""""""""""""""""""
""" Plugin Settings: 
"""""""""""""""""""""
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
call pathogen#infect()

syntax enable

"Vim-r-plugin"""""""""" 

let vimrplugin_applescript = 0
"let vimrplugin_screenplugin = 0
"For tmux support
let g:ScreenImpl = 'Tmux'
let vimrplugin_vsplit = 1 " For vertical tmux split
let g:ScreenShellInitialFocus = 'shell'
" instruct to use your own .screenrc file
"let g:vimrplugin_noscreenrc = 1
" For integration of r-plugin with screen.vim
"let g:vimrplugin_screenplugin = 1
" Don't use conque shell if installed
let vimrplugin_conqueplugin = 0
" map the letter 'r' to send visually selected lines to R
let g:vimrplugin_map_r = 1
" see R documentation in a Vim buffer
let vimrplugin_vimpager = "horizontal"
"set expandtab
set shiftwidth=4
set tabstop=8
" start R with F2 key
"map <F2> <Plug>RStart
"imap <F2> <Plug>RStart
"vmap <F2> <Plug>RStart

" send selection to R with space bar
vmap <Space> <Plug>REDSendSelection
" send line to R with space bar
nmap <Space> <Plug>REDSendLine

let vimrplugin_assign = 0 
"let r_syntax_folding = 1

"keeps fold after folding
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

"NERDTree""""""""""
nmap <leader>z :NERDTreeToggle<cr>
filetype indent off
"""""""""""""""""""
