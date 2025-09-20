
" ___TranslShell_Langs
let mapleader = ","

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

set autochdir


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

