" This string appears in the statusline when active
let b:keymap_name = "coptic"

loadkeymap
a ⲁ
v ⲃ
g ⲅ
d ⲇ
e ⲉ
"   =ⲋ
"   =ϛ
z ⲍ
E ⲏ
T ⲑ
i ⲓ
k ⲕ
l ⲗ
m ⲙ
n ⲛ
x ⲝ
o ⲟ
p ⲡ
r ⲣ
s ⲥ
t ⲧ
y ⲩ # or u
F ⲫ
K ⲭ
P ⲯ
å ⲱ
S ϣ
f ϥ
H ϧ
h ϩ
j ϫ
q ϭ
I ϯ
" ----
" https://en.wikipedia.org/wiki/Coptic_alphabet
" Uppercase (unicode)     Lowercase (unicode)     Numeric value   Letter Name[7]  Greek equiv.    Translit.   Sahidic pron.[8]    Bohairic pron.[8]   Late Coptic pron.[9]    Greco-Bohairic pron.[10]
" Ⲁ   ⲁ   1   Alpha   Α, α    a   /a/     /æ/, /ɑ/    /ä/
" Ⲃ   ⲃ [note 1]  2   Beta    Β, β    b   /β/     /β/ (final [b])     /w/ (final [b])     /b/, (/v/ before a vowel [except in a name])
" Ⲅ   ⲅ   3   Gamma   Γ, γ    g   /k/ (marked Greek words)    —   /g/, ( /ɣ/ before ⲁ, ⲟ, or ⲱ)   /ɣ/, /g/ (before /e̞/ or /i/), /ŋ/ (before /g/ or /k/)
" Ⲇ   ⲇ   4   Delta   Δ, δ    d   /t/ (marked Greek words)    —   /d/ (marked Greek words)    /ð/, (/d/ in a name)
" Ⲉ   ⲉ   5   Eey     Ε, ε    ə   /ɛ/, /ə/
" (ⲉⲓ = /iː/, /j/)    /ɛ/, /ə/
" (ⲓⲉ = /e/)  /æ/, /ɑ/
" (ⲓⲉ = /e/)  /e̞/
" Ⲋ   ⲋ   6   Soou (6)    ϛ
" Ϛ, ϛ*
" s͡t[note 2]  
" Ⲍ   ⲍ   7   Zeta    Ζ, ζ    z   /s/ (marked Greek words)    —   /z/ (marked Greek words)    /z/
" Ⲏ   ⲏ   8   Eta     Η, η    aa, ê   /eː/    /e/     /æ/, /ɑ/, /ɪ/   /iː/
" Ⲑ   ⲑ   9   Theta   Θ, θ    th  /th/    /tʰ/    /t/     /θ/
" Ⲓ   ⲓ   10  Iota    Ι, ι    i   /iː/, /j/   /i/, /j/, /ə/ (ⲓⲉ = /e/)    /ɪ/, /j/
" (ⲓⲉ = /e/)  /i/, /j/ (before vowels), /ɪ/ (after vowels to form diphthongs)
" Ⲕ   ⲕ   20  Kappa   Κ, κ    k   /k/     /kʼ/, /k/   /k/
" Ⲗ   ⲗ   30  Lola    Λ, λ    l   /l/
" Ⲙ   ⲙ   40  Mey     Μ, μ    m   /m/
" Ⲛ   ⲛ   50  Ney     Ν, ν    n   /n/
" Ⲝ   ⲝ   60  Exi     Ξ, ξ    ks      /ks/ (only in Greek loanwords)  /ks/, [e̞ks] (usually following a consonant, or sometimes when starting a word)
" Ⲟ   ⲟ   70  O   Ο, ο    o   /ɔ/ (ⲟⲩ = /uː/, /w/)    /o/ (ⲟⲩ = /u/, /w/)     /o̞/ (ⲟⲩ = /u/)
" Ⲡ   ⲡ   80  Pi  Π, π    p   /p/     /b/     /p/
" Ⲣ   ⲣ   100     Roo     Ρ, ρ    r   /ɾ/~/r/
" Ⲥ   ⲥ   200     Seema   Σ, σ, ς     s   /s/
" Ⲧ   ⲧ   300     Tau     Τ, τ    t   /t/     /tʼ/, /t/   /d/  (final [t])    /t/
" Ⲩ   ⲩ   400     Upsilon     Υ, υ    u   /w/ (ⲟⲩ = /uː/, /w/)    /ɪ/, /w/ (ⲟⲩ = /u/, /w/)    /i/, /w/ (between "ⲟ" and another vowel except "ⲱ"), /v/ (after /ɑ/ (ⲁ or /e̞/ (ⲉ)), /u/ (digraph "ⲟⲩ")
" Ⲫ   ⲫ   500     Phi     Φ, φ    ph  /ph/    /pʰ/    /b/~/f/     /f/
" Ⲭ   ⲭ   600     Chi     Χ, χ    kh  /kh/    /kʰ/    /k/
"     /k/ (if the word is Coptic in origin), /x/ (if the word is Greek in origin), /ç/ (if the word is Greek in origin but before /e̞/ or /i/)
" Ⲯ   ⲯ   700     Epsi    Ψ, ψ    ps      [bs] (only in Greek loanwords)  [ps], [e̞ps] (usually following a consonant)
" Ⲱ   ⲱ   800     Oou     Ω, ω    ô   /oː/    /o/     /oː/    /o̞ː/
" Ϣ   ϣ   —   Shai    (none)  š   /ʃ/
" Ϥ   ϥ   90  Fai     ϙ (numerical value)     f   /f/
" Ϧ (Ⳉ)   ϧ (ⳉ) [note 3]  —   Khai    (none)  x   NA  /x/
" Ϩ   ϩ   —   Hori    (none)  h   /h/
" Ϫ   ϫ [note 4]  —   Janja   (none)  j   /t͡ʃ/    /t͡ʃʼ/, /t͡ʃ/     /ɟ/     /g/, /dʒ/ (before /e̞/ or /i/)
" Ϭ   ϭ [note 4]  —   Cheema  (none)  c   /kʲ/    /t͡ʃʰ/   /ʃ/     /tʃ/, [e̞tʃ] (usually following a consonant)
" Ϯ   ϯ [note 5]  —   Ti  (none)  ti  /tiː/   /tʼi/, /ti/, /tə/   /di/    /ti/
" Ⳁ   ⳁ   900     Sampi   Ϡ,ϡ
" ----
" w       __lg
" =oo
" ϣ
" sh      __lg
" =sh
" ϥ
" f       __lg
" =f
" ϧ
"     H       __lg
" ϩ
" =h
" h       __lg
" ϫ
" d_      __lg
" =dj
" ϭ
" c       __lg
" =ch
" ϯ
" t_      __lg
" =ti
