" __

" ___ptools_basic
"
" ___editingrightnow    ___activate
"   augroup filetype_x
"       autocmd!
"       autocmd FileType x setlocal commentstring=%\ %s
"       autocmd FileType x setlocal shiftwidth=2 softtabstop=2 tabstop=2
"       autocmd FileType x iabbrev <buffer> mku ^\markup { \teeny "x" }
"   augroup END
" ___0000  persinställn startamedprogram
" ___plugins
" ___colorschemes  (maps + rekommenderade)      abbot*, cobalt2**
let mapleader = ","
"let maplocalleader = "-"
let maplocalleader = "\\"

" TODO TODO 2023+: ===============================================
" WHEN CHANGING SCREEN (=FOR SUBSTITUTIONS), PUT NEXT SUBST-LINE
"   COUPLE OF LINES BELOW TOP OF SCREEN  ************
" ================================================================

" ************************** 2023
" NEW IDEA (TODO TODO TODO): i_<Ctrl-H> = c-n c-p  #='expand + null'
" **************************
" Simple Visualstar-Maps
"  +'First Run' only highlights. Continue with 'n' (****)
" "Search" for text without moving cursor:
" :let @/ = "stuff"  [*****]
"vnoremap * y/<C-R>"<CR>N
"nnoremap * yiw:sil let @/=@@<CR>:sil set hlsearch<CR>
"vnoremap g* y:let @/=@@<CR>:sil set hlsearch<CR>
"vnoremap * y/\<<C-R>"\><CR>N
""vnoremap # y?<C-R>"<CR>N
"nnoremap # yiw:sil let @?=@@<CR>:sil set hlsearch<CR>
"vnoremap g# y:let @?=@@<CR>
"vnoremap # y?\<<C-R>"\><CR>N

" NEW TODO(??|!): sa_+ / sa_-  =  zr / zm

" NEW (=VAR. ON  insmode: ,ii):  ,p  =paste "+   w.out(!) Newline

" #split merged column paragraphs
" nnoremap <F5> xd$2}-o<C-R>"<Esc><C-O>

"  @h(ms2sec): f Bs<C-R>"*3600<Esc>f:r+wct:<C-R>"*60<Esc>f:r+ciW<C-R>=<C-R>"
<Esc>

" NEW 2021!!  SET 'CS-E/Y' TO LARGER NUM (EG. 5 C-E/Y ETC)
"   (+perhaps if inputs num (eg. '5') =sets cs-e/y to that val. ****!!)

" RDS-UTIL NY: OMVANDLA  TILL PDFREF-SIDNUMMER (********/!!) 2020++
"   @a: /
A----<Esc>nx,pu   (el. ev ,ppu
" OPEN PREVIOUS/NEXT REF-PDF_PAGE *********!!
nnoremap <leader>pf ?evince -p
^yg_:!<C-R>"
V
" nnoremap <leader>opp ?evince -p \d
,ruzz
"  ?evince -p \d
,ruzz   ,opp ,opn
nnoremap <leader>pn /evince -p
^yg_:!<C-R>"

V
" nnoremap <leader>opn /evince -p \d
,ruzz

" EV. NY!!  CS-, (=till senaste/förra editpos. (+ev. Insert)) (****)

" SAMLING MAKRON MM:
" ÖVERSÄTT(=OMVANDLA PVERKTL=TABSEP LISTA) TILL VIMANKI (=VIKN(!/**))
" @b(?):  $F    vgelc
<Esc>-,fazo

dg_-i    <C-R>" <Esc>
dd
"       (=skapad när översatte emacs-pverktl till vimanki-version) (***/(!))

" ="Förtydl." av 'n'
" noremap (el. nnoremap o vnoremap) n <Esc>nV      el. <Esc>nzzV / nzz
" EV. NY NOV. 2019 ****
" 'cycle back through vis. marked text' (=saved history for gv
"  =kunna gå tillbaks till tidigare markeringar, inte bara exakt förra) *****

" PLOCKA UT TEXT FR. TUTORIALS-POINTS_ARTIKLAR--UTILS *****
"   d/Next Page/+1      #=kör 4 kommandona som makro för att rensa txt plockat
"   /Previous Page/-1   #   fr. t-point m. c-a *********
"   dG
"   o

<Esc>
"
"
"   TODO TODO TODO
"   NY!: 'CUT + ASSIGN RDSUTIL-MACRO SAVED AS TEXTSTRING IN DOK'*********
"       ev keys: =',qc'     #=macro-cut
"   OBS, SE UPP! REG. R ÄR FÖR NÄRVARANDE BLOCKAD (=SUDDAS NÄR KÖR MAKROT)
"   utkast (=ev senare ändra till att inte blockera 'register r' mm
nnoremap <leader>qc ^lv"ryf:Wyg_:let @<C-R>r=@"


"   NY: Indrag upp till märket 'm + Hoppa tillbaks ****
nnoremap <leader>im >'m']
" Indent-Shortcuts
" + IDEA: TRY/TEST USING C-H/CS-H [****(!!)]
nnoremap ><CR> >iB
nnoremap <<CR> <iB
" TODO: Find Next '{' + Run <iB
"  + Maybe Add :nohls
" nnoremap <Tab> /{<CR><iB
nnoremap <Tab> >iB
nnoremap <S-Tab> >ib
nnoremap <C-S-Tab> >i]
nnoremap ]<CR> >}
nnoremap [<CR> <}
nnoremap <C-H> >}
nnoremap <C-S-H> <}
nnoremap <C-G> gqap<CR>
vnoremap <C-G> gq<CR>
" TODO: Check what works best ='}' / from first '{' (Etc)
nnoremap <<BS> =iB
" + MAY WANT TO TEST USING TAB, S-TAB, ETC __ __ *****[!!(!!)]
" nnoremap ><BS> /{<CR>:nohlsearch<CR>=iB

" suggestions
" Suggest Spelling-Corrections for Word
nnoremap <C-S> z=
nnoremap <C-A-A> z=

"
" RDS-UTILS:  JOIN LINES ENDING IN '-' + NEW SPLIT ****
"   @j:  Jh2xf r
" CUT HAND-EDITED VLC TIMESTAMP (eg. 14:38 = '14*60+38') + CONVERT TO SECONDS ************
"   @z:  "yyiWvEc<C-R>=<C-R>y
<Esc>     #OBS: behöver handjusteras efteråt (!%¤%¤)
"    CUT LINE AT CURSOR, AND RUN FROM COMMANDLINE ***************************
"   @a/r(esource_run) ***********: ^"zyg_:<C-R>z
"
" wallpapers  @p: ,papj
"
" EV NY TODO 2019 MAJ-JUNI: LÄGG TILL NYTT KIT (F2-F6 EL. LIKN)
"   FÖR ATT KUNNA HANTERA OCH PROCESSA TEXTRADER/FRÅGEPAR TILL ANKILIKA FRÅGOR
"   (=utifrån RSteno/GreggSteno-projekten *******
"   ***********************************     foldmarkers on/off      randomize
"   splitlines on/off
"   plocka ner/upp klar fråga =vikning till sektion 2 (=avklarade)/1 (att öva
"    på igen) ******
"
" EV SHORTCUT 'TOGGLE VIM OPTION' (=T.EX. F3 EL LIKN.)
"   =PROMPT "OPTION TO TOGGLE: "    +ange t.ex. 'number'Enter ***************

" ---- Jump in Change-List ----
nnoremap gg g; | nnoremap gG g,
nnoremap <A-PageUp> g; | nnoremap <A-PageDown> g,
" ---- Jump between Marks ----
nnoremap <S-PageUp> [' | nnoremap <S-PageDown> ]'
nnoremap <PageUp> [` | nnoremap <PageDown> ]`
nnoremap <leader>gg gg

" Drag word backward/forward
nnoremap <A-Left> dawF ;pge
nnoremap <A-Right> dawf pge

" ev: Y = "+y
"  Yp = "+p


" EV. NY 2020+ FÖR SPRÅK MM: Klipp tecknet(=ev. m. v-mode) under Markören
"       +sök efter med '/' ***** ,ac ('a character')
"       IDÉ: ren ,ac för nnoremap + ,ac v-markerade för vnoremap *****/!!
" UNICODE =c-v u =????

" EV ESC TILL 'qj' ISTÄLLET ***
"  FLER/MODULÄRA :S/:G-BITAR (T.EX. \v, <> mm) ********
" ev: Sätta `[ och `] till lättare sekv. ****
" TODO TODO: ÄNDRA NAMNEN PÅ C-SCHEMES, SÅ SLIPPER FÅ FELMEDDELANDENA ****
" FLER AVANC. VIMSCRIPT 2019: BERÄKNA VLC-TID***  (INKL. KONSTANT FÖR
"                                           OCH KOMPENSERA FÖR 'FALLOFF-FACTOR ******)
"   C-E TILL X3 EL LIKN. *
"
"           Maps för ToggleOptions (t.ex. Number)** **
"   idé: <Home>(+C, S  el likn)  =Öppna Vex i ~/Dropbox (el. Scripts*** (+visa bara
"   mappar i så fall (??))
"       i_c-u  -  upcase word(*)
" ev nnoremap \ ,   #kunna ha kvar/behålla 'reverse ;' för f-kommandot ***
" EV NY MAP ***** (EL LIKN.): BYT TILL NÄSTA COL.SCHEME MED C-Vklick / C-Hklick, CS-MhjRull  el likn **********
"    +EV CA-+/- FÖR NÄSTA/FÖRRA ******
"   #OBS!: KOLLA AV NAMN FÖR FELAKTIGA COLSCHEMES/COLSCHEMES SOM GER FELAKTIGA
"   NAMN (+DEN SOM INTE FUNKAR #####)
"
" ,e/,u till vä/hö i insertmode
" ,O -- OPEN CURSOR-FILE IN VSPLIT-NETRW *****
" ,H / ,Hg - (HELP/HELPGREP MARKERADE ***
"       +går 'M' att använda till något bra/intressant(??) 8)
" ,q =,o+spara *****
"NY IDÉ(!!): STORA 'Q' (EL ,q) KÖR @@ =SENASTE INSPELADE/KÖRDA REGISTER-MAKROT
" *******
"   inoremap <Left>  <C-G>U<Left>       #=pilt. ej bryta undo ****
"   inoremap <Right> <C-G>U<Right>   (o. c-vä/hö till 'bryt undochain'(***))
"
"     :map! <C-F> <Esc>gUiw`]a      #write word lcase + upcase **

" recenter pverktl(!) at top of screen(*)
" 'pzmzozt  #=sätt märke p(!) vid topp på pverktl. (+klipp vä. till t.ex. @a)

"   enggregg_reflists (när sökt ord/ordkomb. bakåt =Öppna pdf-sida (=nästa pdfref-länk upp) för ordet(**)):
"       @a:  :let @z=@/
?evince
,ru
?<C-R>z
         (+GÖR VAR. FÖR RSTENO =M. \t\tOrd / Ord )
"   =GENERALISERA TILL TEXTFIL M. PDFFILS-LÄNKAR (=ÖPPNA PDF NÄR SÖKT I
"   TEXTEN************/!!!!!!!)

" TODO/ATT GÖRA MM {{{
"
" GÅ TILL NÄSTA EJ AVKOMMENTERADE RAD
"
" EV NY FÖR LILYPOND MM (=MARKERA STYCKE, SPARA UT SOM FIL + DRA IN/ERSÄTT
" BLOCKET M DESS LÄNK=PATH|FILNAMN ****    EL, BARA MARKERA BLOCK + FÖRBERED
" FÖR C-RAD FÖR ATT SPARA UT (=SOM SOURCE MM) ***
"

" Ful-indentering innan löst tab/retabs mm indentinställningar smidigt
"   mellan 4 och 2 spaceindrag ********
" @m(ore) och @l(ess)  (dra in/dra tillbaks resten på paragraph 2 blanksteg)
" }k^I  <Esc>^
" V]zkk:s/^//n

" Sätta fontstorlek a-+ och a-- + c-mushjul_upp/ner ****
"command! Bigger  :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
"command! Smaller :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')


"       :iabbrev @@    steve@stevelosh.com
"       :iabbrev ccopy Copyright 2013 Steve Losh, all rights reserved.

" QUICKENTER UNICODE *******
" inoremap <leader>u <C-V>u

" TODO TODO ****:
"   SÄTTA SPELL (+LANG, DICT, O SPELLFILER MM) ****
"
"   SHORTCUTS FÖR C-X-LÄGENA ******** =completion
inoremap <leader><leader> <c-n>
" Eller =BYT TILL CTRL+LEADER ***** !!!!!
" IDEA: a-up / a-down = c-p / c-n
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
"   +ev 'dra ihop rader'    #=om inte anv. 'snippets' för 
"                           #  boilerplate mm/olikn.

" SENASTE MAKRON
"  Vänd bak och fram på ;-separerad text
"    f;"bd0l"cD"cPf;"bp
"  Räknare för rds-screenshots(!) direkt med Gimp istället för Shutter *******
"    "+yiw        #fil/fönster m texten '0001' ******

" TODO: TA BORT ALLA BLANKSTEG I V-MARKERADE ORD-OMRÅDET ***** ,BBD??



" VANLIGA SÖKNINGAR ATT GÖRA PÅ GOO MM
"   _ AND SIMILAR SOFTWARE/ALTERNATIVES TO    SLANT
"   BEST (AND RECOMMENDED) BOOKS ABOUT _

" DÖP OM FIL UNDER MARKÖREN
" DÖP OM FIL UNDER MARKÖREN: HÄMTA INFO FRÅN GITARR-TAG I SLUTET ****** (+CR
"   för att bekräfta)

" NY!: EXTRAHERA ALLA 'ANKITAGS' FRÅN ANKISOURCE_*-FIL *******

" MÅSTE SLUTTESTAS + SÄTTAS ********     'link current'  mf='myfile'
nnoremap <leader>lc :!ln -s ~/<C-R>% ~/Dropbox/0000_minfil.txt
"<CR><CR>
nnoremap <leader>lc :cd ~/Dropbox \| !ln -s ~/<C-R>% ~/Dropbox/0000_minfil.txt
"<CR><CR>

" TODO: FLER CMAPS FÖR SUBSTITUTION/GLOBAL =2 HELA MÖNSTER FÖR S||G + \ZS MM
"

" blandade klipp o utkast
"   @c: fcre        #gå till nästa 'c' + byt ut mot 'e'

" NY =PLOCKA IN O ANVÄND FÖR KOLL OCH GENOMKIK AV LISTA MM *******
" (=i detta fallet mixologi-rdsen 2018) *****
"   nnoremap <leader>o :!mv <C-R><C-A> ~/z_rds/mixol/invert/<CR><CR>jzt


" SKRIV/LADDA VIMINFO FÖR ÖPPNA TXT/INDEXFILEN ,wi/,ri
" ,ws/,rs  (=Ev Samma för Sessions)
" HOPPA TILL SPLIT + MAXIMERA **** csa-w/s/o/m


" *********************
"    https://stackoverflow.com/questions/2176532/how-to-map-caps-lock-key-in-vim

"   (EV) FOLDS RUNT VARJE MAP (=SÅ GÅR ATT FLYTTA MED EN ca-MOVE
"   EV FUNKTIONSNAMN RUNT VARJE FUNKTIONALITET
"       DIREKT TILLBAKS TILL DOKUMENTET*****(=starta external-mapsen)

" Ev Redig. Map: Sätt så ,th funkar för dirs OCH filnamn (=tar t.o.m. sista '/')

" Sätt Wallpaper ***  =länkarna finns i fluxskript-indexet *****
nnoremap <leader>pap :!fbsetbg -f <C-R><C-A><CR><CR>

"TODO: Skriva ut direkt från sökv.länk i txt-dok/lista  SE TIMIDITY FÖR
" 'N OFPAGES'
" :!lp -n 4 <C-R><C-A><CR><CR>



" TODO: ÖPPNA ALLA LÄNKAR I MARKERADE SEKTIONEN I RISTR/THUMBN-FOTOPROGRAM
" ************************************************************************
""      display 'vid:*.png'  =PLOCKA ALLA FILNAMNEN (I FIL??) + VISA M DISPLAY
"           =EV: 'ALLA SOM ÄR MARKERADE MED 'XX' EFTER *****

" KOLLA LEDIGA VIMMAPKEYS: lediga-vimmapkeys.bash

" TODO TODO: Extrahera (o spara i Dropbox-vimmappen  ++STUDERA o dokumentera
" koden) Flip-to-next-Colorscheme Vim  =SÅ KAN PLOCKA IN TILL DROIDVIM-RC:N
" MM********

" TODO: LÄGG TILL TILL VIMRC = SÄTT ALLTID FONT AUTOMATISKT TILL 10 PUNKTER
"         +SÄTT SÅ CTRL+MUSHJUL UPP/NER ÖKAR/MINSKAR FONTSTORLEK **********
" https://stackoverflow.com/questions/7225057/use-mouse-scroll-wheel-in-vim
" http://vim.1045645.n5.nabble.com/How-to-determine-current-font-in-use-td1181670.html

"             öppnanästabildlänk flyttabildlänk raderabildlänksfil
"             TODO: _ till nästa blanka rad     #t.ex. indrag, sudda ; till
"             nästa ligger ett indrag bak (=slut på nuvarande indentnivå)
"             TODO: mata in blank rad nedan/ovan (=utan att gå till
"             insertmode)
"             TODO: Lägg till bash.vim(=plugin för att redigera bash) som
"             Vundle-länk istället
"             TODO: Klipp ut ordet under markören + kör som colorscheme
"             EV TODO: Ev sätta autocommands för att köra föredragna
"             colorschemes för olika filtyper, t.ex. abbot el likn för
"             vimscript
"
"             TODO: Plocka tail=filnamnet i filadress + kör ____ (=?????)
"             TODO: Dumpa alla makron inspelade i den här sessionen ******
" }}}

set modeline
" fasta grundinställn.            #inkl. colorschemes {{{

colorscheme ron
" colorscheme tomorrownight-bright
" colorscheme evening

" }}}
" aktivera plugins, indent mm     #rope, vundle mm {{{

set nocompatible
filetype off

set runtimepath+=/usr/share/lilypond/2.22.1/vim/

"Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" 'Better JSON for Vim'  https://github.com/elzr/vim-json
" 'vim sparql syntax'    https://github.com/vim-scripts/sparql.vim?tab=readme-ov-file
" 'vim rdf'              https://github.com/niklasl/vim-rdf
" 'vim razor'            https://github.com/jlcrochet/vim-razor
" ___plugins  #put all plugins to be installed below next line
"   https://github.com/VundleVim/Vundle.vim  #=help o install-instruktioner ****
"
  " TODO TODO [=OBSOLETE WITH POLYGLOT??]
Plugin 'WolfgangMehner/bash-support'
    " TODO TODO [=OBSOLETE WITH POLYGLOT??]
    " Plugin 'zigford/vim-powershell'
    " Plugin 'vim-scripts/Windows-PowerShell-Syntax-Plugin'
    " Plugin 'ollykel/v-vim'
    " Plugin 'elixir-editors/vim-elixir'
    " Plugin 'preservim/vim-markdown'
    " Plugin 'udalov/kotlin-vim'
Plugin 'sheerun/vim-polyglot'
    "=adds syntax like kotlin, v, nim, " etc etc

" TODO =????
Plugin 'srcery-colors/srcery-vim'
"Plugin 'flazz/vim-colorschemes'
" https://github.com/vim-autoformat/vim-autoformat =TODO
"
"  (=Needed with Polyglot??)
" TODO TODO: https://github.com/MaxMEllon/vim-jsx-pretty
" TODO TODO: https://github.com/mlaursen/vim-react-snippets
Plugin 'mattn/emmet-vim'
" TODO https://github.com/reasonml-editor/vim-reason-plus
"Plugin 'artur-shaik/vim-javacomplete2'
"http://vim-latex.sourceforge.net/
" http://vim-latex.sourceforge.net/documentation/latex-suite-quickstart/
" http://vim-latex.sourceforge.net/documentation/latex-suite/
Plugin 'vim-latex/vim-latex'
Plugin 'instant-markdown/vim-instant-markdown'
" https://github.com/WolfgangMehner/bash-support
"   https://github.com/WolfgangMehner/bash-support/blob/master/doc/bashsupport.txt
"   https://www.tecmint.com/use-vim-as-bash-ide-using-bash-support-in-linux/
"   ***
" ALE[!!]
" https://github.com/Valloric/YouCompleteMe  #se framförallt 'User Guide'
" Plugin 'Valloric/YouCompleteMe'
"   https://github.com/SirVer/ultisnips
" Plugin 'vim-scripts/SyntaxComplete'
Plugin 'jeetsukumaran/vim-indentwise'
" TODO: AUTOINDENT (=för inklistrat mm)
Plugin 'tpope/vim-commentary'
Plugin 'vimoutliner/vimoutliner'
Plugin 'luisbarrancos/osl-syntax'
Plugin 'neo4j-contrib/cypher-vim-syntax'
" Plugin 'vim-scripts/sparql.vim'
"Plugin 'Omer/vim-sparql'
"Plugin 'vim-scripts/sparql.vim'
Plugin 'vimwiki/vimwiki'
"  +See more: https://github.com/vimwiki/vimwiki
Plugin 'godlygeek/tabular'
"     https://vimawesome.com/plugin/commentary-vim
"   gc: gcc gcap v+gc :1,10Commentary :g/Todo/Commentary
"     kollade commentstring i vimscript:    :set commentstrings=\"%s
"     https://github.com/tpope/vim-commentary/issues/67
" UPCOMING:
" BASH-MODE(github)
" MATCHIT(xml mm) **
"   https://github.com/mileszs/ack.vim#can-i-use-ag-the-silver-searcher-with-this
"   https://github.com/mileszs/ack.vim/blob/master/doc/ack.txt
" Plugin 'rescript-lang/vim-rescript'
Plugin 'luisjure/csound-vim'
Plugin 'kunstmusik/csound-repl'
Plugin 'supercollider/scvim'
"   https://github.com/VSCodeVim/Vim
"   https://github.com/ervandew/eclim
"   https://github.com/JetBrains/ideavim
Plugin 'echuraev/translate-shell.vim'
Plugin 'vim-scripts/mercury.vim'
"   https://github.com/LhKipp/nvim-nu
Plugin 'LhKipp/nvim-nu'
Plugin 'hylang/vim-hy'
Plugin 'wsdjeg/vim-ring'
Plugin 'edwinb/idris2-vim'
" Plugin 'kalafut/vim-taskjuggler'
"   https://github.com/feduxorg-attic/vim-taskjuggler/blob/master/README.md  " tj3
" Plugin 'wsdjeg/vim-ring'
call vundle#end()

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
syntax on

" https://github.com/mattn/emmet-vim/issues/255
let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall

runtime! ftplugin/man.vim

" if has("autocmd") && exists("+omnifunc")
"   autocmd Filetype *
"   \ if &omnifunc == "" |
"   \   setlocal omnifunc=syntaxcomplete#Complete |
"   \ endif
" endif

" }}}
" .  plugin manager               #vundle/pathogen {{{
" }}}
" programmerings-inställn.        #tabstop, indent mm {{{

" size of a hard tabstop
set tabstop=4
" size of an "indent"
set shiftwidth=4
" a combination of spaces and tabs are used to simulate tab stops at a width
"   other than the (hard)tabstop
set softtabstop=4
set expandtab

nnoremap <leader>pw :badd ~/Dropbox/prwords/words_<C-D>

" }}}
" FILETYPE/BUFLOCAL MAPPINGS {{{

" List Filetypes (and their names) supported in Vim *****
" + :setfiletype <c-d>
nnoremap <leader>ft :!ls /usr/share/vim/vim*/syntax <bar> sed 's/\.vim//' <bar> gvim -<CR>

" filetypes:
"  EV TODO: path o suffixesadd  = varje filtyp kan ha mappar som ställs in som def.paths **

" http://vimcasts.org/episodes/meet-ultisnips/
"  AUCOMMANDBLOCKS O FILETYPE-SNIPPETS **** {{{
"     indent (m.fl. inställn ***)
"       prwords-fillistor m enkla ord =funktionsnamn mm ****
"    vardef
"    LOOPS  test
"    FUNCTION
"     list/dict/vector/obj
"    kodord/nyckelord/kommando-ord
"    CLASS
"    TRYEXCEPT
"     gui
"    -----
"    CODE/TEXT-OBJECTS:  #oppending vim ****
" }}}
" äv. expandtab till ts/indent-definitions??
"   https://stackoverflow.com/questions/1562633/setting-vim-whitespace-preferences-by-filetype
"   ****

" ANG. KOMPLETT RAD FÖR SOFTTABSTOP, EXPANDTAB MM MM: practical_vim-s170 *****

" java kotlin                   CB--
" filetype:java {{{

" augroup filetype_java
"   autocmd!
"   autocmd FileType java setlocal shiftwidth=2 softtabstop=2 tabstop=2
"   " autocmd FileType php iabbrev <buffer> IFF IFE
"   " autocmd FileType php 
"   " nnoremap <localleader>gl a\glissando<ESC>Ea^\markup { \teeny "S" }<ESC>
"   " autocmd FileType lilypond nnoremap <buffer> <localleader>t :!rake test
"   "   =run/compile php **
" augroup END

" }}}
"       c__compl cpp                CB--
"       c# f#                       CB-
" javascript__compl             CB--
" filetype:js {{{

augroup filetype_javascript
    autocmd!
    autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
augroup END

"   " autocmd FileType php iabbrev <buffer> IFF IFE
"   " autocmd FileType php 
"   " nnoremap <localleader>gl a\glissando<ESC>Ea^\markup { \teeny "S" }<ESC>
"   " autocmd FileType lilypond nnoremap <buffer> <localleader>t :!rake test

" }}}
" php__compl                    CB--
" filetype:php {{{

augroup filetype_php
    autocmd!
    autocmd FileType php setlocal shiftwidth=2 softtabstop=2 tabstop=2
    " autocmd FileType php iabbrev <buffer> IFF IFE
    " autocmd FileType php 
    " nnoremap <localleader>gl a\glissando<ESC>Ea^\markup { \teeny "S" }<ESC>
    " autocmd FileType lilypond nnoremap <buffer> <localleader>t :!rake test
    "   =run/compile php **
augroup END

" }}}
" python__compl(inkl py3)       CB--
" filetype:python {{{

" augroup filetype_python
"   autocmd!
"   autocmd FileType python setlocal shiftwidth=2 softtabstop=2 tabstop=2
"   " autocmd FileType php iabbrev <buffer> IFF IFE
"   " autocmd FileType php 
"   " nnoremap <localleader>gl a\glissando<ESC>Ea^\markup { \teeny "S" }<ESC>
"   " autocmd FileType lilypond nnoremap <buffer> <localleader>t :!rake test
"   "   =run/compile php **
" augroup END

" }}}
" lua                           CB-
" filetype:lua {{{

" augroup filetype_lua
"   autocmd!
"   autocmd FileType lua setlocal shiftwidth=2 softtabstop=2 tabstop=2
"   " autocmd FileType php iabbrev <buffer> IFF IFE
"   " autocmd FileType php 
"   " nnoremap <localleader>gl a\glissando<ESC>Ea^\markup { \teeny "S" }<ESC>
"   " autocmd FileType lilypond nnoremap <buffer> <localleader>t :!rake test
"   "   =run/compile php **
" augroup END

" }}}
" ------------
"   bash                            CB
"       indent=4
" clojure__compl                CB
" guilescheme
" filetype:lilypond {{{

" ___editingrightnow

" TILLFOGA EV: KEYCHARS +='\.- {}:;'  ? ****
augroup filetype_lilypond
    autocmd!
    autocmd FileType lilypond setlocal commentstring=%\ %s
    autocmd FileType lilypond setlocal shiftwidth=2 softtabstop=2 tabstop=2
    autocmd FileType lilypond iabbrev <buffer> mku ^\markup { \teeny "x" }
    " autocmd FileType lilypond 
    " nnoremap <localleader>gl a\glissando<ESC>Ea^\markup { \teeny "S" }<ESC>
augroup END
    " autocmd FileType lilypond setlocal commentstring=%%s
    " autocmd FileType lilypond :iabbrev <buffer> mku ^\markup { \teeny "x" }
    " autocmd FileType lilypond nnoremap <buffer> <localleader>t :!rake test

" ---- set/runcompile ----
" scrollbind
" pdf-fil för ly-filen
"  (klipp ut filnamnet)
" ###### (klipp ut senaste sök)
" KLISTRA IN TAKTNUMMER
" klistra in ordet 'takt' över varje ly-kodrad
" ins. slurs            #iabrev
" ins. glissando        #iabrev
" ins. markup           #iabrev
" ins. vh-hammeron      #iabrev
" ins. deadnote         #iabrev
" -----
" dela def.gruppering 8delar
" sudda strängsiffror/angivelser
" sudda markup-markeringar      #+i v-markering
" sudda ack.diagr./fing.charts
" -----
" nästa notgrupp ***    #op-pend??(****)
" förra strängsiffra
" nästa strängsiffra
" -------
" MEL.DB. RENDER SCORE (from source) ****

" .old *** {{{

" :noremap <A-p> :!evince %:r:r:r.pdf &<CR>
"  KLISTRA IN TAKTNUMMER {{{
"  klistra in nedan i t.ex. register a + kör @a och sen @@ så många gånger som
"  behövs: =Sätter in taktnummer
"    ==trick för att få in raden i körande vim:
"     1.Markera raden  2.Kör :let @a=@* i aktuella instansen*******
" 
" --------------------
"  /^\s*\(<\|r[0-9]\+\)
" O<Esc>I% takt <C-R>=i
" <Esc>:let i=i+1
" j0
"  =  v-markering + ': (sudda '<,'>) + let @a=@*'
"  +  let i=1
"  }}}
" Klistra in ordet 'takt' över varje lilypondkodrad*** {{{
" /\v^\s*(<|r)
" O% takt
" %s/^\s\+\ze% takt//
" 
" %let i=1\|normal O| let i+=1
"  }}}
" LÄGG TILL SLURS MELLAN TVÅ TONER {{{
"   (markera från+till slutsiffran i första o sista gruppen m visualmode)
" vnoremap _sl o<ESC>a(<ESC>gvo<ESC> a)<ESC>     =gör med E och a istället
"  }}}
" Splitta defaultgruppering för åttondelar {{{
" Ea[<Esc>Ea]<Esc>$gEa]<Esc>gEa[<Esc>/^\s\+<
" k
"  }}}
" Sudda alla strängangivelser i markerade området {{{
" vnoremap KEYS '<,'>s/\\\d//gc
"  }}}
" Klipp bort alla strängangivelser ur fil {{{
" :%s/\v([[:alpha:]]{1}|('|,)+)\zs-\d//gc
"  }}}
" Ta bort alla markup-markeringar {{{
" %s/\v\^\\markup.{-}}//gc
"  }}}
" Remove markupspecs. in visualmarkering
" vnoremap m :s/\v\^\\markup.{-}}//gc<CR>
" Klipp bort Fingeringcharts {{{
" 
"  }}}
" Sök/gå till nästa notgrupp {{{
" />\d\{1,2}
" ------ }}}
" Gå till förra strängangivelsen {{{
" 
"  }}}
" Gå till nästa strängangivelse {{{
" /\\\d/e
"  }}}
" NYA UTKASTET= KÖR 'MELDB KOMPL' PÅ MEL (EV MED ACK) FR.  RAD MED MELODIKOD I GVIM *****
" MELDB-MAPPINGEN**** =markör på ly-kod för melodi och ack + generera {{{
" Leadsheet = melodi + ackord: visual+_m
"   " melodikod2pdfsvg_leadsheet.bash
"   " melodikod2pdfsvg_onlymelriffbass.bash
"   " melodikod2pdfsvg_onlymeldigitheads.bash
" och visa pdf med noter och ack********
" testkod rad1: cis'4 d' e' fis'
" testkod rad2: c1
" !.clearmelodydbdir-intmp.bash \|
" 1. produce leadsheat, from two lines (mel and chords)
" vnoremap _m :write! /tmp/melodikodlytillpdfsvg-source.ly \| !melodikod2pdfsvg_leadsheet.bash /tmp/melodikodlytillpdfsvg-source.ly<CR>
"  _r _b
"  _a
"  }}}
" 2. produce melody/riff/comp/bassline sheetmusic, from one line {{{
" (mel/riff/comp/bassline)
" vnoremap _o :write! /tmp/Melody.ly \| !melodikod2pdfsvg_onlymelriffbass.bash /tmp/Melody.ly<CR>
"  }}}
"  . {{{
"   \key c \major    \time 2/4    c'8 d'  e' r | c' d'  e' r | e'8. g'16  f'8 e' | f' e'  d' r    |    b c'  d' r | b c'  d' r | d'8. f'16  e'8 d' | e' d'  c' r  
"  }}}
"  ???? {{{
" vnoremap __ :let @+=@* \| edit
" 
" :'<,'>write! 
"  ~/Dropbox/onlymel-dheads_source.ly
"  ~/scripts/melodikod2pdfsvg_onlymel-digitheads.bash 
"  ~/Dropbox/onlymel-dheads_source.ly
" 
" vnoremap __ :'<,'>write! /tmp/onlymel-dheads_source.ly \| !melodikod2pdfsvg_onlymel-digitheads.bash /tmp/onlymel-dheads_source.ly<CR>
"   http://lilypond.org/doc/v2.19/Documentation/notation/note-heads
"   }}}

" }}}

" }}}
" r                             CB
" svg ***
" filetype:html {{{
"   html__compl

augroup filetype_html
    autocmd!
    autocmd FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2
augroup END

" }}}
" filetype:css {{{
"   html__compl

augroup filetype_css
    autocmd!
    autocmd FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2
augroup END

" }}}
" css__compl
"       latex
" csound scollider
" lisp newlisp
" vimscript
" xml__compl


" sql__compl                    cb
" awk
" taskjuggler
" prolog mercury                cb
" nyquist
"  haml
" obasic
" vb lotus
" qt qml
" perl
" wolfram

" }}}
" öppna/starta fr. mall           #mall/skel/boilpl {{{

"insert hashbang
inoremap <leader>at #!/bin/bash<CR>

" }}}
" put/infoga               #timestamp mm {{{

" Timestamp i i-mode: TODO: Tillf. dag, skiljestreck mm *******
"   %Y-%m-%d %a//%A, %H:%M, %:::z//%Z       (%G)/%V
"   2018-04-29 Sun(,) 10:45, +0200//EDT     23(veckonummer)
inoremap <leader>ti <C-o>:r !date +"\%Y-\%m-\%d"<CR>

" MATA IN REFERENSDOKS SIDNUMMER I TEXTFIL + INCREM. ****** ('put/push')
"nnoremap <leader>pu o<Esc>"pp<C-A>"pyyo<Esc>.
nnoremap <leader>ppu "pp<C-A>"pyyo<Esc>kzt
nnoremap <leader>pu "pp<C-A>"pyyo<Esc>kzt:up<CR>

" }}}

" personl. prefs grundred.        spell; EV TODO: FLYTTA BUF.KOMM. TILL ÖPPNA/SPARA MM {{{
" ___ptools_basic
"       =BUFS/DOKUMENTHANTERING
"Colorschemes  {{{
"___colorschemes
"  http://www.vim.org/scripts/script.php?script_id=3247  alex-nya
"   =shadesofamber
nnoremap <S-A-o> :colorscheme solarized<CR>
nnoremap <S-A-a> :set background=dark<CR>
nnoremap <S-A-i> :set background=light<CR>
nnoremap <S-A-d> :colorscheme desert<CR>
nnoremap <S-A-r> :colorscheme ron<CR>
"nnoremap <S-A-m> :colorscheme murphy<CR>
nnoremap <S-A-p> :colorscheme peachpuff<CR>
nnoremap <S-A-k> :colorscheme darkblue<CR>
nnoremap <S-A-l> :colorscheme default<CR>
"---
"?:noremap <S-A-s> :colorscheme slate<CR>
"?:noremap <S-A-b> :colorscheme blue<CR>
""""  NYIDÉ: Lista colorschemes ************ + Lista colorschemes i
""""+   Drop-mappen colorschemes
""""  Gå till förra Colorscheme
"  }}}
"COLORSCHEMES LIST+RECOMM.S {{{
"___colorschemes
"    ~/.vim/colors/
"    ~/Dropbox/vim/colors/
"    background= light dark
"
"    java:
"        solarized **
"       darkblue
"       blue / bluedrake
"       industry *** / vo_dark**** / koehler
"       desert * / slate****  / cobalt / monochrome *   onedark (lilagrå*)
"        abbot (brun)
"        celticsaway (grön)
"        eva *** (röd)
"       pablo *** / torte / lettuce *** #intress.markering_strängar***
"       atom/oceandeep / elflord ****  / neonwave #kommentarer*
"       elda *(babyblue)*
"       ----
"       delek
"       shine
"
"       abbot.vim
"       atom.vim  m.fl. (hämtade från _)
"
"    __Foldedtext-sbdrs
"    __vimscript
"    __Java
"    __lilypond
"    __python
"    __javascr
"    __Bash
"    __Gitarrelevskr
"       _blå_
"       _brun_
"       _lila_
"       _grön_
"       _röd_
"       _vit_
"       _Dark_
"       _svart_
"
"
"  atom   
"       solarized.vim   __vimscript
"       ron ****
"       elflord ***   __vimscript  (??)
"       default   __lilypond __Gitarrelevskr _vit_
"       desert   __lilypond __Bash
"       darkblue
"       evening
"       murphy
"       peachpuff
"       slate   _svart_
"------------------------------------
"  abbot ****   _brun_ __vimscript-BEST
"  base16-ateliersulphurpool
"  birdsofparadise   _brun_
"       blue
"  bluedrake
"  c64   _blå_ _lila_
"  celticsaway   _grön_
"  cobalt2  __vimscript __nvim **** __BEST-1.0
"  colorsbox-greenish   __vimscript __nvim __BEST-1.1 ******
"  colorsbox-stblue **   __vimscript
"  darkslategray    __Java _grön_
"       delek
"  donbass
"  elda __vimscript __nvim *****
"  elmindreda
"  eva   _röd_  __vimscript __nvim __ev **
"  herokudoc-gvim
"       industry ***
"  japanesque
"  khaki
"       koehler ***
"  lettuce  __vimscript __nvim __ev ***
"  magicwb
"  monochrome   __vimscript __nvim ****     #enkel snygg =ev
"       morning
"  murphy   __vimscript __nvim ***      #lite gröna strängar, men ok 8)
"  navajo
"  neonwave __vimscript __nvim **** #mkt turkos o Rosa ***
"  oceandeep   _blå_    __vimscript __nvim __BEST-2 ****=turkos-gul-grå***
"  onedark  __vimscript __nvim __BEST-3 *****
"  otaku    __vimscript __nvim  =helt ok(=std. vitt+turkos) ***
"       pablo   __vimscript __nvim  =snygg enkel (m.blå+gul) ***
"  pink
"  rockets
"  ron  __vimscript __nvim ***
"  scooby   __vimscript __nvim ***  (=subdued salmon+dark purple)
"       shine
"  smpl
"  sweater-lightpeach
"  tomorrownight-blue   _blå_   __vimscript __nvim ****  (=bra/samma=TEXT***)
"  tomorrownight-bright   __vimscript   __vimscript __nvim *** __BEST-1.2 ****
"       torte   __vimscript __nvim **
"  turbo    __vimscript __nvim **
"  vertlaiton   __vimscript __nvim **  (=kul, illgrön*)
"       vo_dark   __vimscript   __vimscript __nvim ****  __BEST-2.1 (amber for
"                                                                   nvim ****)
"       vo_light
"  warriors-away
"       zellner
"  zenburn   _brun_ _grön_  __vimscript __nvim **** __BEST-3.1 =halvljus****
"
" }}}

" set guifont=Monospace\ Regular\ 12

set path+=**
set wildmenu

nnoremap <leader>co :colors <C-D>

" Star and Hash only hlmarks word. Cont. search with 'n'
" + Reports number of matches
nnoremap * *N:%s///gn<CR>
nnoremap # #N:%s///gn<CR>

" HACK: Change to nzzh / Nzzh
nnoremap n nzzh | nnoremap N Nzz

nnoremap U <C-R>

" ucase, lcase and ccase completed word
inoremap <leader>au <Esc>gUaWea, 
inoremap <leader>eu <Esc>gUaWea
" inoremap <C-u> <Esc>gUiwA
"inoremap <C-l>
" inoremap <C-c> <Esc>bgUlA

" Run latest run macro ******
noremap Q @@
" Run latest command/action, jump to next search-match + center
nnoremap ö .nzz
" Run latest macro/cli-command, jump to next search-match + center
nnoremap zö @@nzz

" Toggle ignorecase ***
nnoremap <leader>ic :set ic!<CR>

" Cut next blank
nnoremap <C-D> f x
" Forget-delete v-marked
vnoremap <C-D> "_d

" Copy WORD to "+ **
nnoremap <leader>yy "+yiW
" Copy Whole Buffer to "+ **
nnoremap YY :%y+<CR>
" Scratch whole buffer
nnoremap D+ :%d+
nnoremap DD :%d
" Pop buffer from buffer list
nnoremap <C-S-A-w> :bw<CR>

" inoremap <C-S-e>   ##DEPREC. (=maps kan inte skilja på c-e och cs-e(!!))
" inoremap <C-S-y> 
" IDÉ: LÄGG OM ZT TILL TT (=FÖR ATT SNABBT SÄTTA RAD TILL TOPP)*****
noremap tt zt
noremap TT zb

noremap L $
noremap H 0
onoremap L $
onoremap H 0

noremap gL g_
noremap gH ^
onoremap gL g_    
onoremap gH ^

noremap <leader>L L
noremap <leader>H H

" https://stackoverflow.com/questions/1636297/how-to-change-the-folder-path-for-swp-files-in-vim/1636944
set directory=~/.vim//
set backupdir=~/.vim//

"ev kniviga tecken:
" !"#$%/()?+~  =CA 10 ST.
"               =LÄGG OM TILL ALTGR-VÄ.TECKEN + ALT-HÖ.TECKEN I I-MODE ******
"   plus
"   citationstecken ***
"   lika med
"   tilde
"   asterisk
"   tak(cirkumflex)
"    PIL-TANGENTERNA ****
"   frågetecken
"   procent
"   dollar
"   slash(snedstreck)
"
"   noll
"    BACKSPACE

"ev byt till 'e'
nnoremap <leader>o <CR> | inoremap <leader>o <Esc>o | cnoremap <leader>o <CR>
nnoremap <leader><leader>o o<Esc> | nnoremap <leader><leader>u O<Esc><CR>
nnoremap <leader><leader>m J<CR>
" nnoremap <leader>u -
" inoremap <leader>u -
" cnoremap <leader>u -
inoremap <leader>ee <Esc>:up<CR>gi<CR>
inoremap <leader>EE <Esc>:up<CR>gi<CR>
" nnoremap <leader>ee '
" inoremap <leader>ee '
" cnoremap <leader>ee '

" TODO TODO: BYT PLATS: ,o = Esc, ,j = Ent ****

" nnoremap <leader>h f 
noremap <leader>j <Esc>
inoremap <leader>j <Esc>
cnoremap <leader>j <Esc>
noremap <leader>J <Esc>
inoremap <leader>J <Esc>
cnoremap <leader>J <Esc>

inoremap <leader>k <Esc>:up<CR>
inoremap <leader>K <Esc>:up<CR>

nnoremap <leader>h <BS>
inoremap <leader>h <BS>
cnoremap <leader>h <BS>

" inoremap <leader>e -
" cnoremap <leader>e -

noremap <leader>ii /
noremap <leader>uu ?
noremap <leader>II //<CR>
noremap <leader>UU ??<CR>
nnoremap <leader>iv /\v
nnoremap <leader>uv ?\V

" *****: Ev Braces {} till ,x ,b el likn ****
" nnoremap <leader>xx {
" nnoremap <leader>bb }
" inoremap <leader>xx {
" inoremap <leader>bb }

" nnoremap <leader>i <Tab>
" inoremap <leader>i <Tab>
" cnoremap <leader>i <Tab>

"Drs-preferences
" NYA KOMMANDE FÖRSLAG: Esc till qj, och Save(nu F1) till CAPSLOCK** + q(=spela
"       in) till Q
"DEFINIERA LEADER   (=ligger överst  =,)
" noremap \ ,   #sätta ,=reversesearch ch till något annat, dock kanske inte \
" ***  (=stäng av blinkande markör)  ***
set guicursor+=a:blinkon0
set showcmd
set hlsearch
"nnoremap <leader>u :setlocal number!<cr><cr>
set incsearch
" set ic
set smartindent

"TODO: EV NYA TEXTOBJECT/OPERATORS ***
" il = 'inner line'  =FRÅN FÖRSTA GRAFISKA TECKEN (=[^#]) TILL SISTA PÅ RAD **

"Sätta $ till L och 0 till H (+hi o low till nåt annat)
"Sätta(?) "_d till D  ev *****
"
":nnoremap <Leader>o o<ESC>k
"
":inoremap <c-u> <esc>gUawA #********* =upcase ord
":nnoremap <c-u> gUaw   #********* =upcase ord

"sätt så c-p och c-n filtrerar cline-hist, precis som upp/ner ***
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"%% expanderar till aktiva filens mapp (= %:h) *****
" cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"Nolla senaste sök-highlighting (=bygger på clear = c-l) 
" nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
"Ev spara o anv.  ' :%s//\=@0/g ' som ett verktyg  (=ersätter senaste sökmönstret m mönstret i reg a  ****

"Ev bind & till :&& *******
" nnoremap & :&&<CR>
" xnoremap & :&&<CR>
" noremap <Leader>n nzz
" noremap <Leader>N Nzz
"Ev g; till bättre map(??) = sätt ev till ,p

"ev inlärningsmaps för att inte använda pilt. för att flytta runt ++senare
"+remap pilt. till andra användbara saker
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>

" =make vim treat numbers as decimal (=c-a på 007 ger 008 ***) {{{
set nrformats=
" }}}

"NY 2017:  buffer delete till vimmap  c-a-s-D
" increase commandline history to 200 slots (def.=50)
"set history=200
"
"Next/Prev. buffer**
nnoremap <C-S-A-n> :bn<CR>
nnoremap <C-S-A-p> :bp<CR>
"Foldmethods Convenience Mappings
nnoremap <C-S-A-i> :set foldmethod=indent<CR>
nnoremap <C-S-A-m> :set foldmethod=marker<CR>
nnoremap <C-S-A-l> :ls<CR>
nnoremap <C-S-A-c> <C-^>
"------
nnoremap <A-c> :cd %:h<CR>:pwd<CR>
nnoremap _sc :windo set scrollbind!<CR>
"nnoremap _nsc :windo set noscrollbind<CR>
nnoremap <C-S-A-a> :args<CR>
"Grab a filename to +
nnoremap <C-S-A-f> :let @+=@%<CR>

" }}}
" EXTRA =NEW WIRELESS SLIM KEYBOARD: Temp REMAPPING > AND <
noremap Ö >
noremap Ä <
onoremap Ö >
onoremap Ä <

" 'Vertical Ripple-Split'
nnoremap <c-w>V <c-w>v<c-w><c-w><c-f>
let g:user_emmet_leader_key='<C-H>'
"       :-history win           c-m     (????)
"       /-history win           c-s     (????)
inoremap <leader>ii <C-R>+
nnoremap <leader>ia "*p
inoremap <leader>ia <C-R>*
" TODO: Maybe add '[ (=back to start of input)
"         if paste is longer than 1 line(!)
inoremap <leader>aa <Esc>V'[J
inoremap <leader>iv <C-R>*
nnoremap <leader>yo "+yiW

" Set text-formatting to phone-width = 'fmt35' / std=0
nnoremap g3 :set textwidth=35 nosi ai nojs spell shiftwidth=2<CR><CR>-gqap<CR>
nnoremap g2 :set textwidth=0<CR><CR>-A

" Alt+PgUp/PgDn = Move Tab Left/Right in Tabs-List
nnoremap <C-S-PageUp> :tabmove -1<CR> | nnoremap <C-S-PageDown> :tabmove +1<CR>

" Quicker Key-Access for NumbersSeries Increment
nnoremap <leader>a <c-a>
nnoremap <leader>x <c-x>
vnoremap <leader>a g<c-a>

" öppna/spara/uppdat. doks        #vimrc m.fl. abs. basdoks {{{

nnoremap <leader>vs :so $MYVIMRC<CR>

" NEW 2024+: USE ö/öö/öä FOR SAVING ETC
" nnoremap ö :up<CR>
inoremap öö <Esc>:up<CR>
inoremap öä <Esc>
vnoremap öä <Esc>
inoremap <leader>. <C-O>:up<CR>
nnoremap <leader>. :up<CR>
nnoremap <leader>k :up<CR>
inoremap <F1> <C-O>:up<CR>
nnoremap <F1> :up<CR>
nnoremap ä :up<CR>
nnoremap <C-S-A-F1> :windo update<CR>
nnoremap <C-S-A-F2> :!cp -f ~/Dropbox/.vimrc ~/.vimrc
"noremap <A-v> :!cp -i ~/Dropbox/.vimrc ~/.vimrc<CR>
" --------
nnoremap <C-S-A-k> :mksession! ~/Dropbox/planeringsdok.vimsession<CR>
nnoremap <C-S-A-F3> :wviminfo! ~/Dropbox/planeringsdok.viminfo<CR>

" }}}
    "NY 2020 START: ,iv im.svg  #starta fil på kommandoraden m. inkview (****)
" KÖR M PROGR./HEMSIDA           'ÖPPNA LÄNK M DICT/FIREFOX' MM {{{
"   =Öppna/Starta/Kör/Processa länk/adress/fil m/genom program/hemsida

" 'RUN LINE', with Ext.Progr/Ex  ,ex/,ru
nnoremap <leader>ru ^yg_:!<C-R>"<CR><CR>
nnoremap <leader>ex ^yg_:<C-R>"<CR><CR>
nnoremap <leader>et mm:normal! H
mt:normal! gg
^yg_:<C-R>"<CR><CR>'tzt'm
nnoremap <leader>eb mm:normal! H
mt'm?\v^\s*\zsset 
^yg_:!<C-R>"<CR><CR>'tzt'm
nnoremap <leader>tx mmVH<Esc>mz1G^yg_:<C-R>"<CR><CR>'zzt'm

" OPEN LEXILOGOS {LANG/SYMBOLS} KEYBOARD ********
"   https://www.lexilogos.com/keyboard/index.htm
"   ev nya maps: lxa(latin mm) lxb(kin/jap)  
" LATEST: öppna filen i Splitedit (=så kan se koderna)  +=kvar i b-list
" även när stängt filen *******     +kör c-x c-l för compl.     (swedish.htm /
" japanese.php)
nnoremap <leader>lxl :belowright split ~/Dropbox/lexilogoskeyboard_keywords.txt<CR>
nnoremap <leader>lxo viWy:!firefox -new-tab https://www.lexilogos.com/keyboard/<C-R>"<CR><CR>
" nnoremap <leader>lxo viWd:!firefox -new-tab https://www.lexilogos.com/keyboard/<C-R>"<CR><CR>

" Markera o kör rad av typen '     evince -p 30 fil1.txt fil2.txt &' =markör inne i rad m ev indrag o annat

"Kör url med 'firefox -new-tab'
" https://support.mozilla.org/en-US/questions/970967
" https://superuser.com/questions/829117/open-a-new-tab-window-in-an-existing-firefox-instance-on-linux
" https://www.freecodecamp.org/learn/responsive-web-design/basic-html-and-html5/link-to-internal-sections-of-a-page-with-anchor-elements
"  gsök: open url in firefox new tab from bash
"  gsök: open url in new tab of existing firefox window from bash commandline
nnoremap <leader>fi viWy:!firefox -new-tab <C-R>"<CR><CR>
nnoremap <leader>ac viWy:!audacity <C-R>" &<CR><CR>
nnoremap <leader>m4 viWy:!musescore4 <C-R>" &<CR><CR>
nnoremap <leader>ro viWy:!rosegarden <C-R>" &<CR><CR>
nnoremap <leader>ad viWy:!ardour4 <C-R>" &<CR><CR>
nnoremap <leader>dl viWy:!dillo <C-R>"<CR>
nnoremap <leader>mi viWy:!midori <C-R>"<CR>
"öppna sångövningar(=m3u-fil) med vlc
nnoremap <leader>vc viWy:!vlc <C-R>" 2> /dev/null &<CR><CR>
" öppna media(!)fil med mplayer(!)
nnoremap <leader>mp yiW:!mplayer <C-R>"<CR>
"run bashcommand
nnoremap <leader>ba viWy:!<C-R>"<CR>
"Öppna bild med Ristretto
nnoremap <leader>ri viWy:!ristretto <C-R>" &<CR><CR>
"Öppna fil (pdf) med Evince
nnoremap <leader>ev viWy:!evince <C-R>" &<CR><CR>
"TODO: ÖPPNA PDF M EVINCE ; PEKAREN VARSOMHELST PÅ RADEN  (=tar hela raden,
"           inkl radnummer m -p till evince mm ******** )
"öppna fil med libreoffice
nnoremap <leader>li viWy:!libreoffice <C-R>" &<CR><CR>
"öppna fil med Blender
nnoremap <leader>be viWy:!blender <C-R>" &<CR><CR>
"öppna fil med Tuxguitar
nnoremap <leader>tu viWy:!tuxguitar <C-R>" &<CR><CR>
"öppna fil med Inkscape
nnoremap <leader>ik viWy:!inkscape <C-R>" &<CR><CR>
"öppna fil med Freeplane
nnoremap <leader>fp viWy:!freeplane <C-R>" &<CR><CR>
"öppna fil med Gimp
nnoremap <leader>gi viWy:!gimp <C-R>" &<CR><CR>
"öppna fil med gvim
nnoremap <leader>gm viWy:!gvim <C-R>"<CR><CR>
"Öppna fil med timidity**** +TEMPOMARKERING
nnoremap <leader>ti ^f/viW"tyWyiw:!timidity -T <C-R>" <C-R>t <CR><CR>
"Öppna fil med timidity** (=enkel)
nnoremap <leader>tm yiW:!timidity -ia <C-R>"<CR><CR>
"Öppna fil med audacious***
nnoremap <leader>au viWy:!audacious <C-R>" &<CR><CR>
"Öppna fil(mapp) med thunar**
nnoremap <leader>th yiW:!thunar <C-R>" &<CR><CR>
nnoremap <leader>tH $F/vBy:!thunar <C-R>" &<CR><CR>



"TODO TODO:    
"  ##    TRANSLATE-MAP  \tr \ra
"  ##    FORVO-MAP  \fo    glaube uisce
vnoremap <leader>fo y:!firefox -new-tab https://forvo.com/search/<C-R>"/<CR><CR>
"SÖK BOKSTAV/TECKEN I WIKTIONARY
nnoremap <leader>tk vy:!firefox -new-tab https://en.wiktionary.org/wiki/<C-R>"<CR><CR>

"Generera qr-kod för ord/text/url under markör + visa med 'display'(imagemagick)
"TODO: GÖR EV OM TILL VMAP, SÅ MAN KAN VÄLJA HUR MYCKET TEXT MAN SKA KÖRA
"=viWy för nuvarande ord; annars markera fritt som man vill ha det
nnoremap <leader>qr viWy:!qrencode -o /tmp/qrcode.png '<C-R>"'<CR>\|:!display /tmp/qrcode.png<CR><CR>
" http://www.linux-magazine.com/Online/Features/Generating-QR-Codes-in-Linux


"Visa invikta bildlänken (oftast för tröjor mm) med Ristretto***************
nnoremap <leader>kl :normal zoma2j^viWy'azc<CR>\|:!ristretto <C-R>" &<CR>
"ÖPPNA INTERNETLÄNKEN I VIKNINGEN M FIREFOX (=I NY TAB) *******
nnoremap <leader>kt :normal zoj^viWykzcj<CR>\|:!firefox -new-tab <C-R>"<CR><CR>
" http://www.twinkledeals.com/t-shirts/3d-geometric-and-print-round/p_486748.html


"Öppna ordet i TheFreeDictionary***
nnoremap <leader>dif viwy:!firefox -new-tab http://www.thefreedictionary.com/<C-R>"<CR><CR>
nnoremap <leader>dim viwy:!firefox -new-tab https://www.merriam-webster.com/dictionary/<C-R>"<CR><CR>
nnoremap <leader>did viwy:!firefox -new-tab https://www.dictionary.com/browse/<C-R>"<CR><CR>
"Öppna ordet i Babel för Översättning***
nnoremap <leader>tr viwy:!firefox -new-tab http://sv.bab.la/lexikon/engelsk-svensk/<C-R>"<CR><CR>
" rapacious
"Öppna ordet i (english) etym. dict.
" nnoremap <leader>et viwy:!firefox -new-tab http://www.etymonline.com/index.php?term=<C-R>"&allowed_in_frame=0<CR><CR>
"philtools
" EP IP RA RB       #STANFORD INTERNET-ENC. IRONCHARIOTS RATIONALWIKI
"logical fallacies
" =ÖPPNA O DRA UPP TEXTDOKUMENT, MED URL-LÄNKAR TILL ALLA FALLACYRELATERADE
"   SIDOR + NAMNET PÅ FALL. INMATAT PÅ RÄTT STÄLLE (EL. FÖRST, BARA
"   ADRESSERNA)
"
"Öppna ordet med thesaurus*******
"
"Sök summa i svenska kronor
"#######noremap <leader>ec viwy:!firefox -new-tab http://sv.bab.la/lexikon/engelsk-svensk/<C-R>"<CR>

"ÖPPNA ORDET MED GOOGLE TRANSLATE    = ÄNDRA 'DE' TILL RÄTT GTRANSLATE-LANGKOD
" +KÖR RADEN NEDAN I AKTUELLA VIMFÖNSTRET (MED ORD ATT PLOCKA FRÅN
"nnoremap <leader>gt ^vg_y:!firefox -new-tab https://translate.google.se/?oe=utf-8&ie=UTF-8&hl=sv&client=tw-ob#de/en/<C-R>"<CR>

" https://en.wikipedia.org/wiki/WORD
" http://plato.stanford.edu/entries/WORD/
" http://www.iep.utm.edu/
"
" https://www.rep.routledge.com/
" https://www.google.se/search?client=ubuntu&channel=fs&q=online+philosophical+resources&ie=utf-8&oe=utf-8&gfe_rd=cr&ei=TSvlV-yiAo-r8wff5puoBA


" }}}
" .   alltodoist ?? {{{
" }}}
" file-utilities mm ***           #inkl. markering till valoud-temp *** {{{

" ~/  __
nnoremap <leader>cda viWy:cd <C-R>"<CR> \| :pw<CR>
nnoremap <leader>cdl viWy:lcd <C-R>"<CR> \| :pw<CR>
" viWy:cd <C-R>"<CR><CR>

" SÄTT ALLT SOM FÖRRA MARKERING + FÖRBERED 'SKRIV FÖRRA MARKERING TILL
" VALOUD-TEMP' ****** ('voicealoudreader')
nnoremap <leader>aa ggVG<Esc><C-O><C-O>
nnoremap <leader>va :'<,'>w! ~/Dropbox/aaa/0000_valoudreader-temp.txt
nnoremap <leader>tva :%d<CR>"+p:w! ~/Dropbox/aaa/0000_valoudreader-temp.txt

" GENERAL UTILITIES: RENAME
nnoremap <leader>mv :!mv <C-R><C-A> <C-R><C-A>
" GENERAL UTILITIES: REMOVE
nnoremap <leader>rm :!rm <C-R><C-A>
" pull latest mv-filename_tail ***
nnoremap <leader>fmv ":pF~dF!

" gen.utils: create softlink to file under cursor (=in wdir) ***
"   tip: ringfinger on ,-leader *
nnoremap <leader>lns :!ln -s <c-r><c-a><cr><cr>
" cp (target =vim_wdir, t.ex. ~/gdrive/kodhubben_drive/scriptlegacy-blueleg )
" ___editingrightnow
"" nnoremap <leader>cp yiW:cp <C-R>" 

" TODO TODO TODO: Kunna skapa txtfil i temp av öppna textfilen
"                   (=främst från tags--g-filtrering) =temp
"                   +fildatum-randomnumber el stigande tal i .rc-fil
nnoremap <leader>t :w /tmp/temp<C-D>

" }}}
" .  drsunderv musik/gitarr +eg. ** {{{

" drsu-path put
nnoremap <leader>dpp :badd ~/Dropbox/.drsundervpaths.txt<CR>idrsu: <C-X><C-L><C-N><C-N>
" drsu-path clean       #=clean headtemp
nnoremap <leader>dpc gEdaW$

" drsu-path latest-screenshot
nnoremap <leader>dpl "zyiW$a ~/scrshtemp/<C-X><C-F><C-P><C-P><ESC>T/"yy$"xdiWx:!mv <C-R>x <C-R>z<CR>a<C-R>y<ESC>

" Därefter, kör ,mv från 'utils' + ,fmv(pull latest mv-filename_tail)   #nmap

" }}}
" sprdb-maps {{{

" 'Open Lexilogos-index/keyb.-map finns i KÖR M PROGR./HEMSIDA **

"  kombinerade
"noremap <leader>di viwy:!firefox -new-tab http://www.thefreedictionary.com/<C-R>"<CR>\|:!firefox -new-tab http://sv.bab.la/lexikon/engelsk-svensk/<C-R>"<CR>
"
"Några maps för SPRÅKDATABASFILEN (=delar prefix med lilypondskripten=_
"Infoga tag-strängen för längst upp i Språkdatabasfilen
nnoremap _t otags:spr1__ spr--<C-o>:r !date +"\%Y\%m\%d"<CR><ESC>kgJ?_<CR>
"""""""""""""old--v
"DRS SPRÅKDB_ANKISOURCE; 2 Maps *****
"" Klipp ut nuvarande framgooglade ordet
"noremap <Leader>c "+Pgg2ddjdG"+diw
" Klistra in nuvarande framgooglade ordet i nästa xx-box
"noremap <Leader>p /xx<Enter>xx"+Pa
"     nnoremap <leader>x 0f:2xviwdi_[sv/<c-r>"];_[<c-r>"/sv]<esc>0
nnoremap <leader>y 0f:2xviwdi_[<c-r>"/sv];_[sv/<c-r>"]<esc>0
" "----------------- f*n: vim editing script fu 2.8
" "cmap w!! %!sudo tee > /dev/null
nnoremap _a isv: <CR>dan: <CR>isl: <CR>------ <CR>ty: <CR>fr: <CR>ry: <CR>spa: <CR>ar: <CR>jp: <ESC>
"+=Lägg ev till t-språkslexikonet till _a **
nnoremap _b itur: <CR>lat: <CR>gre: <CR>hin: <CR>kin: <CR>far: <CR>iw: <CR>ir: <CR>pt: <ESC>
"En till map: sudda alla rader som inte innehåller några hakparenteser (=inga
"färdiga glosor******
nnoremap _g vip:v/^.*].*$/d<CR>
"noremap _g vip:v/\]\|\[/d<CR>
"noremap _g vip:v/\v(\[|\])+/d<CR>
"SUDDA ALLA RADER SOM INTE INNEHÅLLER ETT SEMIKOLON (;)
nnoremap _h :v/^.*;.*$/d<CR>

"LANG/SPR-DB: Delete lines not starting with @
nnoremap <A-s> :g/^\s*[^@]\+$/d<CR>
"   ^#  =skickad till Wael/Karrar m.fl.

" }}}
" ankistud {{{

" KÖR SPECIALCOMPLETION PÅ DRS-TAGS ****
inoremap <leader>ta t___<C-N><C-P>

nnoremap <leader>mtl :g//m0<left><left><left>

inoremap <leader>u ___
cnoremap <leader>u ___

" Put/Remove t and ___ for drs Ankitags **
vnoremap <leader>tpu :s/\v<\ze_/t/g<CR>
vnoremap <leader>trm :s/\v<t\ze_//g<CR>
vnoremap <leader>upu :s/\v<\ze\w/___/<CR>
vnoremap <leader>urm :s/\v<\zs_+//g<CR>
nnoremap <leader>ulpu Vip:s/\v;.{-}\zs</___/g<CR>

" 'ADD ANKITAGS(=ANKITAGS-INDEXFILEN (I ANKISKRIPTET MM) ***** )
nnoremap <leader>aat :badd ~/Dropbox/anki/ankidecksdrs-completeindexandcards/ankidecksdrs-completeindexandcards.txt<CR><CR>
" NY!: FILTRERA UT ALLA TAGS UR EN ANKISOURCE-FIL (=ALLA UNIKA(!) ORD TILL
" HÖGER OM SISTA ';' ********
" 'ankisourcetags'
nnoremap <leader>ast :%y<CR>:tabedit<CR>pdgg:%s/.*;//g<CR>:%s/ /\r/g<CR>:%!sort \| uniq<CR>

" Spara ut rad till Ankisourcefil för filnamnet.txt i Drop ******
nnoremap <leader>aq :cd ~/Dropbox \| .w >> ~/Dropbox/ankisource_<C-R>%<CR>

" }}}
" .  vimplane/alltodoplane        folding mm  __ {{{

" indent last edit/paste **
nnoremap <leader>ie >`]

" SÖK VIMPLANE/ALLTODOIST-HEADLINE (=FÖRINMATAD MED .*{ *****
nnoremap <leader>sh /.*{<Left><Left><Left>

vnoremap <Up> kok$
vnoremap <Down> joj$

vnoremap <Right> <Esc>)visozt
vnoremap <Left> <Esc>(ztviso
"vnoremap <leader>e <Esc>)vis
"vnoremap <leader>a <Esc>2(vis
vnoremap ai <Esc>)vis
vnoremap ia <Esc>2(vis

vnoremap <C-Up> kok$zt
vnoremap <C-Down> joj$zt

nnoremap <S-Up> dap{{p
nnoremap <S-Down> dap}p
" nnoremap <PageUp> <nop>
" nnoremap <PageDown> <nop>

" 'into source'
nnoremap <leader>is :tabe %<CR>gTgggf
" till vimplane: tabhanteringskommandon(***): tabe + tabshuffles
nnoremap <leader>te :tabe %<CR><C-L>
" öppna 'wgf-länkar' + gå tillb. till tab 1
nnoremap <leader>gf gf1gt^zz

" Make space more useful
nnoremap <space> za

" fold marked lines
vnoremap <leader>fm <Esc>o<c-h><Esc>gvjo<Esc>A <Esc>gvzfzc
" produce fold from a line
nnoremap <leader>fa A <CR> <c-h><Esc>Vkzfzc
" fold line + following (indented)
nnoremap <leader>fj A <Esc>Vj<Esc>o<c-h><Esc>gvjzfzc
" produce foldblock from line (with wide inner) + keep editing
inoremap <leader>ef <Esc>a <CR> <c-h><CR><Tab><CR><c-h><CR> <c-h><Esc>V4kzfzo2jA
" widen inner of foldblock
nnoremap <leader>fw [zo<Esc>]zO<Esc><c-o><c-o>


nnoremap <leader>z :norm ggg?G<CR>

" Move lines with Alt-Up/Down (Gedit-style)
nnoremap <A-Up> ddkP
nnoremap <A-Down> ddjP
vnoremap <A-Up> dkkpV`]
vnoremap <A-Down> dpV`]
nnoremap <C-A-Up> ddkPzc
nnoremap <C-A-Down> ddjPzc
" VIMPLANE 2 --------
" TODO: EV KUNNA FLYTTA STYCKEN (ip och/eller ap) UPP OCH NER *
"   2018-04: Testade s-upp/ner =verkar bara hoppa i dok =Anv. Förmodl. *****
" TODO: KUNNA FLYTTA UT/IN GRENAR PÅ 'PLANE'-TRÄDET
"-------
"Gå till nästa fold och stäng den
nnoremap <C-S-A-Down> zc/{{{<CR>
"                       }}}
nnoremap <C-S-A-Up> zc?{{{<CR>
"                       }}}
"VimPlane: g{ : Nästa stycke + se folds som enkla rader 

" V-HIGHLIGHT NUV. RAD + FLYTTA HIGHLIGHTEN UPPÅT/NERÅT ****
"Highlight nästa stycke Styrketräningsmallen mm
"vnoremap <leader>nn }}kojj
" Hoppa till nästa ORD med Visual-Markering
vnoremap <C-Right> EloWo
vnoremap <C-Left> hoBogEl

"Maximera fönster, både längd och bredd
nnoremap <A-m> <C-w>\|<C-w>_
"Equalize = utjämna alla fönster igen (längd och bredd)
nnoremap <A-n> <C-w>=
" Gå till andra split + maximera ******
nnoremap <S-A-m> <C-w>w<C-w>\|<C-w>_

"-----

" }}}
" .  vimbibl                      zot/doce, bibtex + eg.textbas.syst. {{{
" }}}
" substitution/global ** {{{

" Start Substitution-Line ***
nnoremap <leader>sj :.,$s///gc<Left><Left><Left>
nnoremap <leader>sv :'<,'>s///gc<Left><Left><Left>
nnoremap <leader>sa :%s///gc<Left><Left><Left>
  " 'count'
nnoremap <leader>sc :%s///gn<CR>
" :%s/\v^$//gc<Left><Left><Left><Left>
nnoremap <leader>g :'<,'>g/^$/<Left>
" Mata in \zs, \ze m.fl. c-mode teckenkomb.s ***
" \v^[^;]+;[^;]+;[^;]+$ m.fl. ****
cnoremap <leader>b \zs
cnoremap <leader>e \ze

cnoremap <leader>1 .\?

" finish/complete(=tail) for standard vselect subst.line ***
cnoremap <leader>ta :s/\v//gc<left><left><left><left>


" }}}
" filter o rapporter              nyck.ordsfiltr, radstartfiltr. mm {{{

" LISTA ALLA ANVÄNDA KEYBOARD-SHORTCUTS  __ __
"VIMGREP FOR TAG UNDER CURSOR*****
"old: = noremap <C-S-A-v> viWy:vimgrep /<C-R>"/ % \| copen \| resize<CR>
nnoremap <C-S-A-v> y:vimgrep /<C-R>"/ % \| copen \| resize<CR>
" 0000  FUNKAR INTE PÅ OMR.FILEN, EFTERSOM ÄR BINÄR(?)
nnoremap <C-S-A-g> viWy:!grep <C-R>" % \| gvim -<CR><CR>
"Sudda alla ___tags****
nnoremap <C-S-A-j> :%s/{{{\\|___[[:alnum:]_]\+//g<CR>
"                       }}}
"Filtrera ut ^\a-rader
nnoremap <C-S-A-x> :vimgrep /^[[:graph:]]/ % \| copen \| resize<CR>
nnoremap <C-S-A-y> :!grep '^[[:graph:]]' % \| gvim -<CR><CR>
" TODO: CSA-H  = TILL: SPARA OMR SOM TEMPFIL OCH ÖPPNA MED GVIM     TODO TODO
" ___0000
" TODO TODO TODO
"noremap <C-S-A-h> :%ya +<CR>\|:!gvim -c 'put +'<CR>
"-c 'write /tmp/OMR.txt'
"<CR>
""noremap <C-S-A-h> :%ya + | !gvim -c 'put +' -c 'write /tmp/OMR.txt'
"
" viWy:!grep <C-R>" % \>> .RCFIL-M-RISTRETTO_O_&-RADER.x-rc \|
" !körOpenfilteredinRistretto.bash .RCFILENOVAN<CR>
"
" =?????
nnoremap <C-S-A-z> :%s/___.*//g<CR>

"Sök i Stenoreffilerna(=ordlistor över förkortningar) efter steno-ord ****
" ta=sv tb=eng tc=ty td=fra     TODO: EV SOM SPLITEDIT ISTÄLLET (=ist.för
"                                       öppna separat fil för dict-filen
"  ~/Dropbox/lexilogoskeyboard_keywords.txt<CR>
"    test:  för
vnoremap <leader>ta y:belowright split ~/Dropbox/svsteno--REF_förkortningar.txt<CR>/\v^\s*<C-R>"<CR>
vnoremap <leader>tb y:belowright split ~/Dropbox/engsteno--REF_förkortningar.txt<CR>/\v^\s*<C-R>"<CR>
vnoremap <leader>tc y:belowright split ~/Dropbox/tysteno--REF_förkortningar.txt<CR>/\v^\s*<C-R>"<CR>
vnoremap <leader>td y:belowright split ~/Dropbox/frasteno--REF_förkortningar.txt<CR>/\v^\s*<C-R>"<CR>
vnoremap <leader>te y:belowright split ~/Dropbox/rapsteno--REF_förkortningar.txt<CR>/\v^\s*<C-R>"<CR>
" -------
vnoremap <leader>trs mmy:botright vsplit ~/Dropbox/rsc/data/lists/ref/shorth/rapidskr.txt
/^\A\?<C-R>"
yycp^:s/\v.{-}  //
:s/  .*//
"rdg_dd`ma[]<Esc>i<C-R><C-R>r<Esc>:bd rapidskr
:nohlsearch
"vnoremap <leader>tg (=Gregg-var)
" -----
vnoremap <F5> y:!ristretto `find /home/bluelegend/Dropbox/ankiimages-steno_rskrift/ -maxdepth 1 -iname '*<C-R>"*' 2>/dev/null` &<CR><CR>
"vnoremap <F5> y:!ristretto `find /home/bluelegend/Dropbox/ankiimages-steno_rskrift/ -maxdepth 1 -iregex '.*<C-R>".*' 2>/dev/null` &<CR><CR>
vnoremap <F6> y:!ristretto `find /home/bluelegend/Dropbox/ankiimages-steno_rskrift/gregg-engsteno/ -iname '*<C-R>"*' 2>/dev/null` &<CR><CR>
"vnoremap <F6> y:!ristretto `find /home/bluelegend/Dropbox/ankiimages-steno_rskrift/gregg-engsteno/ -iname '*<C-R>"*' 2>/dev/null` &<CR><CR>

"dra in rsteno-sträng  vid[/"\"]
vnoremap <F3> mmy:botright vsplit ~/Dropbox/rsc/data/lists/ref/shorth/rapidskr.txt
/^\A*<C-R>".\{-}\ze  
yycp^:s/\v.{-}  //
:s/  .*//
"rdg_dd`ma[]<Esc>i<C-R><C-R>r<Esc>:bd rapidskr
:nohlsearch
"dra in rsteno-sträng + ha kvar reffils-fönstret
vnoremap <F4> mmy:botright vsplit ~/Dropbox/rsc/data/lists/ref/shorth/rapidskr.txt
/^\A*<C-R>"
yyp^:s/\v.{-}  //
:s/  .*//
"rdg_dd`ma[]<Esc>i<C-R><C-R>r<Esc>

"search rsteno string in new
" evince -l "string"
vnoremap <F5> y:!evince --find='<C-R>"' ~/Dropbox/rsc/Doks/Lang/Shorth/sv/rskrift.empire.pdf &


"dra in svår gregg-sträng
"       Dropbox/gregg.txt    #PROPAB. PULL UP \ze
"       / '  '-SOLUTIONS FROM NEXT LINE TO F3/F3 (=support for longer phrases
"       etc (!! ###)
" __ vnoremap <F11> mmy:botright vsplit ~/Dropbox/rsc/data/lists/ref/shorth/gregg.txt
/^\t*<C-R>"\ze  
yycp^:s/\v.{-}  //
:s/  .*//
"rdg_dd`ma[]<Esc>i<C-R><C-R>r<Esc>:bd gregg.txt
:nohlsearch
" __ vnoremap <F12> mmy:botright vsplit ~/Dropbox/rsc/data/lists/ref/shorth/gregg.txt
/^\t*<C-R>"\ze  
yyp^:s/\v.{-}  //
:s/  .*//
"rdg_dd`ma[]<Esc>i<C-R><C-R>r<Esc>

" __ Search shorthand shapes by string (i.e. from shorthand reference PDF's)
" let g:last_search_key = ""
vnoremap <F9> y:!evince -l '<C-R>"' ~/Dropbox/rsc/Doks/Lang/Shorth/sv/rskrift.empire.pdf &<CR><CR>gv
vnoremap <F12> y:!evince -l '<C-R>"' ~/Empire/Doks/Lang/Shorth/en/stenogregg-dictionary.pdf &<CR><CR>gv
vnoremap <S-F12> y:!evince -l '<C-R>"' ~/Empire/Doks/Lang/Shorth/en/stenogregg-phrasebook.pdf &<CR><CR>gv
" detta är första tekniken som vi vill testa
" and here we are testing the english language
" 
" vnoremap <F9> :let g:last_search_key = '<F9>' | y:!evince -l '<C-R>"' ~/path/file1.pdf &<CR>gv
" vnoremap <F12> :let g:last_search_key = '<F12>' | y:!evince -l '<C-R>"' ~/path/file2.pdf &<CR>gv
" vnoremap <S-F12> :let g:last_search_key = '<S-F12>' | y:!evince -l '<C-R>"' ~/path/file3.pdf &<CR>gv
"
" vnoremap <C-CR> :execute 'normal \<C-R>g:last_search_key\<CR>'
" vnoremap <C-CR> :execute 'normal \<C-R>g:last_search_key\<CR>'

vnoremap <Space> <Esc>Wviw
vnoremap <S-Space> <Esc>2Bviw

"dra in gregg-sträng + ha kvar reffils-fönstret
" +TESTA GREP (=RAPPORT-KOMMANDO)  =PLOCKA O VISA ALLA RELEVANTA RADER (T.EX. I VIM ****)

"vnoremap <F6> y:!ristretto `find /home/bluelegend/Dropbox/ankiimages-steno_rskrift/gregg-engsteno/ -iregex '.*<C-R>".*' 2>/dev/null` &<CR><CR>
" OBS: + c-m i ristretto =visa thumbnails i sidebar(!!/*)

"vnoremap <leader>te y:belowright split ~/Dropbox/rapsteno--REF_förkortningar.txt<CR>/<C-R>"<CR>
" \v^\s+
"vnoremap <leader>ta y \| :!gvim -c '/<C-R>"' ~/Dropbox/svsteno--REF_förkortningar.txt<CR><CR>
"vnoremap <leader>tb y \| :!gvim -c '/<C-R>"' ~/Dropbox/engsteno--REF_förkortningar.txt<CR><CR>
"vnoremap <leader>tc y \| :!gvim -c '/<C-R>"' ~/Dropbox/tysteno--REF_förkortningar.txt<CR><CR>
"vnoremap <leader>td y \| :!gvim -c '/<C-R>"' ~/Dropbox/frasteno--REF_förkortningar.txt<CR><CR>

" }}}
" rensa/processa/sök i rds-text {{{

" RDS
nnoremap <leader>J Jh2x
" gå till nästa versal ej i början på mening +lower case
nnoremap <leader>ll /\v[^.][ a-z][[:upper:]]/e<CR><C-L>~


" }}}
" Interweave (=pull together lines split into two blocks by rds(####))
    " nnoremap ???? }
ddp-J
  ******(!!!!)
" pull/read                       t.ex. senaste filnamnet från akt. mapp {{{
" Find New Path for Moved File (=Broken Path-link [!!]) ******
" nnoremap <leader>FF $T/yE:r !find -L -type f -name '<C-R>"' 2>/dev/null<CR>
" !#¤&!"#¤½!¤!"#%¤!"¤%  Pull out and input root path from filename  + use x and z registers
" nnoremap <leader>FF $T/yE:r !find -L -type f -name '<C-R>"' 2>/dev/null; ding<CR>

" Plocka in filnamnet för senaste redigerade (=t.ex. tillagda filen) i aktiva mappen ******
nnoremap <leader>f $:r !ls -tr \| tail -1 <CR>kgJ
" Pull in and edit latest added/changed file from active directory
nnoremap <leader>F :e !`ls -tr \| tail -1`<CR>
" }}}
" klipp/ta bort/rensa             ev till filtrering {{{

" RENSA BORT /*-MARKERINGAR FRÅN FOLDMARKERS ****
nnoremap <leader>mcl :%s:\v\*/\|/\*::gc<CR>

"vnoremap  sudda blanka rader
"
"PREPARE INDENTS FOR FOLDMETHOD MARKER***
"     @a:  zjkA {{{<Esc>zko}}}<Esc>
"vnoremap/hela filen  ta bort siffror från foldmarkers****
"noremap <C-S-A-o> :%s/\v({\|\})\d/\1/gc<CR>
"
"Ta bort <> runt hyperlänkar
"ta bort alla länkar inom < >
"
"vnoremap  klipp bort alla \s i början på rader

" Rensa Gsök-rad i weblinks ¤!"#¤
nnoremap <leader>gsc /google.*search<CR>zz:s/.*&q=//<CR>Igsök: <Esc>f&D:s/+/ /g<CR>

" }}}
" De-Split accidentally juxtaposed two-column OCR-Output ****  __ __
" nnoremap <F12> d${O<C-R>"<Esc>'[<<
nnoremap <F12> d$}}O<C-R>"<Esc><C-O>zz
" Left-Align all lines of 35fmt-ed Text-Block
" {<CR>/\v^\s+\zs/<CR>d0O<Esc><CR>@g{{dd


" ___translateshell
" =Default Target Language(s) [**]
"@@@@ let g:trans_default_direction = ":en"
let g:trans_default_direction = ":en+is+da+sv+fr+de+es+ru+uk"
"let g:trans_default_direction = ":is+da+no+la+el"
    " is|fo(=faeroese), da, no, la(tin), el(=greek)
"let g:trans_default_direction = ":ar+zh-CN+yue+zh-TW+ja+fa+he+hi+ur+tr+af"
    " ar, zh-CN(chin), ja(p), fa(rsi)|prs(=dari), he(br), hi(n)+ur, tr(=turk), af(rikaans)
    " yua(=yucatec maya),  =BING
"let g:trans_default_direction = ":fi+cy+ga+gd+pl"
    " fi(nnish), cy(=welsh), ga(=ir),  gd(=scots gaelic), pl(=polish)
    "
"let g:trans_default_direction = ":bo+ms+sa+ku+ckb"
    " ms(=malay), sa(nskrit), yue(=cantonese), zh-TW ku/ckb  [=kurmanji | sorani], bo(=tibetan)
"let g:trans_default_direction = ":ka+hy+eu+hu+ps+qu"
    " ka+hy (georgian+armenian), eu(skara), hu(ngarian), chr(=cherokee), qu(echua), ps(=pashto)
"let g:trans_default_direction = ":" bengali, punjabi, kannada, ta(mil),  telugu, malayalam  marathi, gu(jarati)
    " bengali, punjabi, kannada, ta(mil),  telugu, malayalam  marathi, gujarati
"let g:trans_default_direction = ":mi+gn+mg+tl"
    " mi(=maori) iu(=inuktut syllabary) kl(=kalaallisut)  gn(=guarani)????,  mg?(=malagasy)  tl(=tagalog)
"let g:trans_default_direction = ":yo+xh+zu+yi+eo"
    " yo(ruba), xh(osa), zu(lu) yi(ddish) ie(=interlingue), eo(=esperanto)
    "

" [FROM 'man trans' ****] ----
" -S, -list-engines
"       List available translation engines and exit.
"    aspell
"  * google
"    bing       #yue
"    spell
"    hunspell
"    apertium
"    yandex
" -e ENGINE, -engine ENGINE
"       Specify the translation engine to use.  (default: google)

let g:trans_save_history = 1
        " Default: 0
        " 
        " Use this option to enable saving history. This variable
    " =should be set with |g:trans_history_file|. Use this variable to save history of translation with selected translation.
    " If this variable is specified then you can press <Enter> in translate window
        " to select translation to saving.
        " You can specify the format of saved file with |g:trans_history_format|.
        " 
        " Possible values are:
        " 0: Saving history is disabled.
        " 1: Save all translations to one file that is specified in
        "    |g:trans_history_file|.
        " 2: Save all translations in separate files. Files are separated by the
        "    source language. To the name of file that specified in
        "    |g:trans_history_file| will be added postfix with code of source
        "    language.
        " 
        "    Example:
        "    - We specified |g:trans_history_file| in the following way:
        "       let g:trans_history_file = '~/trans_history/trans_history.csv'
        "    - All translations from English will be saved in the following file:
        "       ~/trans_history/trans_history_en.csv
        "    - All translations from German will be saved in the following file:
        "       ~/trans_history/trans_history_de.csv
        " 3: Save all translations in separate files. Files are separated by the
        "    source language and target language. To the name of file that specified
        "    in |g:trans_history_file| will be added postfix with code of source
        "    language and code of target language.
        " 
        "    Example:
        "    - We specified |g:trans_history_file| in the following way:
        "       let g:trans_history_file = '~/trans_history/trans_history.csv'
        "    - All translations from English to Russian will be saved in the
        "      following file:
        "       ~/trans_history/trans_history_en_ru.csv
        "    - All translations from English to German will be saved in the
        "      following file:
        "       ~/trans_history/trans_history_en_de.csv
        " Example:
        " let g:trans_save_history = 1
        "                                                      *g:trans_history_file*
let g:trans_save_audio = 1
        " Default: 0
        " 
        " Use this option to specify that you'd like to download audio files for
        " translation. The audio will be downloaded in the same directory where
        " |g:trans_history_file| is located. After that you could import this history
        " and audio to Anki. See |trans-Anki| for more details.
        " 
        " Example:
        " let g:trans_save_audio = 1
        "                                            *g:trans_ignore_audio_for_langs*
let g:trans_history_file = '~/processdir/trans_history.csv'
        " Default: ''
        " 
        " Use this option to specify the location of your translate history file. Only needed if variable |g:trans_save_history| was set.
        " If directory where history file should be saved doesn't exist, then try to create the directory.
        " 
        " Example:
        " let g:trans_history_file = '~/trans_history/trans_history.csv'
        "                                                    *g:trans_history_format*
let g:trans_history_format = '%s ; %t ; %as ; %at'
        " Default: '%s;%t'
        " 
        " Use this option to specify the format of translate history file. Only needed
        " if variable |g:trans_save_history| was set. Use flags to specify format. You
        " can import this file to Anki (see |trans-Anki|).
        " 
        " Possible flags are:
        " '%s': flag will be replaced with the source word.
        " '%t': flag will be replaced with the target word.
        " '%as': flag will be replaced with string with the audio file for source word.
        "        You should use this flag with option |g:trans_save_audio|.
        " '%at': flag will be replaced with the string with audio file for target word.
        "        You should use this flag with option |g:trans_save_audio|.
        " Example:
        " let g:trans_history_format = '%s;%t;%as;%at'
" g:trans_save_raw_history
        " Default: 0
        " 
        " Use this option to enable saving history. This variable should be set in pair
        " with |g:trans_history_raw_file|. 'raw history' means that it will save all
        " history of using plugin and will save only words (without translation) that
        " were translated.
        " 
        " Example:
        " let g:trans_save_raw_history = 1
        "                                                  *g:trans_history_raw_file*
" g:trans_history_raw_file
        " Default: '~/.vim/.trans_raw_history'
        " 
        " Use this option to specify the location of your raw history file. Only needed
        " if variable |g:trans_save_raw_history| was set.
        " 
        " Example:
        " let g:trans_history_raw_file = '~/.trans_raw_history'
        "                                                      *g:trans_save_history*
" g:trans_close_window_after_saving
        " Default: 0
        " 
        " Use this option to specify that translate window should be closed after
        " selecting translation to save.
        " 
        " Example:
        " let g:trans_close_window_after_saving = 1
        "                                                  *g:trans_save_only_unique*
let g:trans_save_only_unique = 2
        " Default: 0
        " 
        " Use this option to specify that only new words should be added to
        " |g:trans_history_file|.
        " 
        " Possible values are:
        " 0: Doesn't check is word unique or not.
        " 1: If word is already in |g:trans_history_file| will print message about it.
        " 2: If word is already in |g:trans_history_file| will add new translation
        "    to this word.
        " 
        " Example:
        " let g:trans_save_only_unique = 2
        "                                                        *g:trans_save_audio*
let g:trans_ignore_audio_for_langs = ['en', 'sv']
        " Default: empty list
        " 
        " Use this option to specify the list of languages for which you don't want to
        " download audio files.
        " 
        " Example:
        " let g:trans_ignore_audio_for_langs = ['ru', 'de']
        " In this case audio files for Russian and German languages won't download.

" += 'If you pass options, the ^^ will be ignored'
" let g:trans_default_direction="de:en"  =TEST(!)
let g:trans_win_position = "bottom"
" let g:trans_win_position = "right"
let g:trans_join_lines = 1
" g:trans_directions_list
" :TransTerm  =open interactive terminal from vim8+
" g:trans_interactive_full_list
" :TransOpenHistoryWindow
" :TransChangeDefaultDirection =show (+select?) langcode from list
        "   =if you can't remember a certain langcode(!)
" FzF-window  fzf = 'fuzzy finder'
" g:trans_win_height
" :TransSelectDirection (=??)
" -- --
" <CR>/<Enter>    Add translation under cursor to history file. (=??)

"   4. Learn your cards with Anki :)
            "   let g:trans_directions_list = [
            "       \['en', 'ru'],
            "       \['ru', 'en'],
            "       \['en', 'de'],
            "       \['en', 'ru', 'de'],
            "       \['', 'ru'],
            "       \['', ''],
            "   \]
            " =Used as selection-list for TransInteractive(=??)
            " --
            " https://github.com/echuraev/translate-shell.vim/wiki/Create-and-import-Anki-cards
            "   You can import your history file to Anki.
            "   1. You can configure format of your history file to one of format that
            "   is supported by Anki by setting |g:trans_history_format|, for example csv format:
            "       let g:trans_history_format = '%s;%t;%as;%at'
            "   2. Create a type of cards that supports your fields.
            "   3. Import your history file and copy all '*.mp3' files from directory with
            "   history file(___hm) to Anki media directory:
            "       cp -f <path_to_dir_with_history_file>/*.mp3 <path_to_anki_media_dir>
            "   By default Anki media directory is:
            "       ~/Documents/Anki/<UserName>/collection.media/
" let g:trans_advanced_options = "-brief"  (**)
" +win_height|width (=in characters)

" Key-Mapping Examples: >
"     inoremap <silent> <leader>t <ESC>:Trans<CR>
"     nnoremap <silent> <leader>t :Trans<CR>
"     vnoremap <silent> <leader>t :Trans<CR>
"     nnoremap <silent> <leader>td :TransSelectDirection<CR>
"     vnoremap <silent> <leader>td :TransSelectDirection<CR>

"" TRANSLATE-SHELL MAPS
nnoremap <silent> <leader>tx :Trans<CR>
inoremap <silent> <leader>tx <ESC>:Trans<CR>
noremap <silent> <leader>tt :Trans -brief<CR>
nnoremap <silent> <leader>tte vg_:Trans -brief<CR>
"   \ yy<CTRL-W><CTRL-W>p
"   \ <CTRL-W>o
vnoremap <leader>tb :Trans -brief :
noremap <leader>tr :Trans 
" ,tis =Translate Inner Sentence  (+input
"    below curr. sentence (without indent?))
" ,tq  ,tj  ,tk
" nnoremap <silent> <leader>to :TransSelectDirection<CR>
" vnoremap <silent> <leader>to :TransSelectDirection<CR>


" +TODO TODO: T.POPE WAY OF LOADING(='COMPOSING') PLUGINS
" +TODO TODO TODO TODO TODO TODO TODO TODO

" -U, -upgrade
"       Check for upgrade of this program.


" calculate (numeric expression à la 3+4/5
" Note: Vim computing-register uses strict l2r evaluation
"   (=force order with parentheses)
inoremap <leader>ca <Esc>viWyA=<C-R>=<C-R>"<CR>


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


" MeasureWritingSpeed

" Concerning this function 'MeasureWritingSpeed' that we discussed:

" let g:isMeasuring = 0
" 
" function! SetMeasuring(isActive)
"   if isActive == 1 then
"     if g:isMeasuring == 0 then
"       let g:isMeasuring = 1
"       let g:startTime = time()
"     endif
"   else
"     if g:isMeasuring == 1 then
"       let g:endTime = time()
"       let elapsedTime = (g:endTime - g:startTime) / 1000
"       let charCount = strlen(g:insertBuf)
"       let wordCount = countwords(g:insertBuf)
"       let cps = charCount / elapsedTime
"       let wpm = (wordCount / elapsedTime) * 60
"       echomsg "Characters per second: " . cps
"       echomsg "Words per minute: " . wpm
"       let g:isMeasuring = 0
"     endif
"   endif
" endfunction
" 
" autocmd InsertEnter * call SetMeasuring(1)
" autocmd InsertLeave * call SetMeasuring(0)


" function! SetMeasuring(isActive)
"   if isActive == 1 then
"     if g:isMeasuring == 0 then
"       let g:isMeasuring = 1
"       let g:startTime = strftime("%s")
"     endif
"   else
"     if g:isMeasuring == 1 then
"       let g:endTime = strftime("%s")
"       let elapsedTime = g:endTime - g:startTime
"       let charCount = strlen(g:insertBuf)
"       let wordCount = countwords(g:insertBuf)
"       let cps = charCount / elapsedTime
"       let wpm = (wordCount / elapsedTime) * 60
"       echomsg "Characters per second: " . cps
"       echomsg "Words per minute: " . wpm
"       let g:isMeasuring = 0
"     endif
"   endif
" endfunction
" 
" let g:isMeasuring = 0
" 
" autocmd InsertEnter * call SetMeasuring(1)
" autocmd InsertLeave * call SetMeasuring(0)


" function! SetMeasuring(isActive)
"   if isActive == 1 then
"     if g:isMeasuring == 0 then
"       let g:isMeasuring = 1
"       let [_, g:startTime] = gettimeofday()
"     endif
"   else
"     if g:isMeasuring == 1 then
"       let [_, g:endTime] = gettimeofday()
"       let elapsedTime = g:endTime - g:startTime
"       let charCount = strlen(g:insertBuf)
"       let wordCount = countwords(g:insertBuf)
"       let cps = charCount / elapsedTime
"       let wpm = (wordCount / elapsedTime) * 60
"       echomsg "Characters per second: " . cps
"       echomsg "Words per minute: " . wpm
"       let g:isMeasuring = 0
"     endif
"   endif
" endfunction
" 
" let g:isMeasuring = 0
" 
" autocmd InsertEnter * call SetMeasuring(1)
" autocmd InsertLeave * call SetMeasuring(0)

" When sourcing my vimrc-file and testing entering insert mode, I get an error saying 'Undefined variable: isActive'. Any ideas about how to fix it? Do I have to change or add some things maybe to get it to work?


" !python3 ~/Dropbox/config/vim/measure_writing_speed.py

" @@@@ function! CalculateWritingSpeed()
" @@@@   let elapsedTime = input('Enter the elapsed time (in seconds): ')
" @@@@   if elapsedTime == ''
" @@@@     return
" @@@@   endif
" @@@@ 
" @@@@   let selectedText = getline('.' .. v:visual.line .. '-' .. v:visual.topline)
" @@@@   let characterCount = strlen(selectedText)
" @@@@   let wordCount = split(selectedText, ' ') | len(1)
" @@@@ 
" @@@@   let cpm = (characterCount / (elapsedTime / 60))
" @@@@   let wpm = (wordCount / (elapsedTime / 60))
" @@@@ 
" @@@@   echo "Characters per minute:", cpm
" @@@@   echo "Words per minute:", wpm
" @@@@ endfunction
" @@@@ 
" @@@@ noremap <leader>wa :call CalculateWritingSpeed()<cr>

" au! InsertEnter
" au! InsertLeave

