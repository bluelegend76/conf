let mapleader=","
" IDEAS:
"  TODO: DOT-COMMAND FOR VMARKED LINES [*****]
" TODO: TAG MARKED SENTENCE WITH EMPIRE-STYLE TAGS  v_n v_N (+numbers) v_t v_T (etc/and others)
" TODO: VMARKED SENTENCE: PAD EMPTY LINE AT TOP (=ABOVE MARKED SENTENCE)
" TODO: LEFT/RIGHT = MOVE BETW. SENTENCES (MAYBE: VMARK SENTENCE)
" TODO: A-Left/A-Right = Decrease/Increase Foldlevel [****]
" z1/a1, z2/a2 etc = set foldlevel to 1,2 etc [??]
" WHEN SEARCHING (/, *, n) = OPEN CLOSED FOLD COVERING SEARCH-MATCH ****
" New 'cd-toggle' (cd %:h  +  cd -) [***]
" Visual m-marks (+easy moving betw. with Arrow-keys (or the like))
" NEW: FLIP BACKW/FORW - SEARCH-HISTORY(=Active Searchpattern), V-HIGHLIGHTS (=maybe with hotkey for saving a partic. highlight)
"   [activate mode  + ca-up/down (or the like)]

" TODO: VIM SPELL, VIM COLORS
" INVESTIGATE: INSTALLING AND USING VUNDLE/PLUG FOR HANDLING VIM-PLUGINS
" TODO: ADD ,et : go to top + set setting/run ex-line at top
"---- __
colorscheme ron
set guicursor+=a:blinkon0
set hlsearch
set incsearch
" Reset search-highlighting (builds on c-l)
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
set modeline
set showcmd
set path+=**
set wildmenu
set nrformats=
"" https://stackoverflow.com/questions/1636297/how-to-change-the-folder-path-for-swp-files-in-vim/1636944
" set directory=~/.vim//
" set backupdir=~/.vim//

set nocompatible
filetype plugin indent on
syntax on
" + Change to filetype off when introducing Vundle

" FONTS (RESIZING AND RESETTING - OS-agnostic (hopefully))  __
" if has("gui_running")
"   if has("gui_gtk2")
"     set guifont=Inconsolata\ 12
"   elseif has("gui_macvim")
"     set guifont=Menlo\ Regular:h14
"   elseif has("gui_win32")
"     set guifont=Consolas:h11:cANSI
"   endif
" endif
"     " ----

"### function! ResizeFont(increment)
"###   let current_font = substitute(string(&guifont), '.*:h', '', '')
"###   execute "set guifont=".substitute(&guifont, ':h.*', ':h'.(current_font + a:increment), '')
"### endfunction
"### 
"### nnoremap <C-WheelUp> :call ResizeFont(2)<CR>
"### nnoremap <C-WheelDown> :call ResizeFont(-2)<CR>

" nnoremap <C-MouseUp> :silent! let current_font = substitute(string(&guifont), '.*:h', '', '')\| execute "set guifont=" . substitute(&guifont, ':h.*', ':h' . (current_font+2), '')<CR>
" nnoremap <C-MouseDown> :silent! let current_font = substitute(string(&guifont), '.*:h', '', '')\| execute "set guifont=" . substitute(&guifont, ':h.*', ':h' . (current_font-2), '')<CR>
" nnoremap <C-MouseUp> :silent! let &guifont = substitute(&guifont, ':h\zs\d+', '=eval(submatch(0)-1)', '')<CR>
" nnoremap <C-MouseDown> :silent! let &guifont = substitute(&guifont,':h\zs\d+','=eval(submatch(0)+1)', '')<CR>
"" nnoremap <C-MouseUp> :silent! let &guifont = substitute(&guifont, ':h\zs\d\+', '\=eval(submatch(0)-1)', '')<CR>
"" nnoremap <C-MouseDown> :silent! let &guifont = substitute(&guifont,':h\zs\d\+','\=eval(submatch(0)+1)', '')<CR>

" Tabs/Indentation  __
" size of a hard tabstop
set tabstop=4
" size of an "indent"
set shiftwidth=4
" a combination of spaces and tabs are used to simulate tab stops at a width
"   other than the (hard)tabstop
set softtabstop=4
" no tabs at all - just spaces
set expandtab
set smartindent

" Folding  __
nnoremap <Space> za
" --
" marker-fold marked lines
vnoremap <leader>fm <Esc>o<c-h><Esc>gvjo<Esc>A <Esc>gvzfzc
" produce fold from a line
nnoremap <leader>fa A <CR> <c-h><Esc>Vkzfzc
" --
" TODO/MAY BE SUPERFLUOUS: ADD A-RIGHT/LEFT = INCREASE/DECREASE FOLD-LEVEL

" Move line(s), visual marker-line
" Move lines with Alt-Up/Down (Gedit-style)
" TODO: May want to add 'Highlight Next/Prev. Sentence'
nnoremap <A-Up> ddkP
nnoremap <A-Down> ddjP
" vnoremap <A-Up> dkkpV`]
" vnoremap <A-Down> dpV`]
" nnoremap <C-A-Up> ddkPzc
" nnoremap <C-A-Down> ddjPzc
" --
vnoremap <Up> kok$
vnoremap <Down> joj$
" 'Sentence Highlighter' ----
vnoremap <Right> <Esc>)visozt
vnoremap <Left> <Esc>(ztviso


nnoremap <leader>co :colors <C-D>


" Input-Completion Shortcuts  __
inoremap <leader><leader> <c-n>
inoremap <a-up> <c-p>
inoremap <a-down> <c-n>
" --
inoremap <leader>ä <c-p>
inoremap <leader>xf <c-x><c-f>
inoremap <leader>xl <c-x><c-l><c-n>
inoremap <leader>ö <c-x><c-n>
inoremap <c-,> <c-x><c-n>
" inoremap <c-s-,> <c-x><c-p>
" inoremap <leader>xn <c-x><c-n>
inoremap <leader>pn <c-p><c-n>
"   +ev 'dra ihop rader'    #=om inte anv. 'snippets' för 
"                           #  boilerplate mm/olikn.


" TODO: Convenience-mappings for 'thorny' characters
" --
nnoremap <leader>o <CR>
inoremap <leader>o <Esc>o
cnoremap <leader>o <CR>
nnoremap <leader><leader>o o<Esc>
nnoremap <leader><leader>u O<Esc><CR>
"EXTRA =NEW WIRELESS SLIM KEYBOARD: Temp REMAPPING > AND <
" noremap Ö >
" noremap Ä <
" onoremap Ö >
" onoremap Ä <
" Quicker Key-Access for NumbersSeries Increment
nnoremap <leader>a <c-a>
nnoremap <leader>x <c-x>
vnoremap <leader>a g<c-a>
" Drs-style search-tags preamble --
inoremap <leader>u ___
cnoremap <leader>u ___


" Trim next blank
nnoremap <C-D> f x
" Forget-delete v-marked
vnoremap <C-D> "_d
" --
" Copy WORD to "+ **
nnoremap <leader>yy "+yiW
" Copy Whole Buffer to "+ **
nnoremap YY :%y+<CR>
" Scratch whole buffer
nnoremap D+ :%d+
nnoremap DD :%d

" Format
" Set text-formatting to phone-width = 'fmt35' / std=0
nnoremap g3 :set textwidth=35 nosi ai nojs spell shiftwidth=2<CR><CR>-gqap<CR>
nnoremap g2 :set textwidth=0<CR><CR>-A


" Buffers  __
"%% expanderar till aktiva filens mapp (= %:h) *****
" cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
"Next/Prev. buffer**
nnoremap <C-S-A-n> :bn<CR>
nnoremap <C-S-A-p> :bp<CR>
"Foldmethods Convenience Mappings
nnoremap <C-S-A-i> :set foldmethod=indent<CR>
nnoremap <C-S-A-m> :set foldmethod=marker<CR>
nnoremap <C-S-A-l> :ls<CR>
nnoremap <C-S-A-a> :args<CR>
""nnoremap <C-S-A-c> <C-^>
"------
nnoremap <A-c> :cd %:h<CR>:pwd<CR>
"nnoremap _sc :windo set scrollbind!<CR>
"nnoremap _nsc :windo set noscrollbind<CR>
"Grab a filename to +
nnoremap <C-S-A-f> :let @+=@%<CR>

" Copy WORD to "+ **
nnoremap <leader>yy "+yiW
" Copy Whole Buffer to "+ **
nnoremap YY :%y+<CR>
" Scratch whole buffer
nnoremap D+ :%d+
nnoremap DD :%d
" Pop buffer from buffer list
nnoremap <C-S-A-w> :bw<CR>

" ---- Jump in Change-List ----
nnoremap gg g;
nnoremap gG g,
nnoremap <A-PageUp> g;
nnoremap <A-PageDown> g,
" ---- Jump between Marks ----
nnoremap <S-PageUp> ['
nnoremap <S-PageDown> ]'
nnoremap <PageUp> [`
nnoremap <PageDown> ]`
nnoremap <leader>gg gg

" logical undo
nnoremap U <C-R>

" Custom movements  __
" line refocus
noremap tt zt
noremap TT zb
" end/start of line
noremap L $
noremap H 0
onoremap L $
onoremap H 0
noremap gL g_
noremap gH ^
onoremap gL g_
onoremap gH ^

nnoremap <leader><leader>o o<Esc>
nnoremap <leader><leader>u O<Esc><CR>

" Saving, Escaping ----
inoremap <leader>. <C-O>:up<CR>
nnoremap <leader>. :up<CR>
nnoremap <C-S-A-F1> :windo update<CR>
" Custom Escape-Mapping  __
noremap <leader>j <Esc>
inoremap <leader>j <Esc>
cnoremap <leader>j <Esc>
noremap <leader>J <Esc>
inoremap <leader>J <Esc>
cnoremap <leader>J <Esc>
" --
" inoremap <leader>ee <Esc>:up<CR>gi<CR>

" Searching / Substitute, Global  __
" Toggle ignorecase ***
nnoremap <leader>ic :set ic!<CR>
noremap <leader>ii /
noremap <leader>uu ?
nnoremap <leader>iv /\v
nnoremap <leader>uv ?\V
noremap <leader>ic /\c
noremap <leader>uc ?\c
" --
" Star and Hash only hlmarks word. Cont. search with 'n'
" + Reports number of matches
nnoremap * *N:%s///gn<CR>
nnoremap # #N:%s///gn<CR>
" --
nnoremap n nzz
nnoremap N Nzz
" --
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" ----
" Start Substitution-Line ***
nnoremap <leader>sa :%s///gc<Left><Left><Left>
nnoremap <leader>sj :.,$s///gc<Left><Left><Left>
nnoremap <leader>sv :'<,'>s///gc<Left><Left><Left>
  " 'count'
nnoremap <leader>sc :%s///gn<CR>
" :%s/\v^$//gc<Left><Left><Left><Left>
nnoremap <leader>g :'<,'>g/^$/<Left>
" Mata in \zs, \ze m.fl. c-mode teckenkomb.s ***
" \v^[^;]+;[^;]+;[^;]+$ m.fl. ****
cnoremap <leader>b \zs
cnoremap <leader>e \ze

"" 'RUN', Line etc = with Ext.Progr/Ex  ,ex/,ru
nnoremap <leader>ru ^yg_:!start <C-R>"<CR><CR>
nnoremap <leader>ex ^yg_:<C-R>"<CR><CR>
" nnoremap <leader>et mm:normal! H
" mt:normal! gg
" ^yg_:<C-R>"<CR><CR>'tzt'm
" ----
"" Run with external program (or use gx)
" nnoremap <leader>fi viWy:!firefox -new-tab <C-R>"<CR><CR>
" vnoremap <leader>fo y:!firefox -new-tab https://forvo.com/search/<C-R>"/<CR><CR>
"" open word in Babel (translate)
" nnoremap <leader>tr viwy:!firefox -new-tab http://sv.bab.la/lexikon/engelsk-svensk/<C-R>"<CR><CR>
" nnoremap <leader>et viwy:!firefox -new-tab http://www.etymonline.com/index.php?term=<C-R>"&allowed_in_frame=0<CR><CR>
nnoremap <leader>ac viWy:!start audacity <C-R>" &<CR><CR>
"" Image-program
" nnoremap <leader>ri viWy:!ristretto <C-R>" &<CR><CR>
"" Pdf-viewer
nnoremap <leader>fo viWy:!start foxit <C-R>" &<CR><CR>
nnoremap <leader>su viWy:!start sumatra <C-R>" &<CR><CR>
"" open with Inkscape
nnoremap <leader>ik viWy:!start inkscape <C-R>" &<CR><CR>
"" open with Gimp
nnoremap <leader>gi viWy:!start gimp <C-R>" &<CR><CR>
"" open with Vlc
nnoremap <leader>vc viWy:!start vlc <C-R>" &<CR><CR>
"" open with mpv
nnoremap <leader>mp viWy:!start mpv <C-R>" &<CR><CR>
"" open with audacious
nnoremap <leader>au viWy:!start audacious <C-R>" &<CR><CR>

"" open with gvim
nnoremap <leader>gm viWy:!start gvim <C-R>"<CR><CR>

"" open with timidity**** +TEMPOMARKERING
" nnoremap <leader>ti ^f/viW"tyWyiw:!timidity -T <C-R>" <C-R>t <CR><CR>
"" open with timidity** (=enkel)
" nnoremap <leader>tm yiW:!timidity -ia <C-R>"<CR><CR>
"" open with audacious***
" nnoremap <leader>au viWy:!audacious <C-R>" &<CR><CR>
nnoremap <leader>vc viWy:!start vlc <C-R>" &<CR><CR>
"" open with file-browser (explorer/freecommander)
" nnoremap <leader>th yiW:!thunar <C-R>" &<CR><CR>
" nnoremap <leader>tH $F/vBy:!thunar <C-R>" &<CR><CR>
"SÖK BOKSTAV/TECKEN I WIKTIONARY
" nnoremap <leader>tk vy:!firefox -new-tab https://en.wiktionary.org/wiki/<C-R>"<CR><CR>
" TODO: ADD PDFS + CONVERT TO USING SUMATRA READER[!!]
vnoremap <F9> y:!evince -l '<C-R>"' ~/Dropbox/rsc/Doks/Lang/Shorth/sv/rskrift.empire.pdf &<CR><CR>gv
vnoremap <F12> y:!evince -l '<C-R>"' ~/Empire/Doks/Lang/Shorth/en/stenogregg-dictionary.pdf &<CR><CR>gv
vnoremap <S-F12> y:!evince -l '<C-R>"' ~/Empire/Doks/Lang/Shorth/en/stenogregg-phrasebook.pdf &<CR><CR>gv


" TODO: Add 'Add file-path under cursor to buffer-list' 
" Windows, Splits, Tabs  __
" 'Vertical Ripple-Split'
nnoremap <C-W>V <C-W>v<C-W><C-W><C-F>
" Alt+PgUp/PgDn = Move Tab Left/Right in Tabs-List
nnoremap <C-S-PageUp> :tabmove -1<CR>
nnoremap <C-S-PageDown> :tabmove +1<CR>
nnoremap <leader>gf <C-W>gf
" Open (+activate) new tab with current file
nnoremap <leader>te :tabedit %<CR><C-L>
" Maximize Curr. Split (hor. and vert.)
nnoremap <A-M> <C-W>\|<C-W>_
" Equalize size of all splits
nnoremap <A-n> <C-w>=
" Move to next split + maximize
nnoremap <S-A-M> <C-W>w<C-W>\|<C-W>_


" File-System Utilities  __
" TODO: CONVERT TO PSHELL EQIVALENTS
"" GENERAL UTILITIES: RENAME
" nnoremap <leader>mv :!mv <C-R><C-A> <C-R><C-A>
"" GENERAL UTILITIES: REMOVE
" nnoremap <leader>rm :!rm <C-R><C-A>
"" pull latest mv-filename_tail ***
" nnoremap <leader>fmv ":pF~dF!
" gen.utils: create softlink to file under cursor (=in wdir) ***
"   tip: ringfinger on ,-leader *
" nnoremap <leader>lns :!ln -s <c-r><c-a><cr><cr>

" Cutting/Pasting (from/to system clipboards)  __
inoremap <leader>ii <C-R>+<CR>
nnoremap <leader>ia "*p
inoremap <leader>ia <C-R>*
" inoremap <leader>ia <C-R><C-R>*

" Macros/Actions  __
" Run latest run macro/ex-command **
noremap Q @@
" Run latest command/action, jump to next search-match + center
nnoremap ö .nzz
" Run latest macro/cli-command, jump to next search-match + center
nnoremap zö @@nzz
