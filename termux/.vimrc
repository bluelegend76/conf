" vim:fdm=indent:
" Android/Termux .vimrc-file
" __

" TODO TODO
" MAY WANT TO TRANSLATE SEVERAL/MANY
" BINDINGS TO 'LEADER-LESS'
" (i.e. ,LA ==> LA)
"
" ResetPluginMappings:
"   unmap
" ReSourceVimrc:
"   ,0 / ,1 / ,5 / ,3  = :source ~/.vimrc
" TabConvenience:(gt/gT)
"   GT / GTT
" FindTriggerNextMisspell:
"   ,SS = ]szz
"   ,S  = z=
" ConvenienceFOLDTOGGLE:(za)  ****
"    X  ×÷■¤
" ConvenienceSETTRANSLSHELLTARGETLANG:
"   ,LA  @@@
" GotoNextPrev:
"   JUMPS O=C-O//C-I
"   Marks
"   FOLDLEVEL
"   Changes
" ----
" GotoNextSplitPLUSMaximizeTargetSplit:
"   ,WW
"     @@ c-w c-w WITH MAX-FLIP
" EqualizeSizeOfSplits:
"   ,W
" ----
" OPENNEWTAB:(+split etc)
"   GF = c-w gf  GS / GE
" SimpleVisualLineHighlighter:
"   = when visual-line mark active
"       up/down = vertical width stays the same


" unmap
" Reset previous/mappings from other scripts
silent! mapclear
silent! mapclear!
" ___TranslShell_Langs
let mapleader = ","


" TODO: ADD 'THE TWO GIT-RELATED PLUGINS'  __ __
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" The sensible defaults plugin
Plug 'tpope/vim-sensible'

" Some good and interesting plugins to install
" The default plugin for syntax highlighting
Plug 'sheerun/vim-polyglot'

" Allows you to search for visual selections
Plug 'thinca/vim-visualstar'

" A fast fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Enhance netrw for file browsing
Plug 'tpope/vim-vinegar'

" A great plugin for surrounding text with quotes, brackets, etc.
Plug 'tpope/vim-surround'

" The plugin for translate-shell
" Plug 'soimort/translate-shell'
Plug 'echuraev/translate-shell.vim'

Plug 'srcery-colors/srcery-vim'
"Plugin 'flazz/vim-colorschemes'
" TODO TODO: https://github.com/MaxMEllon/vim-jsx-pretty
" TODO TODO: https://github.com/mlaursen/vim-react-snippets
" Plugin 'mattn/emmet-vim'
" TODO https://github.com/reasonml-editor/vim-reason-plus
" Plugin 'rescript-lang/vim-rescript'
"Plugin 'artur-shaik/vim-javacomplete2'
" Plugin 'vim-latex/vim-latex'
" Plugin 'instant-markdown/vim-instant-markdown'
    " Plugin 'preservim/vim-markdown'
Plug 'elzr/vim-json'
" Bash-support
" ALE[!!] =Linting-plugin
"   https://github.com/SirVer/ultisnips
" Plugin 'vim-scripts/SyntaxComplete'
Plug 'tpope/vim-commentary'
Plug 'mechatroner/rainbow_csv'
" :RainbowAlign
" Plugin 'vimoutliner/vimoutliner'
" Plugin 'neo4j-contrib/cypher-vim-syntax'
" Plugin 'vim-scripts/sparql.vim'
"Plugin 'Omer/vim-sparql'
"Plugin 'vim-scripts/sparql.vim'
"Plugin 'vimwiki/vimwiki'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
" Plugin 'jeetsukumaran/vim-indentwise'
"   gc: gcc gcap v+gc :1,10Commentary :g/Todo/Commentary
" MATCHIT(xml mm) **
" Plugin 'LhKipp/nvim-nu'
Plug 'hylang/vim-hy'
" Plugin 'edwinb/idris2-vim'

" Initialize plugin system
call plug#end()


" " --- FZF Plugin Configuration ---
    " " Disable the preview window to save space on small screens
    " let g:fzf_preview_window = []
    " 
    " " Use a new window for fzf (e.g., :Buffers) to make it full-screen
    " " Alternative: let g:fzf_layout = { 'window': 'enew' }
    " let g:fzf_layout = { 'window': 'new' }
    " 
    " 
    " " --- Custom FZF Buffers Command (show only filenames) ---
    " " This section replaces the default :Buffers command behavior
    " function! s:buffers_filename()
    "   let list = []
    "   for n in range(1, bufnr('$'))
    "     if buflisted(n)
    "       let filename = fnamemodify(bufname(n), ':t')
    "       let fullpath = bufname(n)
    "       " Add both the filename and full path to the list, separated by a unique delimiter
    "       call add(list, printf('%s %s', filename, fullpath))
    "     endif
    "   endfor
    "   return list
    " endfunction
    " 
    " " Create a custom Fzf command to use the function above
    " command! BuffersFilename call fzf#run({
    "       \ 'source': sort(s:buffers_filename()),
    "       \ 'sink': 'e',
    "       \ 'options': '--delimiter=" " --nth=1',
    "       \ 'height': '50%',
    "       \ })
    " 
    " " Map a shortcut to the new command
    " nnoremap <leader>b :BuffersFilename<CR>
 

" Here: Block for overriding sensible-settings
" e.g:
" set number
" set shiftwidth=4
" set tabstop=4

" ?? set autochdir


" __
colorscheme industry
set scrolloff=1
" Mappings-timeout in milliseconds
" (default =1000)
set tm=1500

" Color-scheme convenience + report current
" NOTE: Separate 'Color-Scheme Rotator'
"   adds scheme-flip functionality
nnoremap <leader>C :colors <c-d>
nnoremap <leader>CC :colors<CR>

" Source Vimrc
nnoremap <leader>0 :source ~/.vimrc<CR>
" Tab-convenience
nnoremap <leader>1 1gt

" Save file
" +possible TODO: bufdo write
nnoremap <leader><leader> :up<CR>

" ==============================================================
" TODO: ADD BASIC PERSONAL MAPPINGS FROM .VIMRC DESKTOP 2.0
" (e.g. L, H, gL, gH,  etc)
" ==============================================================

" BREAK OUT of Plugin/Mapping-Mode
nnoremap <Leader>Z :norm! 
" preparation for setting
"   Global (File-level Mark)
nnoremap M :norm! m

noremap tt zt | noremap ZT zt
" Simple Visual-Line Highlighter
vnoremap <C-Up> kok$
vnoremap <C-Down> joj$

" Tabs conveniance-mapping
nnoremap GTT gt
nnoremap GT gT

" FOLD-TOGGLING
nnoremap X za
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
nnoremap <silent> X :<C-u>call SafeFoldToggle()<CR>
"" nnoremap <silent> <Space> :<C-u>call SafeFoldToggle()<CR>

nnoremap GX yiW:!termux-open <C-R>"<CR><CR>
" nnoremap gx yiW:!termux-open <C-R>"<CR><CR>

" SPELLING
" Find next misspelled word
nnoremap <leader>SS ]szz
" Correct word under cursor
nnoremap <leader>S z=

" nnoremap ]] :bn<CR>
" nnoremap [[ :bp<CR>
nnoremap <PageDown> :bn<CR>
nnoremap <PageUp> :bp<CR>
nnoremap <Home> :bfirst<CR>
nnoremap <End> :Buffers<CR>
" TODO 2025: MAY WANT TO ADD SOME MORE
" (I.E. TABLAST, BUFFERLAST, ETC)

" GotoNextPrev:
" TODO for VIMRC LINUX:
" up/down = g;/g,
" rt/left = fdl
" s-rt/s-left = vis
"   (v)rt/left = next/prev. vis
" /-Search:
" - REPORT NUM. OF MATCHES
"   DIRECTLY ON SEARCH(=Enter)  ******
"
" TODO: OR nnoremap
" +Possible future TODO:
" Switch order of navigating
"  Changes and Marks
"  (= S- for changes
"   and A- for marks)
" Changes/Edits/Copying --
noremap <Up> g;
noremap <Down> g,
" FOLDLEVEL ----
nnoremap <Right> zr
nnoremap <Left> zm
" Marks --
noremap <A-Up> [`
noremap <A-Down> ]`
" Jumps --
noremap <S-Up> <C-O> 
noremap <S-Down> <C-I> 

" TODO: MOVE FORWARD/BACK BETW.
" - Selections
" - Searches
"  ....

" Go to next Split, plus maximize target-split
nnoremap <leader>WW <C-W>w<C-W>_
" Equalize size of Splits
nnoremap <leader>W <C-W>=
" ----
" Tab-follow Link
nnoremap GF <C-W>gf
" open new tab (on same file)
"   GW
nnoremap GE :tabedit<CR>
" split (on same file)
nnoremap GS :split<CR>

" 'RUN LINE' = e.g. 'evince -p' etc  ***
nnoremap RU ^yg_:!<C-R>"<CR><CR>
 nnoremap UR ^Wyg_:!<C-R>"<CR><CR>
nnoremap EX ^yg_:<C-R>"<CR><CR>
 nnoremap UX ^Wyg_:<C-R>"<CR><CR>

 vnoremap RU g_y:!<C-R>"<CR><CR>
 vnoremap EX g_y:<C-R>"<CR><CR>
" nnoremap <leader>R ^yg_:!<C-R>"<CR><CR>
" nnoremap <leader>E ^yg_:<C-R>"<CR><CR>
" vnoremap <leader>R g_y:!<C-R>"<CR><CR>
" vnoremap <leader>E g_y:<C-R>"<CR><CR>

inoremap zz <Esc>
inoremap Zz <Esc>
inoremap ZZ <Esc>
inoremap zx <Esc>
inoremap Zx <Esc>
inoremap ZX <Esc>

" Set translate-shell transation-language
nnoremap <leader>LA :let g:trans_default_direction = ":en+sv


" TranslateShell Start -----------
" =Default Target Language(s) [**]
"@@@@ let g:trans_default_direction = ":en+sv"
"@@@@ let g:trans_default_direction = ":en"

" ___TranslShell_Langs
" let g:trans_default_direction = ":ru"
let g:trans_default_direction = ":en+is+da+sv+fr+de+es+ru+uk"
" __ let g:trans_default_direction = ":en+is+da+sv+fr+de+es+ru+uk"

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
let g:trans_history_file = '~/.vim/transl/trans_history.csv'
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

" let g:trans_advanced_options = "-brief"  (**)
" +win_height|width (=in characters)

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
" TranslateShell End -----------

"" " Set the default direction for all files with the 'markdown' filetype
"" autocmd FileType markdown let g:trans_default_direction = ":en+is+da"

" TODO TEST: =Possible to use \ to break up Lines?:
" TODO: Set the default direction only for files whose names match a specific pattern
" autocmd BufReadPost *.isl.txt let g:trans_default_direction = ":en+is+da"
" autocmd BufReadPost *isl*.freq.txt let g:trans_default_direction = ":is"
" ":de"
" ":es"
" ":ru"
" ":uk" " Ukrainian
    " is|fo(=faeroese), da, no, la(tin), el(=greek)
"let g:trans_default_direction = ":ar+zh-CN+yue+zh-TW+ja+fa+he+hi+ur+tr+af"
    " arabic, zh-CN(chin), ja(p), fa(rsi)|prs(=dari), he(br), hi(n)+ur, tr(=turk), af(rikaans)
    " yua(=yucatec maya),  =BING
"let g:trans_default_direction = ":fi+cy+ga+gd+pl"
    " fi(nnish), cy(=welsh), ga(=ir),  gd(=scots gaelic), pl(=polish)
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

