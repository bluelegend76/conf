$NewColorsDir = "../colors/MoreColors2021"

# ln -s ../MoreColors2021/molokai_dark.vim
# ln -s ../MoreColors2021/solarized8_dark_high.vim
# ln -s ../MoreColors2021/molokai.vim
# ln -s ../MoreColors2021/holokai.vim
# ln -s ../MoreColors2021/gotham.vim
# ln -s ../MoreColors2021/navajo-night.vim

# Original bash command: ln -s ../MoreColors2021/molokai.vim
$NewColorsDir = "../MoreColors2021"
$ColorSchemes = @(
    "molokai.vim"
    "holokai.vim"
    "molokai_dark.vim"
    "solarized8_dark_high.vim"
    "gotham.vim"
    "navajo-night.vim"
)

foreach ($ColorScheme in $ColorSchemes) {
    New-Item -ItemType SymbolicLink -Path $ColorScheme -Target "$NewColorsDir/$ColorScheme" -Force
      # -Force to overwrite if link exists
}

