set enc=utf-8
set fenc=utf-8

set nocompatible " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start " more powerful backspacing

" Now we set some defaults for the editor
set lazyredraw  " Don't redraw the screen during macro execution.
set hidden      " Enable 'hidden' buffers
set list number " enable line numbers
set autoindent  " always set autoindenting on
set textwidth=0 " Don't wrap words by default
set nobackup    " Don't keep a backup file
set viminfo='20,\"50 " read/write a .viminfo file, don't store more than
            " 50 lines of registers
set history=50   " keep 50 lines of command line history
set ruler        " show the cursor position all the time
set laststatus=2 "make sure that bottom status bar is running.

let g:git_branch_status_head_current = 1
let g:git_branch_status_ignore_remotes = 1
let g:git_branch_status_text = ''
let g:git_branch_status_nogit = ''
set statusline=%F%m%r%h%w\ %#LineNr#%{GitBranchInfoString()}%#StatusLine#\ [%{Tlist_Get_Tag_Prototype_By_Line()}]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" Switch syntax highlighting on, when the terminal has colors
" Also switch off highlighting the last used search pattern.
if has("syntax") && &t_Co > 2 || has("gui_running")
  set bg=dark
  augroup filetype
    au! BufRead,BufNewFile *.t  set filetype=perl
  augroup END
  syntax on
  hi PreProc ctermfg=Green
endif

" Perl syntax highlighting settings. (perl.vim)
let perl_fold=1
let perl_sync_dist=250
let perl_string_as_statement=1
let perl_include_pod=1

set nofoldenable
if has("autocmd")
  " Enabled file type detection
  " Use the default filetype settings. If you also want to load indent files
  " to automatically do language-dependent indenting add 'indent' as well.
  filetype plugin on
  filetype indent on

  let git_diff_spawn_mode=2

  " less CSS
  autocmd BufRead,BufNewFile *.less set syntax=css


  " Template::Toolkit
  au BufNewFile,BufRead *.tt2 setf tt2html

  " Mutt
  autocmd BufNewFile,BufReadPost mutt-* set textwidth=72 nocp wrap expandtab
  autocmd BufRead mutt-* 1;/^$/+;/^$/
endif " has ("autocmd")

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

augroup filetype
  " Some Debian-specific things
  au BufRead reportbug.*        set ft=mail
  au BufRead reportbug-*        set ft=mail
augroup END

augroup filetypedetect
  autocmd BufRead,BufNewFile *.wiki           setfiletype Wikipedia
  autocmd BufRead,BufNewFile wiki.*.txt       setfiletype Wikipedia
  autocmd BufRead,BufNewFile *.wikipedia.org* setfiletype Wikipedia
augroup END

" CSV plugin settings
augroup filetypedetect
  au! BufRead,BufNewFile *.csv,*.dat setfiletype csv
augroup END

" The following cause vim to behave a lot different from regular vi.
" They are highly recommended.
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set incsearch       " Incremental search
set hlsearch        " Highlight search matches
set autowrite       " Automatically save before commands like :next and :make
set autowriteall
match ErrorMsg '\%>80v.+'

let g:cvWindowPosition = 1
let g:tlWindowPosition = 1
let g:AutoComplPop_NotEnableAtStartup = 1

" LaTeX Suite settings
let g:Tex_UseUtfMenus = 1
let g:Tex_UseMakefile = 1
let g:Tex_DefaultTargetFormat = 'dvi'
let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
let g:Tex_ViewRuleComplete_dvi = 'okular $*.dvi &'
let g:Tex_ViewRuleComplete_ps = 'okular $*.ps &'
let g:Tex_ViewRuleComplete_pdf = 'okular $*.pdf &'

" NeoComplCache
let g:NeoComplCache_EnableAtStartup = 0
let g:NeoComplCache_KeywordCompletionStartLength = 2
let g:NeoComplCache_ManualCompletionStartLength = 2
let g:NeoComplCache_DisableAutoComplete = 1
let g:NeoComplCache_SmartCase = 1
let g:NeoComplCache_EnableQuickMatch = 1
let g:NeoComplCache_EnableCamelCaseCompletion = 1
let g:NeoComplCache_EnableUnderbarCompletion = 1

" MultipleSearch
let g:MultipleSearchMaxColors = 8
let g:MultipleSearchColorSequence = "red,yellow,blue,green,magenta,cyan,gray,brown"
let g:MultipleSearchTextColorSequence = "white,black,white,black,white,black,black,white"

" Gist
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 0

"----- I always want to see how many lines were changed
"----- shows a line when > N lines were changes
set report=0

"----- set for a smaller font in GVIM
"----- the shine font is available from fonts.themes.org
"set guifont=Neep\ Semi-Condensed\ 7
set guifont=peep\ 7

"----- this option will only work for versions of vim > 5.4d
set guioptions-=T

""----- Don't set digraph, use <C-K>, instead.
set nodigraph

"----- set up my nifty stuff to view tabs and trailing spaces
set list
set listchars=tab:»·,trail:·

""---- when I join lines that end with a sentance, put in two spaces
set joinspaces

""---- Completion improvements
set completeopt=longest,menuone

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"----- NERD Commenter stuff
let NERDShutUp=1
let NERDCommentWholeLinesInVMode=2
let NERDSpaceDelims=1

"----- have java highlight our functions
let java_highlight_functions=1
let java_ignore_javadoc=1

"----- netrw configuration
let g:netrw_list_hide = ".*\.swp$"

"----- Perl configuration
let g:Perl_AuthorName = 'Jacob A. Helwig'
let g:Perl_AuthorRef  = 'jhelwig'
let g:Perl_Email      = 'jhelwig@cpan.org'
let g:Perl_Company    = ''
let g:Perl_PerlTags   = 'disabled'

let tlist_perl_settings='perl;c:constants;f:formats;l:labels;p:packages;s:subroutines;d:subroutines;o:POD'

let g:timestamp_modelines = 25
let g:timestamp_rep = '%a, %d %b %Y %H:%M:%S %z'

"Disable autocompletion popup.
let g:AutoComplPop_NotEnableAtStartup = 1

"Set tabs to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

"tell Vim I use a dark background.  Syntax highlighting (color coded text)
"will adjust to more appropriate colors.
set background=dark

function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv

"make a mapping for "Q" which will reformat the current paragraph, comment,
"or code block according to the formatoptions setting:
"set formatoptions=cqran1
map Q gqap

set smartindent
set smarttab
inoremap # X#

let mousemodel="popup_setpos"

"----- viewoutput configuration
let g:viewoutput_newbuffer="bot 5new"

"----- DoxygenToolkit configuration
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Jacob Helwig"
"let g:DoxygenToolkit_licenseTag="My own license\n"

"----- Tlist configuration
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Ctags_Cmd = 'ctags'
let Tlist_Auto_Refresh = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Process_File_Always = 1
let Tlist_Use_Right_Window = 1
let Tlist_Display_Tag_Scope = 1
let Tlist_Show_Menu = 1

au bufreadpost *.cpp,*.c,*.h call Generate_Highlighting()

"----- BufExplorer
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy='mru'

map <C-c> <Plug>Traditionalj

"----- Make JSON readable.
map ;j :%!perl -MJSON -e 'local $/; my $j =JSON->new(); print $j->pretty()->encode($j->decode(<>));'<CR>

"----- time/date stamp
map ;t i<c-r>=strftime("%a %b %d %Y %H:%M:%S")<CR><Esc>

"---------------------------------------------------
"----- various encryption and decryption stuff -----
"---------------------------------------------------
"---- perform rot13 encrpytion using the tr script
map :rot :%!tr A-Za-z N-ZA-Mn-za-m

"----- gnupg encryption and decryption
"---- encrypt and sign the message then armor it too
map ;e :%!/bin/sh -c 'gpg -se -a 2>/dev/tty'
"---- just encrypt and armor the message
map ;E :%!/bin/sh -c 'gpg -e -a 2>/dev/tty'
"---- decrypt
map ;d :/^-----BEG/,/^-----END/!/bin/sh -c 'gpg -d 2>/dev/tty'
"----- sign
map ;s :,$! /bin/sh -c 'gpg --clearsign 2>/dev/tty'

"-------------------------------------------
"----- Syntax Highlighting Information -----
"-------------------------------------------
let html_number_lines = 1
let html_use_css = 1

set foldcolumn=2

" Select colormap: 'soft', 'softlight', 'standard' or 'allblue'
let xterm16_colormap    = 'allblue'
" Select brightness: 'low', 'med', 'high', 'default' or custom levels.
let xterm16_brightness = 'high'
colorscheme xterm16

"-------------------------------------------
"------------ Printing Options -------------
"-------------------------------------------
set printoptions=header:2,syntax:a,number:y,wrap:y,duplex:long,collate:y,jobsplit:y,paper:letter

" ===================================================================
" ASCII Table - | octal value - name/char |
"
" |000 nul|001 soh|002 stx|003 etx|004 eot|005 enq|006 ack|007 bel|
" |010 bs |011 ht |012 nl |013 vt |014 np |015 cr |016 so |017 si |
" |020 dle|021 dc1|022 dc2|023 dc3|024 dc4|025 nak|026 syn|027 etb|
" |030 can|031 em |032 sub|033 esc|034 fs |035 gs |036 rs |037 us |
" |040 sp |041  ! |042  " |043  # |044  $ |045  % |046  & |047  ' |
" |050  ( |051  ) |052  * |053  + |054  , |055  - |056  . |057  / |
" |060  0 |061  1 |062  2 |063  3 |064  4 |065  5 |066  6 |067  7 |
" |070  8 |071  9 |072  : |073  ; |074  < |075  = |076  > |077  ? |
" |100  @ |101  A |102  B |103  C |104  D |105  E |106  F |107  G |
" |110  H |111  I |112  J |113  K |114  L |115  M |116  N |117  O |
" |120  P |121  Q |122  R |123  S |124  T |125  U |126  V |127  W |
" |130  X |131  Y |132  Z |133  [ |134  \ |135  ] |136  ^ |137  _ |
" |140  ` |141  a |142  b |143  c |144  d |145  e |146  f |147  g |
" |150  h |151  i |152  j |153  k |154  l |155  m |156  n |157  o |
" |160  p |161  q |162  r |163  s |164  t |165  u |166  v |167  w |
" |170  x |171  y |172  z |173  { |174  | |175  } |176  ~ |177 del|
"
" ===================================================================
" ASCII Table - | decimal value - name/char |
"
" |000 nul|001 soh|002 stx|003 etx|004 eot|005 enq|006 ack|007 bel|
" |008 bs |009 ht |010 nl |011 vt |012 np |013 cr |014 so |015 si |
" |016 dle|017 dc1|018 dc2|019 dc3|020 dc4|021 nak|022 syn|023 etb|
" |024 can|025 em |026 sub|027 esc|028 fs |029 gs |030 rs |031 us |
" |032 sp |033  ! |034  " |035  # |036  $ |037  % |038  & |039  ' |
" |040  ( |041  ) |042  * |043  + |044  , |045  - |046  . |047  / |
" |048  0 |049  1 |050  2 |051  3 |052  4 |053  5 |054  6 |055  7 |
" |056  8 |057  9 |058  : |059  ; |060  < |061  = |062  > |063  ? |
" |064  @ |065  A |066  B |067  C |068  D |069  E |070  F |071  G |
" |072  H |073  I |074  J |075  K |076  L |077  M |078  N |079  O |
" |080  P |081  Q |082  R |083  S |084  T |085  U |086  V |087  W |
" |088  X |089  Y |090  Z |091  [ |092  \ |093  ] |094  ^ |095  _ |
" |096  ` |097  a |098  b |099  c |100  d |101  e |102  f |103  g |
" |104  h |105  i |106  j |107  k |108  l |109  m |110  n |111  o |
" |112  p |113  q |114  r |115  s |116  t |117  u |118  v |119  w |
" |120  x |121  y |122  z |123  { |124  | |125  } |126  ~ |127 del|

" ===================================================================
" ASCII Table - | hex value - name/char |
"
" | 00 nul| 01 soh| 02 stx| 03 etx| 04 eot| 05 enq| 06 ack| 07 bel|
" | 08 bs | 09 ht | 0a nl | 0b vt | 0c np | 0d cr | 0e so | 0f si |
" | 10 dle| 11 dc1| 12 dc2| 13 dc3| 14 dc4| 15 nak| 16 syn| 17 etb|
" | 18 can| 19 em | 1a sub| 1b esc| 1c fs | 1d gs | 1e rs | 1f us |
" | 20 sp | 21  ! | 22  " | 23  # | 24  $ | 25  % | 26  & | 27  ' |
" | 28  ( | 29  ) | 2a  * | 2b  + | 2c  , | 2d  - | 2e  . | 2f  / |
" | 30  0 | 31  1 | 32  2 | 33  3 | 34  4 | 35  5 | 36  6 | 37  7 |
" | 38  8 | 39  9 | 3a  : | 3b  ; | 3c  < | 3d  = | 3e  > | 3f  ? |
" | 40  @ | 41  A | 42  B | 43  C | 44  D | 45  E | 46  F | 47  G |
" | 48  H | 49  I | 4a  J | 4b  K | 4c  L | 4d  M | 4e  N | 4f  O |
" | 50  P | 51  Q | 52  R | 53  S | 54  T | 55  U | 56  V | 57  W |
" | 58  X | 59  Y | 5a  Z | 5b  [ | 5c  \ | 5d  ] | 5e  ^ | 5f  _ |
" | 60  ` | 61  a | 62  b | 63  c | 64  d | 65  e | 66  f | 67  g |
" | 68  h | 69  i | 6a  j | 6b  k | 6c  l | 6d  m | 6e  n | 6f  o |
" | 70  p | 71  q | 72  r | 73  s | 74  t | 75  u | 76  v | 77  w |
" | 78  x | 79  y | 7a  z | 7b  { | 7c  | | 7d  } | 7e  ~ | 7f del|
" ===================================================================

" vim: ts=2 sw=2 expandtab
