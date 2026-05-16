" vim:fdm=marker:
" Linux Vimrc

" TODO: Add Leader-u as Redo
" TODO: ADD MODIFIED VIS-NAVIGATION (= v-right/left

" ??TODO: Add extended _vimrc
"
" ~/conf/_vimrc
" ~/Dropbox/config/.vimrc ~/conf/legacy.vimrc
" ~/conf/termux/.vimrc  # plugins-list
" ___FILESYSTEM_UTILS

let mapleader=","
let maplocalleader = "\\"
" TODO: VIM SPELL, VIM COLORS

set ignorecase
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
set directory=~/.vim//
set backupdir=~/.vim//

set nocompatible
filetype plugin indent on
syntax on
" + Change to filetype off when introducing Vundle

set scrolloff=0

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

" magnifichar =fontsize {{{
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
" nnoremap <C-MouseUp> :silent! let &guifont = substitute(&guifont, ':h\zs\d+', '=eval(submatch(0)-1)', '')<CR>
" nnoremap <C-MouseDown> :silent! let &guifont = substitute(&guifont,':h\zs\d+','=eval(submatch(0)+1)', '')<CR>
"" nnoremap <C-MouseUp> :silent! let &guifont = substitute(&guifont, ':h\zs\d\+', '\=eval(submatch(0)-1)', '')<CR>
"" nnoremap <C-MouseDown> :silent! let &guifont = substitute(&guifont,':h\zs\d\+','\=eval(submatch(0)+1)', '')<CR>

let g:init_fontsize = 14
let g:currFontSize = g:init_fontsize
" HOHOHO: PARSE OUT CURR.FONTSIZE FROM 'set guifont?'
exe 'set guifont=Monospace\ Regular\ ' . expand(g:currFontSize)
" Abe-tip Font:  https://tobiasjung.name/profont/
" ==== MagnifiChar ====
" TODO: ADD SETTING/SELECTING FONT ****
"          :set guifont=*  (=open font-selector)
"       ECHO/REPORT FONT
"          :set guifont?   (=show current guifont)
" TODO: POSSIBLY MERGING UPSIZE/DOWNSIZE INTO 'RESIZE' W. IF
function! UpsizeFont()
    let g:currFontSize += 1
    exe 'set guifont=Monospace\ Regular\ ' . expand(g:currFontSize)
    echo g:currFontSize
endfunction

function! DownsizeFont()
    let g:currFontSize -= 1
    exe 'set guifont=Monospace\ Regular\ ' . expand(g:currFontSize)
    echo g:currFontSize
endfunction

function! SetFontsize()
    let answer = input("Fontsize: ")
    if answer == ""
      exe 'set guifont=Monospace\ Regular\ ' . expand(g:currFontSize)
    else
      let g:currFontSize = answer
    endif

    exe 'set guifont=Monospace\ Regular\ ' . expand(g:currFontSize)
    echo g:currFontSize
endfunction

function! DefaultFontsize()
    let g:currFontSize = g:init_fontsize
    exe 'set guifont=Monospace\ Regular\ ' . expand(g:currFontSize)
    echom "Fontsize Reset to: " . g:currFontSize
endfunction

noremap <silent> <C-ScrollWheelUp> :call UpsizeFont()<CR>
noremap <silent> <C-ScrollWheelDown> :call DownsizeFont()<CR>
noremap <silent> <A-+> :call UpsizeFont()<CR>
noremap <silent> <A--> :call DownsizeFont()<CR>

nnoremap <silent> <A-=> :call SetFontsize()<CR>
nnoremap <silent> <A-?> :echo "Current Fontsize: " . g:currFontSize<CR>
nnoremap <silent> <A-0> :call DefaultFontsize()<CR>
"}}}

" TODO: SYNTAX TOGGLE:  ST (??)
"   nnoremap St :execute exists("g:syntax_on") ? 'syntax off' : 'syntax on'<CR>
"   command SyntaxToggle if exists("g:syntax_on") | syntax off | else | syntax enable | endif
"
" nnoremap <silent> St
"              \ : if exists("syntax_on") <BAR>
"              \    syntax off <BAR>
"              \ else <BAR>  
"              \    syntax enable <BAR>
"              \ endif<CR>   

nnoremap Sy<Space> :set syntax=
nnoremap So<Space> :source 
nnoremap Se<Space> :set 
" TODO: Toggle (+option/common option to toggle)
" nnoremap <leader>to 
"  / Pop-up menu with option/common option to toggle

" Folding  __
nnoremap <Space> za
" --------------
" Safe Toggle
function! SafeFoldToggle()
  try
    normal! za
  catch /^Vim\%((\a\+)\)\=:E490/
    normal! zj
  endtry
endfunction
" --------------
nnoremap <silent> <Space> :<C-u>call SafeFoldToggle()<CR>
" --
" fold marked lines
vnoremap <leader>fm <Esc>o<c-h><Esc>gvjo<Esc>A <Esc>gvzfzc
" produce fold from a line
nnoremap <leader>fa A <CR> <c-h><Esc>Vkzfzc

nnoremap <leader>co :colors <C-D>

" TODO: Convenience-mappings for 'thorny' characters
" --
nnoremap <leader>o <CR>
inoremap <leader>o <Esc>o
cnoremap <leader>o <CR>
nnoremap <leader><leader>o o<Esc>
nnoremap <leader><leader>u O<Esc><CR>
"EXTRA =NEW WIRELESS SLIM KEYBOARD: Temp REMAPPING > AND <
noremap Ö >
noremap Ä <
onoremap Ö >
onoremap Ä <
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

" Formatting __
" Set text-formatting to phone-width = 'fmt35' / std=0
nnoremap g3 :set textwidth=35 nosi ai nojs shiftwidth=2<CR><CR>-gqap<CR>
nnoremap g2 :set textwidth=0<CR><CR>-A
" Formatting, indentation (=paragraph etc)
nnoremap <C-H> >}
nnoremap <C-S-H> <}
nnoremap <C-G> gqap<CR>
vnoremap <C-G> gq<CR>


" Buffers  __
"%% expanderar till aktiva filens mapp (= %:h) *****
" cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
"Next/Prev. buffer**
nnoremap <PageDown> :bn<CR>
nnoremap <PageUp> :bp<CR>
nnoremap <Home> :bfirst<CR>
nnoremap <End> :ls<CR>
" --
nnoremap <C-S-A-n> :bn<CR>
nnoremap <C-S-A-p> :bp<CR>
"Foldmethods Convenience Mappings
nnoremap <C-S-A-i> :set foldmethod=indent<CR>
nnoremap <C-S-A-m> :set foldmethod=marker<CR>
nnoremap <C-S-A-l> :Buffers<CR>
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

" TODO: TRUE NORTH Navigation/NORTH STAR/COMPASS ROSE
" Navigation etc
" Changelist
nnoremap gg g;
nnoremap gG g,
nnoremap <A-Up> g;
nnoremap <A-Down> g,
" Change foldlevel
nnoremap <Right> zrzt:set fdl?<CR>
nnoremap <Left> zmzt:set fdl?<CR>
"" nnoremap <Right> zrzz:set fdl?<CR>
"" nnoremap <Left> zmzz:set fdl?<CR>
" Jump betw. Marks
nnoremap <C-Up> [`
nnoremap <C-Down> ]`
" nnoremap <Up> [`
" nnoremap <Down> ]`
" NEXT QUICKFIXLIST ENTRY
nnoremap <S-A-Right> :cn<CR>zO
nnoremap <S-A-Left> :cp<CR>zO
" --
nnoremap <leader>gg gg

" Move lines with Alt-Up/Down (Gedit-style)
" nnoremap <A-Up> ddkP
" nnoremap <A-Down> ddjP
  " vnoremap <A-Up> dkkpV`]
  " vnoremap <A-Down> dpV`]
  " nnoremap <C-A-Up> ddkPzc
  " nnoremap <C-A-Down> ddjPzc
" Simple Visual-Line Highlighter
" TODO: Perhaps remove <c-y> / <c-e>
"  = Not as important/helpful on Linux
vnoremap <Up> kok$
vnoremap <Down> joj$
vnoremap <ScrollWheelUp> kok$
vnoremap <ScrollWheelDown> joj$
" Navigate v-mark over sentences
vnoremap <Right> <Esc>)visozt<C-Y>
vnoremap <Left> <Esc>(ztviso<C-Y>
" Vmark navigate word right/left
vnoremap <A-Right> <Esc>/\v<[A-ZÅÄÖa-zåäö]<CR>:nohl<CR>viw
vnoremap <A-Left> <Esc>?\v<[A-ZÅÄÖa-zåäö]<CR>n:nohl<CR>viw


" logical undo
" nnoremap <Leader>u <C-R>
nnoremap U <C-R>

" Custom movements  __
" line refocus
noremap tt zt
noremap TT zb
" end/start of line
noremap L g_
noremap H ^
noremap gL $
noremap gH 0
onoremap L $
onoremap H 0
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
nnoremap <leader>ic :set ic!<CR>:set ic?<CR>
noremap <leader>ii /
noremap <leader>uu ?
nnoremap <leader>iv /\v
nnoremap <leader>uv ?\V
" noremap <leader>ic /\c
noremap <leader>uc ?\c
" --
" Star and Hash only hlmarks word. Cont. search with 'n'
" + Reports number of matches
nnoremap * *N:%s///gn<CR>
nnoremap # #N:%s///gn<CR>
" --
nnoremap n nzz
nnoremap N Nzz

" MULTIBUFFER SEARCH (NO-PLUGIN) ----
" +RESEARCH: SearchInRuntime, vim-indexed-search; vim-sneak, incsearch.vim
nnoremap <leader>b2 :argadd b*<CR>
" or set to b2a
nnoremap gs :vimgrep // ##<CR>
nnoremap <S-A-Up> :copen<CR>
" nnoremap gs :vimgrep // `ls -b`<CR>
nnoremap <silent> <leader>ö :cn<CR>
nnoremap <silent> <leader>ä :cp<CR>
" --
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" ----

" Start Substitution-Line *** {{{
nnoremap <leader>sa :%s///gc<Left><Left><Left>
nnoremap <leader>sj :.,$s///gc<Left><Left><Left>
nnoremap <leader>sv :'<,'>s///gc<Left><Left><Left>
  " 'count'
nnoremap <leader>sc :%s///gn<CR>
" :%s/\v^$//gc<Left><Left><Left><Left>
nnoremap <leader>g :'<,'>g/^$/<Left>
" }}}
" Mata in \zs, \ze m.fl. c-mode teckenkomb.s ***
" \v^[^;]+;[^;]+;[^;]+$ m.fl. ****
cnoremap <leader>b \zs
cnoremap <leader>e \ze

"" 'RUN', Line etc = with Ext.Progr/Ex  ,ex/,ru
nnoremap <leader>ru ^yg_:!<C-R>"<CR><CR>
nnoremap <leader>ex ^yg_:<C-R>"<CR><CR>
" nnoremap <leader>et mm:normal! H
" mt:normal! gg
" ^yg_:<C-R>"<CR><CR>'tzt'm
" ----
"" Run with external program (or use gx) {{{
" Generate qr-code for word/text/url under cursor + show with imagick
nnoremap <silent> <leader>qr yiW:!qrencode -o /tmp/qrcode.png '<C-R>"'<CR>\|:!magick display /tmp/qrcode.png &<CR><CR>
" Open with web-browser (Firefox)
nnoremap <silent> <leader>fx viWy:!firefox -new-tab <C-R>"<CR><CR>
" Open file with Tuxguitar
nnoremap <silent> <leader>tu yiW:!tuxguitar <C-R>" &<CR><CR>
" Open Video
nnoremap <leader>mp yiW:!mpv <C-R>" &<CR><CR>
nnoremap <leader>ma yiW:!mpv --no-video --term-osd-bar <C-R>"<CR>
" nnoremap <leader>ac viWy:!audacity <C-R>" &<CR><CR>
"" Image-program
nnoremap <leader>ri yiW:!ristretto <C-R>" &<CR><CR>
"" Pdf-viewer
nnoremap <leader>ev yiW:!evince <C-R>" &<CR><CR>
"" open with Inkscape
nnoremap <leader>ik yiW:!inkscape <C-R>" &<CR><CR>
"" open with Gimp
nnoremap <leader>gi yiW:!gimp <C-R>" &<CR><CR>
"" open with gvim
nnoremap <leader>gm yiW:!gvim <C-R>"<CR><CR>
"" open with Emacs
nnoremap <leader>em yiW:!emacs <C-R>" &<CR><CR>
"" open with timidity**** +TEMPOMARKERING
" nnoremap <leader>ti ^f/viW"tyWyiw:!timidity -T <C-R>" <C-R>t <CR><CR>
"" open with timidity** (=enkel)
" nnoremap <leader>tm yiW:!timidity -ia <C-R>"<CR><CR>
"" open with audacious***
nnoremap <leader>au viWy:!audacious <C-R>" &<CR><CR>
"" open with file-browser **
nnoremap <leader>th yiW:!thunar <C-R>" &<CR><CR>
nnoremap <leader>tH $F/vBy:!thunar <C-R>" &<CR><CR>
"SÖK BOKSTAV/TECKEN I WIKTIONARY
" nnoremap <leader>tk vy:!firefox -new-tab https://en.wiktionary.org/wiki/<C-R>"<CR><CR>

"}}}

" Windows, Splits, Tabs  __
" 'Vertical Ripple-Split'
nnoremap <c-w>V <c-w>v<c-w><c-w><c-f>
" Alt+PgUp/PgDn = Move Tab Left/Right in Tabs-List
nnoremap <C-S-PageUp> :tabmove -1<CR>
nnoremap <C-S-PageDown> :tabmove +1<CR>

" Maximize Active Split/Viewport Size
nnoremap <A-m> <C-w>\|<C-w>_
" Equalize Split/Viewport Sizes
nnoremap <A-n> <C-w>=
" Go to next split + maximize
nnoremap <S-A-m> <C-w>w<C-w>\|<C-w>_

" 'into source'
nnoremap <leader>is :tabe %<CR>gTgggf
" till vimplane: tabhanteringskommandon(***): tabe + tabshuffles
nnoremap <leader>te :tabe %<CR><C-L>

" ___FILESYSTEM_UTILS {{{
" navigate to directory of curr. open file
nnoremap cd :cd %:h<CR>
" File-System Utilities  __
" GENERAL UTILITIES: RENAME
nnoremap <leader>mv :!mv <C-R><C-A> <C-R><C-A>
" GENERAL UTILITIES: REMOVE
nnoremap <leader>rm :!rm <C-R><C-A>
" pull latest mv-filename_tail ***
" nnoremap <leader>fmv ":pF~dF!
" gen.utils: create softlink to file under cursor (=in wdir) ***
"   tip: ringfinger on ,-leader *
" nnoremap <leader>lns :!ln -s <c-r><c-a><cr><cr>
" nnoremap <leader>cda viWy:cd <C-R>"<CR> \| :pw<CR>
" nnoremap <leader>cdl viWy:lcd <C-R>"<CR> \| :pw<CR>
" " viWy:cd <C-R>"<CR><CR>
" 
" " SÄTT ALLT SOM FÖRRA MARKERING + FÖRBERED 'SKRIV FÖRRA MARKERING TILL
" " VALOUD-TEMP' ****** ('voicealoudreader')
" nnoremap <leader>aa ggVG<Esc><C-O><C-O>
" nnoremap <leader>va :'<,'>w! ~/Dropbox/aaa/0000_valoudreader-temp.txt
" nnoremap <leader>tva :%d<CR>"+p:w! ~/Dropbox/aaa/0000_valoudreader-temp.txt
" 
" " GENERAL UTILITIES: FIND
nnoremap <leader>fi :read !find -type f -name '<C-R><C-A>' 2>/dev/null;
    \ mpv ~/Dropbox/rsc/media/au/sfx/ding.sfx.mp3 > /dev/null 2>&1 &<CR><CR>
" " pull latest mv-filename_tail ***
" nnoremap <leader>fmv ":pF~dF!
" " GENERAL UTILITIES: COPY/COPY HERE
nnoremap <leader>cp :!cp <C-R><C-A> .
" nnoremap <leader>cph :!cp <C-R><C-A> .
" Create directory (including parent-dirs if necessary)
" for absolute file-path under cursor
" TODO: Maybe add <CR>at end of command
" nnoremap <Leader>mk viWF/y:!mkdir -p <C-R>"
nnoremap <Leader>mk yiW:!mkdir -p <C-R>"
" Echo human-readable file-size for file-path under cursor
nnoremap <Leader>fh :!ls -sh <C-R><C-A><CR>
" " ----
" " replace '.' with working directory  __
" nnoremap <leader>wd s<C-R>=getcwd()<CR><Esc>:s/\v^\/home\/[^/]+/\~/<CR>
" 
" " gen.utils: create softlink to file under cursor (=in wdir) ***
" "   tip: ringfinger on ,-leader *
" nnoremap <leader>lns :!ln -s <c-r><c-a><cr><cr>
" " cp (target =vim_wdir, t.ex. ~/gdrive/kodhubben_drive/scriptlegacy-blueleg )
" " ___editingrightnow
" "" nnoremap <leader>cp yiW:cp <C-R>" 
" 
" " TODO TODO TODO: Kunna skapa txtfil i temp av öppna textfilen
" "                   (=främst från tags--g-filtrering) =temp
" "                   +fildatum-randomnumber el stigande tal i .rc-fil
" nnoremap <leader>t :w /tmp/temp<C-D>

" }}}

" Cutting/Pasting (from/to system clipboards)  __
inoremap <leader>ii <C-R>+<CR>
nnoremap <leader>ia "*p
inoremap <leader>ia <C-R>*
  " inoremap <leader>ia <C-R><C-R>*

" INSERT-MODE COMPLETION ----
inoremap <leader><leader> <c-n>
" --
inoremap <a-up> <c-p>
inoremap <a-down> <c-n>

inoremap <leader>ä <c-p>
inoremap <leader>xf <c-x><c-f>
inoremap <leader>xl <c-x><c-l><c-n>
inoremap <leader>ö <c-x><c-n>
inoremap <c-,> <c-x><c-n>
" inoremap <c-s-,> <c-x><c-p>
" inoremap <leader>xn <c-x><c-n>
inoremap <leader>pn <c-p><c-n>

" Macros/Actions  __
" Run latest run macro **
noremap Q @@
" Run latest command/action, jump to next search-match + center
nnoremap ö .nzz
" Run latest macro/cli-command, jump to next search-match + center
nnoremap zö @@nzz


""" ==== ==== LANG-TOOLS ==== ====
" Search Char/Word(s) in Wiktionary
vnoremap <silent> <leader>wk y:!firefox -new-tab https://en.wiktionary.org/wiki/<C-R>"<CR><CR>
"  ##    FORVO-MAP  ,fo    glaube uisce  Pronounciation Dictionary
nnoremap <silent> <leader>fo yiw:!firefox -new-tab https://forvo.com/search/<C-R>"/<CR><CR>
nnoremap <silent> <leader>et yiw:!firefox -new-tab http://www.etymonline.com/index.php?term=<C-R>"&allowed_in_frame=0<CR><CR>

" TRANSLATE-SHELL MAPS
" -b = brief, -t = target languages
"
" Setting default translation-languages
let g:target_langs = "en+sv+da+is+fr+de+es+ru+uk+ar+fa"
" Toggle specific language mode (English + Swedish)
nnoremap <leader>la :let g:target_langs = "en+sv"<CR>
" Reset to full set
nnoremap <leader>ld :let g:target_langs = "en+sv+da+is+fr+de+es+ru+uk+ar+fa"<CR>

" Translate sentence
nnoremap <leader>ts yis:r !trans -b -t <C-r>=g:target_langs<CR> "<C-r>0"<CR>

" translate full
nnoremap <silent> <leader>tr yiw:r !trans -t <C-r>=g:target_langs<CR> "<C-r>0"<CR>
inoremap <silent> <leader>tr <ESC>yiw:r !trans -t <C-r>=g:target_langs<CR> "<C-r>0"<CR>
vnoremap <silent> <leader>tr y:r !trans -t <C-r>=g:target_langs<CR> "<C-r>0"<CR>

" translate brief
nnoremap <silent> <leader>tb yiw:r !trans -b -t <C-r>=g:target_langs<CR> "<C-r>0"<CR>
inoremap <silent> <leader>tb <ESC>yiw:r !trans -b -t <C-r>=g:target_langs<CR> "<C-r>0"<CR>
vnoremap <silent> <leader>tb y:r !trans -b -t <C-r>=g:target_langs<CR> "<C-r>0"<CR>

" translate to 'quicklangs' (en+sv)
nnoremap <silent> <leader>tt yiw:r !trans -b -t en+sv "<C-r>0"<CR>
"" inoremap <silent> <leader>tt <ESC>:Trans -brief<CR>
inoremap <silent> <leader>tt <ESC>yiw:r !trans -b -t en+sv "<C-r>0"<CR>
vnoremap <silent> <leader>tt y:r !trans -b -t en+sv "<C-r>0"<CR>

nnoremap <leader>tl y:r !trans -b -t 

" TODO: OPEN V-MARKED TEXT IN NEW GVIM-WINDOW
"       (WITH RL OR NORL APPLIED + GREATLY ENLARGED)  TODO TODO
" [= Primary Use: Displaying Arabic, Farsi etc ]
" [- Secondary Use: Display Cuneiform etc (=Needs Great Enlargement) ]

" OPEN NEW GVIM-WIN ON TINY CHARACTERS
" (arabic/farsi      with rl set
" egyp, cuneif, etc  without rl set
vnoremap <silent> <leader>or "+y:!gvim
    \ -c 'set guifont=Monospace\ Regular\ 70'
    \ -c 'set rl'
    \ -c 'normal "+p'<CR><CR>
vnoremap <silent> <leader>ol "+y:!gvim
    \ -c 'set guifont=Monospace\ Regular\ 60'
    \ -c 'normal "+p'<CR><CR>
" SPACING OUT (=for unicode-fonts otherwise too cramped
"                 i.e. hieroglyphs, cuneiform, etc)
vnoremap <silent> <leader>ob "+y:!gvim
    \ -c 'set guifont=Monospace\ Regular\ 60'
    \ -c 'normal "+p'
    \ -c 's/[^ ]\zs\ze[^ ]/  /g'<CR><CR>
"
" NEW/TODO: SWITCH BETWEEN RL/NORL
noremap <silent> <C-S-Right> :set rl <bar> set guifont=Monospace\ Regular\ 60<CR>
noremap <silent> <C-S-Left> :set norl <bar> set guifont=Monospace\ Regular\ 14<CR>


" Highlight [ ]-lines: " \[.\].*
" TODO TODO TODO = Integrate
" ========================================
" ~/SyncThing/scratch/shorth-tools.vim
" ========================================
" [X] SEARCH MARKED WORD                                        pdf
"       (v) S1 S2 S3
"       (v) Ss/Sr Sg Sp
vnoremap <silent> Ss y:!evince -l '<C-R>"' ~/Dropbox/rsc/Doks/Lang/Shorth/sv/rskrift.empire.pdf &<CR>gv
vnoremap <silent> Sg y:!evince -l '<C-R>"' ~/Empire/Doks/Lang/Shorth/en/stenogregg-dictionary.pdf &<CR>gv
vnoremap <silent> Sp y:!evince -l '<C-R>"' ~/Empire/Doks/Lang/Shorth/en/stenogregg-phrasebook.pdf &<CR>gv

" [x] Search Longest Match                                      txt
"       (v) Search longest match
vnoremap Sle y:vimgrep /<C-R>"/
    \ ~/Dropbox/rsc/data/lists/ref/shorth/words-phrases_en-gregg.list.txt
    \ <bar> copen<CR>
"            ^-- cwindow
" <bar> resize<CR>
"
"" " Change CWD to the directory containing your file before running the search
"" vnoremap Sls y:lcd ~/Dropbox/rsc/data/lists/ref/shorth<CR>
""     \ :execute 'gvimgrep /\\V\C' . escape(@", '\') . '/ words-phrases_sv-rapidskr.list.txt' <bar> copen<CR>

" vnoremap Sls y:gvimgrep /<C-R>"/
vnoremap Sls y:vimgrep! /<C-R>"/
    \ ~/Dropbox/rsc/data/lists/ref/shorth/words-phrases_sv-rapidskr.list.txt
    \ <bar> copen
" <bar> resize<CR>
"
"   vimgrep /@/ % | copen | resize
"               |
"             en-file / sv-file
" TODO:
" - Not change file
" ----
" - Cut path of target, or (if possible) cut path + filename[!!]
"  - maybe use location-list
" - increase size of cwindow to (minimum) 1/3rd of screenheight (or so)

"   TODO: COPY TO NEW FILES + STRIP OUT 'ABBREV + Left'-PART == NO INDENTATION
" [X] OPEN SHORTH-REFS                                          txt
"           Sr/SR  Srp[=pdf] Srt[=txt]
nnoremap <silent> Srp :!evince ~/Dropbox/rsc/Doks/Lang/Shorth/sv/rskrift.empire.pdf
            \ ~/Empire/Doks/Lang/Shorth/en/stenogregg-dictionary.pdf
            \ ~/Empire/Doks/Lang/Shorth/en/stenogregg-phrasebook.pdf
            \ ~/Empire/Doks/Lang/Shorth/ir/gregg-irish.pdf &<CR><CR>

nnoremap <silent> Srt :execute "vertical botright split
        \ ~/Dropbox/rsc/data/lists/ref/shorth/rapidskr.txt" .
        \ "\<Bar> rightbelow split
        \ ~/Dropbox/rsc/data/lists/ref/shorth/gregg.txt"<CR><C-W>w

" TODO: MAY WANT TO IMPLEMENT SQLITE-SOLUTION IN THE FUTURE
" [ ] INSERT KEYSTRING AFTER NORMAL(=Fulltext) WORD(S)   ____   txt
" TODO: PROBABLY WANT TO PUT IN FUNCTION (=CAN BE RERUN FOR 'RIPPLE-FETCH')
"       (v) Ki (??) / KI  Kis/Kie
" TODO: ABILITY TO MOVE FROM UNSAVED ORIG-FILE[!!!]
" TODO: INSERT TRY-CATCH MECHANISM (=SILENTLY GO BACK IF NO MATCH FOUND)
vnoremap Kis y`>mm:normal! H<CR>mT
    \ :hide edit ~/Dropbox/rsc/data/lists/ref/shorth/rapidskr.txt<CR>
    \ zi/\v<C-R>".{-}  \zs.{-}\ze  <CR>
    \ ygn
    \ 'Tzt`ma[]<Esc>i<C-R>"<Esc>
    \ W:up<CR>

vnoremap Kie y`>mm:normal! H<CR>mT
    \ :hide edit ~/Dropbox/rsc/data/lists/ref/shorth/gregg.txt<CR>
    \ zi/___refstart<CR>
    \ /\v  <C-R>"  \zs.{-}\ze  <CR>
    \ ygn
    \ 'Tzt`ma[]<Esc>i<C-R>"<Esc>
    \ W:up<CR>

" Temporary Hack: Back (if no match found)
nnoremap <leader>aa 'Tzt`mW

" # [] = Official  [[]] = Proposed/Custom
"
"    - set mark at: end of search-word/words + in line at top of win
"   - Copy word/words to be searched for
"   --
"   - Open reffile (with :edit)
"   - search for: search-words  \zsREST
" TODO: MAY WANT TO PUT [] AND [[]] AROUND KEYSTRING-ENTRIES
"   - Copy
"   - Pull back to orig-file
"    - set back prev. win top-line as top
"   - Insert '[]' at end of word + insert found key-string
"
" TODO: REPLACE '[' AND ']' IN GREGGREF-STRINGS WITH '{' AND '}'
"   (I.E. OPENS POSSIBILITY OF USING [ AND [[ DELIMITER
"    FOR 'CANONICAL' VS 'CUSTOM' KEYSTRING)

" HACK: REFACTOR OUT ORIGINAL CODE TO FUNCTION
" [ ]! Ripple-Fetch key-string for v-marked, +=v-mark next word  (v) F4/9
vnoremap <F9> y`>mm:normal! H<CR>mT
    \ :e ~/Dropbox/rsc/data/lists/ref/shorth/rapidskr.txt<CR>
    \ zi/\v<C-R>".{-}  \zs.{-}\ze  <CR>
    \ ygn
    \ 'Tzt`ma[]<Esc>i<C-R>"<Esc>
    \ W:up<CR>viw

vnoremap <F12> y`>mm:normal! H<CR>mT
    \ :e ~/Dropbox/rsc/data/lists/ref/shorth/gregg.txt<CR>
    \ zi/___refstart<CR>
    \ /\v  <C-R>"  \zs.{-}\ze  <CR>
    \ ygn
    \ 'Tzt`ma[]<Esc>i<C-R>"<Esc>
    \ W:up<CR>viw

" [ ] SEARCH BY KEYSTRING (i.e. [\'här'] / ^\'här'$ = hur)      txt / pdf
"     [e.g. 'Is keystring taken?']
"   '  \zsPattern'
"       (v) Kss/Kse

" [ ] PRACTICE-DECKS:                                           txt
"       image  2  word
"                   image-link hidden inside fold
"                   (+command: open image hidden in fold via termux-api)
"       key    2  word
"                   easy: use text2text from txt ref-file
"       word   2  image
"                   bare image-link (+open image via termux-api)
"       word   2  key
"                   easy: use text2text from txt ref-file
"   ~/dropbox-legacy/ankiimages-steno_rskrift/

" < > <<SEARCH WORDS/ABBREVS-(=txt)LIST (IN SPLIT-WINDOW)       txt>>
" < > ** Give suggestion for Sh-Grob to learn (basis: word often written when writing text in a text-document on the computer)
" [ ] [LANGS ABBREVS-LIST (FEDERATED)]                          txt
"    = Fetch from main Shorth Index-list[!?]
" ~/dropbox-legacy/engstenoref_alla-engelska-förkortningar.txt
" ~/dropbox-legacy/tysteno--REF_förkortningar.txt ___abbrevs=german
" ~/Dropbox/shorthdoks.comp/frasteno.fr.txt ___abbrevs=french
" ~/dropbox-legacy/frasteno--REF_förkortningar.txt ___abbrevs=french
"
"
"       ~/Dropbox/config/vim/short.sv.rskrift.snippets.vim
"       ~/Dropbox/config/vim/short.en.gregg.snippets.vim


" Cleaning, Filtering, Post Ocr-Extraction etc MATA IN REFERENSDOKS SIDNUMMER
" I TEXTFIL + INCREM. ****** ('put/push')
nnoremap <leader>ppu "pp<C-A>"pyyo<Esc>kzt
nnoremap <leader>pu "pp<C-A>"pyyo<Esc>kzt:up<CR>


" VANKI-TOOLS ----
" Highlight custom vanki-tags (à la T@, N@T@n@, etc)
nnoremap <silent> <leader>hi /\v(%(<([a-zA-Z])\2{0,4})\@)+<CR>
" Set quick/default tags with space (=reading through text
"   + navigating with right/left for vmark sentence highlighting)
vnoremap <Space> <Esc>iN@Q@<Esc>:up<CR>gv

" "Dashing"
" 'Dashify' loose word-couplings globally in a file:
"   "pull request" --> "pull-request"
command! -nargs=0 GlobalWordcoupler rviminfo! $HOME/conf/global_wordcoupler.viminfo

inoremap <leader>ti <Esc>:r !date +"\%Y-\%m-\%d"<CR>A 
" inoremap <leader>ti <C-o>:r !date +"\%Y-\%m-\%d"<CR>

" Calculate numeric expression à la '3+4/5'
" (note: Vim computing-register uses strict left2right-evaluation
"   = force order with parentheses)
inoremap <leader>ca <Esc>viWyA=<C-R>=<C-R>"<CR>

