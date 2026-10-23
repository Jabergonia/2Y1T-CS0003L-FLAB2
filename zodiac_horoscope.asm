SYS_EXIT   equ 1
SYS_READ   equ 3
SYS_WRITE  equ 4
STDIN      equ 0
STDOUT     equ 1
MAXLEN     equ 30

%macro PRINT 1
    mov esi, %1
    call print_string
%endmacro

section .data

msg_name      db "Enter your name: ", 0
msg_bad_name  db "Name cannot be empty. Please try again.", 10, 0
msg_month     db "Enter birth month (1-12): ", 0
msg_day       db "Enter birth day (1-31): ", 0
msg_inv_month db "Invalid month! Please enter a number from 1 to 12.", 10, 0
msg_inv_day   db "Invalid day! Please enter a number from 1 to 31.", 10, 0
msg_inv_date  db "Invalid date! ", 0
msg_has_only  db " has only ", 0
msg_days      db " days.", 10, 0
msg_feb29     db "(February 29 is not accepted because no birth year is collected.)", 10, 0
msg_retry     db "Please enter your birth month and day again.", 10, 10, 0
msg_hello     db 10, "Welcome, ", 0
msg_excl      db "!", 10, 10, 0
msg_nl        db 10, 0

hdr_sign      db "=======================================", 10
              db "         YOUR ZODIAC SIGN", 10
              db "=======================================", 10, 0
lbl_sign      db "Zodiac Sign: ", 0
lbl_element   db "Element: ", 0
lbl_symbol    db "Symbol: ", 0
lbl_dates     db "Dates: ", 0
lbl_trait     db "Personality: ", 0
lbl_lucky_no  db "Lucky Number: ", 0
lbl_lucky_col db "Lucky Color: ", 0

menu_text     db 10
              db "=======================================", 10
              db "            HOROSCOPE MENU", 10
              db "=======================================", 10
              db "[1] Love and Relationships", 10
              db "[2] Career and Studies", 10
              db "[3] Health and Wellness", 10
              db "[4] Lucky Number and Color", 10
              db "[5] View Zodiac Information", 10
              db "[6] Exit", 10, 0
msg_choice    db "Enter your choice: ", 0
msg_inv_menu  db "Invalid selection! Please choose a number from 1 to 6.", 10, 0

hdr_love      db 10, "LOVE AND RELATIONSHIPS HOROSCOPE", 10, 0
hdr_career    db 10, "CAREER HOROSCOPE", 10, 0
hdr_health    db 10, "HEALTH AND WELLNESS HOROSCOPE", 10, 0
hdr_lucky     db 10, "LUCKY NUMBER AND COLOR", 10, 0

msg_return    db "Return to menu? (Y/N): ", 0
msg_inv_yn    db "Please answer Y or N.", 10, 0
msg_bye       db 10, "Thank you for consulting the Mystic Zodiac Oracle!", 10
              db "May the stars guide your path. Goodbye!", 10, 10, 0

days_in_month db 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31

mn_1  db "January", 0
mn_2  db "February", 0
mn_3  db "March", 0
mn_4  db "April", 0
mn_5  db "May", 0
mn_6  db "June", 0
mn_7  db "July", 0
mn_8  db "August", 0
mn_9  db "September", 0
mn_10 db "October", 0
mn_11 db "November", 0
mn_12 db "December", 0
month_names dd mn_1, mn_2, mn_3, mn_4, mn_5, mn_6, mn_7, mn_8, mn_9, mn_10, mn_11, mn_12

welcome_art:
    db "=======================================",10
    db "       THE MYSTIC ZODIAC ORACLE",10
    db "=======================================",10
    db "  .  *     .    +    .    *    .   *  ",10
    db " *    .  +    .   *    .    +   .    *",10
    db "           _.-~~~~~~~~~~~-._",10
    db "       .-'*    .    +    .   '-.",10
    db "    .'.    *     ~~~~~~~~     .  '.",10
    db "  /+    .    ~~   .-~~~-.   ~~    . \",10
    db " |.     *    ~    .~ ( @ ) ~.    ~   |",10
    db " |*    .     ~~    `-~~~-`    ~~     |",10
    db "  \.    +    ~~~~~~~~~~~~~~~~~    + /",10
    db "    `.*    .    ~ ~ ~ ~ ~ ~    . .'",10
    db "       `-..   *   ~ ~ ~   *  .-'",10
    db "           `-.__~~~~~~~__.-'",10
    db "            _|~~~~~~~~~~~|_",10
    db "     *     /__\_________/__\     *",10
    db "          /____\_______/____\",10
    db "     ~  ~ ~~  ~  ~~  ~  ~~ ~  ~  ~  ~",10
    db "  .  *   ~~  .  *   .  *  .  ~~  *  .",10
    db "      * DISCOVER YOUR DESTINY! *",10
    db "=======================================",10
    db 0

title_aries: db "Aries",0
name_aries: db "ARIES",0
sym_aries: db "Ram",0
date_aries: db "Mar 21 - Apr 19",0
trait_aries: db "Bold, energetic, and ready to lead.",0
color_aries: db "Red",0

title_taurus: db "Taurus",0
name_taurus: db "TAURUS",0
sym_taurus: db "Bull",0
date_taurus: db "Apr 20 - May 20",0
trait_taurus: db "Patient, reliable, and devoted.",0
color_taurus: db "Green",0

title_gemini: db "Gemini",0
name_gemini: db "GEMINI",0
sym_gemini: db "Twins",0
date_gemini: db "May 21 - Jun 20",0
trait_gemini: db "Curious, witty, and adaptable.",0
color_gemini: db "Yellow",0

title_cancer: db "Cancer",0
name_cancer: db "CANCER",0
sym_cancer: db "Crab",0
date_cancer: db "Jun 21 - Jul 22",0
trait_cancer: db "Caring, intuitive, and protective.",0
color_cancer: db "Silver",0

title_leo: db "Leo",0
name_leo: db "LEO",0
sym_leo: db "Lion",0
date_leo: db "Jul 23 - Aug 22",0
trait_leo: db "Confident, creative, courageous.",0
color_leo: db "Gold",0

title_virgo: db "Virgo",0
name_virgo: db "VIRGO",0
sym_virgo: db "Maiden",0
date_virgo: db "Aug 23 - Sep 22",0
trait_virgo: db "Analytical, practical, and diligent.",0
color_virgo: db "Navy Blue",0

title_libra: db "Libra",0
name_libra: db "LIBRA",0
sym_libra: db "Scales",0
date_libra: db "Sep 23 - Oct 22",0
trait_libra: db "Charming, fair-minded, and peaceful.",0
color_libra: db "Pink",0

title_scorpio: db "Scorpio",0
name_scorpio: db "SCORPIO",0
sym_scorpio: db "Scorpion",0
date_scorpio: db "Oct 23 - Nov 21",0
trait_scorpio: db "Passionate, determined, and mysterious.",0
color_scorpio: db "Crimson",0

title_sagittarius: db "Sagittarius",0
name_sagittarius: db "SAGITTARIUS",0
sym_sagittarius: db "Archer",0
date_sagittarius: db "Nov 22 - Dec 21",0
trait_sagittarius: db "Adventurous, optimistic, and honest.",0
color_sagittarius: db "Purple",0

title_capricorn: db "Capricorn",0
name_capricorn: db "CAPRICORN",0
sym_capricorn: db "Sea-Goat",0
date_capricorn: db "Dec 22 - Jan 19",0
trait_capricorn: db "Disciplined, ambitious, and responsible.",0
color_capricorn: db "Brown",0

title_aquarius: db "Aquarius",0
name_aquarius: db "AQUARIUS",0
sym_aquarius: db "Water Bearer",0
date_aquarius: db "Jan 20 - Feb 18",0
trait_aquarius: db "Inventive, independent, and humanitarian.",0
color_aquarius: db "Turquoise",0

title_pisces: db "Pisces",0
name_pisces: db "PISCES",0
sym_pisces: db "Fish",0
date_pisces: db "Feb 19 - Mar 20",0
trait_pisces: db "Dreamy, compassionate, and artistic.",0
color_pisces: db "Sea Green",0

elem_0: db "Fire",0

elem_1: db "Earth",0

elem_2: db "Air",0

elem_3: db "Water",0

art_aries:
    db "",10
    db "",10
    db "                                                           '=xOOOox~'",10
    db "                                         .'::::`.        '*%@%XXO#%@#=.",10
    db "                                     `=oX%%%%%%%%Xo+:  .:X@@O*+*oOX#@@+",10
    db "                                   :o%@#X*x=;+-xxo#@@X#%@@@@XOoO%@%%#@#'",10
    db "                                 '*%%O*~+xXooOoO=+o+X@@O--;=xX%@@@@@#%%;",10
    db "                                .o@%==o@@%%%##%@%#o*+O@x      `+#@@@@@%`",10
    db "                                +@%xOOX%@@@###@@@@#X%@O;:-===+OXX@@@%@O -x+.",10
    db "                                o@X=*O@@@O*oX#%%#%%#o-`oXO*=*=;`'o@@@@-+%@%-",10
    db "       '`.                     .O@o=+O@@X#@#OX%##XO;    -x*:     .*%@%%@%@%;",10
    db "    .=X%%#:                     x@%xxX@@Xo%%XOO#%@X*'  .o@%=       ~#@%%@%=",10
    db "    x@#=%@~     ';+xxxoOO***+~-~x@@OxoX@@%XooOX%%#xX='  ':`.      . 'x@%x;",10
    db "   `#@o.o@#=`-xX%@%OoOo*xX##X#%#X#@@#x*x#@@%#%@@@@o%X=:'         :X#ox%%-",10
    db "   *@@X=:=O@%@%o=;` =x=`  ..;+:. .=X@@##XOooOO#@@O'*%%Xx--;`. .xO-;=X#%%-",10
    db "   ~%@XO+-*@%*:=o*; =+' '   -*. .-; -o#@@@@%@@%O=`' -O%@%%%##XooX###@@@*",10
    db "    -#@@#X%%x:.*x:    `++.      `x*' ':;=**+~;.  =*:  :+O#%%@@X#%%%%#o;",10
    db "     ;O%@@%+==`:~' '  :x=        -='    .'.`.    .:~;:~~*O#%@%- .'''",10
    db "       '#@X=o=.   ~+`  ..   '.            .*+-.  ''  `=*~~=%@o",10
    db "       `%@o-O*.   ;+`     .*o:     '=;     .``   -O=:'.`+oo@@+",10
    db "       ;%@O`-+='       :;..oX*.    'oO='        ''~+;'=xxx%@@%#O*:",10
    db "       `%@O~=oO*'     'oX+'.-+;     '--.        ~X*;-~=*+#@@#x*o%%*.",10
    db "        *@@x::=x-   ';+%%**=:'. -*;' `':`.      ;X@OoOXX%@@@%#O==@%`",10
    db "      :+X@%+-    ':~+o%@Xx*Oox+`:xo=;ox`-*`.    =O%@%@@@@@@@@@@o=@%`",10
    db "     =%%Ox-;~;-;:;-o#@@@%%#oOx+~***~~#@X**=-. ':' .;+o%@X=-:o@@oX@o.",10
    db "     X@+''~+*+xxO#%@@@@@@@@@%XOoooXOoo%@@#o*+**oOx*~` `X@=:X@@%o%%;",10
    db "    -%@=~O%@@%%@@@@@@@@@@@%XX%%%@%%@@%%@%##%%@%##X%@x.'#@~O@@@@@%~",10
    db "   ;#@X+O@%~;:-%@@@@@%#Ox=:  ...:~=--~~-`. `::'  ;#@x'o@o'~%@@@#;",10
    db " -o%@%*o@@+.-o%@##@@O'.                        ;O%@X-x@#:  `*o+'",10
    db ";%@@@@X@%+.=@@@@X%@O`                         .O@@@#O@%-",10
    db ":X@@@@%o;  *@@@@%X+'                          .o@@@@#x:",10
    db " .xOx+`    `++=~`                              .-*x~.",10
    db "",10
    db "",10
    db "                               ~ A R I E S ~",10
    db 0

art_taurus:
    db "",10
    db "",10
    db "",10
    db "                                                                .-oO:",10
    db "   '=*=                    :~`                                 :O@@%`",10
    db "  -#@@O                  .:%@%o***+=-:.                       'X@%@@#+.",10
    db " -%##@;              :=xX#%@X#@OxxoO#%%X*-.                   `%@%%%@@+",10
    db " x@o*@O;. .;~==~~-+o#%#O+-o@x*@O     ';*O%#o-.                 *@@@@@@x",10
    db " +@%=*X%%X%%XOOOXXX#%#ooX%%x-#@O      '-*=+O%%O*-`              ~o#%@@%O=.",10
    db " 'o@%OxoX@O~--:;'. -@X*+==~*X@%;       .:;---~*O#%%##XXXOOo*-'     .-x%@@X;",10
    db " .~O@@@@@O==*x+x++'=@#XX#%%@%o:             .     ':;;~=~=xO%%o;      `X@@#`",10
    db "~#@%%%@@#`  .`'..  `+O#@@@@@%X*'                      :=~.  `+X@O-.    -@%@=",10
    db "-X%%%@@@O;      ':`  'O@@@#XoX@O                       `'    ;*O@@X*~;+#@%%:",10
    db "  `-~~O@O~     .O@#. .+%@@%%%Xx;                             .~*X@@%%%%%@#~",10
    db "     ;%%-.      :=; .;+X@o+;'                                 ~*o@@XXXOx~'",10
    db "    ~%@o+==~-'    .:=+x@%=~-                                  `=O%@-",10
    db "   ~@X*+***xo#x'';+oOX@@o++~                                 `~xO%@-",10
    db "   =@#%= `#@*-@=xX%@@@%Xox*:           `-.         -x'       ;=OX@%:",10
    db "   'O@Oox*x+~o@%@@@@@#Xox=:''          ;%*-.    '-~o@~.      ;-x#@x",10
    db "     ;+o#%%%%%X*:+%@@%XX*` ~*;.       -=@O=~;``:=xoX@#+=`     ~o@@-",10
    db "          ...     ~%@#oox-`-#o-      `~X@XxoxxooXX#%@@%x+;'   ;O@#.",10
    db "                   x@@@o*+**#@x.    :=X@%#XOX#%@@@@@@@@@X*=~` '+%@=",10
    db "                   :%@@@@@%##@@*   :x%@@%%@@%Xo+x%@@@@@@@%%X*` '=%@;",10
    db "                   .O@#@@@@XX#@#. `+%@#Oo*=:.    -%@@@@@x'-o@X:=x@%:",10
    db "                    o@oX@@#' .#%~=+o@%-         'O@X#%@o.   X%~=X@x",10
    db "                   :%%xO@@x   x@+:-#@O.        `X@@#%@%:   -%#'-#@=",10
    db "                  :#@@@@@@-  .o@=.-%@-        .O@@@@@@+   :%@%##@%`",10
    db "                  x@@@@@@X.  =@@%%#@%;        .=oOOOx='   o@@%@@@O",10
    db "                  :=xxox*;  `#@@@@@@#.                    =oOXOo*:",10
    db "                            '+oXXOo*:",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "                              ~ T A U R U S ~",10
    db 0

art_gemini:
    db "",10
    db "",10
    db "          .;+xOOOOooOXXOo+;.                    .:+xoOXOOoOOOOx+;.",10
    db "        :x#@Xo+=~=+x*==*o#%#*'                '+X%#Ox*~*o*=~=*O#@#*`",10
    db "      .*%%o~~;  .`;%@O***oxX@#-              ~#%O*+**xO@%- ..:=**X@%=",10
    db "     .x@%Ox+=~-~=*%%*X%XOx*xo@%:            -%%OxxxO#%X*@%+~~--=*oX@@+",10
    db "     ~@@#OOOxx**O@#;  -x#%%%##@X.          'X@%%%%@#x-. ~#@XxxoxoX#%@%`",10
    db "     x@@%###XX#@%*'     '+OxX@@%-          ~@@@OoO+.     `*%@%###X%%@@-",10
    db "    .O@@%%@@%X*+*;   `~` *@O:%@%X'        '#%@X'o%x :~'   -x+xX@@@@%@@*",10
    db "    'X@%X%X+` 'O%o   'O#`-o+;%@@X'        '#@@X`+X~:#X`  .O%o  `+o%X@@O",10
    db "    `%@#xx-. :=++;-+==oO*=*+*@@@~          ~@@%=+++*xO+++--*+=` '-OO%@#'",10
    db "   .x@@@@@@#=`;-;'+%%#%@%- :#@%@O`        `O@%@X: -#@##%@x`~-:.=#@@%%%@x.",10
    db "  -X@%XXX%@@@O=`   ;=++~:~o%@%##@#~      ~%%XO@@%o~:=++=;.  `+X@@@@###%@X-",10
    db "  *@@##O#%@@@@@%#OoxxoO#%@@@@%%@@%~      ~#@%X%@@@@%XoxxxoO#@@@@@@%#%##%@*",10
    db "  .-O%@#%%@@@@#ox%@XOo%@*x#@@@#o='        '=O#@@@#x*%#oX#@%oo%@@@%%#%@%O=.",10
    db "     `~xo#@@X='  :xOXXo- :~;x@#-            -#%o;-` -xXXXx:  `*#@@Xox~`",10
    db "        `#@%=.=*`        ~%*+@@#~.        .~#@%+x@~        ;*~.*%@O'",10
    db "      .=#%O%@#@#;        '#@@X+O%X='    '+#%O=X@@%:        -%@#@#O@#=.",10
    db "    '=X%o:*%@@@X*~-;;;-=*x%@%@X+~x#%OOoX%#*-=O%%@@o*+~---~=*#@@@#=;o@X=`.",10
    db "'*X#%%o~x#@X#@@%@@@@@@@%@%#@x=O%%Xx+X@@o=xX%#o~o@%%@%%@@@@@%%@@XO%#x~o###X*'",10
    db "+@@#*-O@X*;O@%Ox+o*xx~*;~o-%%- .;+%@@##@@#+;. -@#;x+=*+~+o+*oX@@x:+X@X-~X@@+",10
    db ";oXX%@%~ 'O@%ox=-:';- `..:'=@X'   :*X%#O+'   'X@-':'```. :~~*oO@@*  =%@@XXO-",10
    db "    -=: 'O@@XO+`.          .o@+      .       +@o          '.:*O#@@x' ;=-.",10
    db "        ~%@%X*;.           `=@#.            .X@+`.          .;o#%@%;",10
    db "         `=o@@%#Xox***xoOX#%#O=.            .+O#@#XOox***xoO#@@@o~'",10
    db "         .~#%o*X@@XoO@@%XO@x.                  .O@OX%@%ooX@%o+x@X-",10
    db "        -X@#-'*%%*' '#@='o@~                    =@O.=@#` .+%%+`~X@O;",10
    db "        o@@*~#%x:    X@~`#%`                    ;@#.~@O.   ;o%%==@@x",10
    db "        =@@%%@-      o@=`X%x;                  ;*@%:*@x      ~@%%@%-",10
    db "         =%@@O'      *@%##%@%x               .*@@@%%@@*      'X@@%~",10
    db "          ;++'       .~*oOOOo=                ~oOOOOo=`       :=+:",10
    db "",10
    db "",10
    db "",10
    db "                              ~ G E M I N I ~",10
    db 0

art_cancer:
    db "",10
    db "",10
    db "           `;;;`                                             ~OOOo*~:",10
    db "      .;*O#%%%%%X;                                           ~%@OxX%%X='",10
    db "    `*#@#o=;:*%%x`                                       .~*=.=%@x `=X@#=.",10
    db "  .+%@X~.  ;#@O``~;                                     'O@@@='#@%'  .+#@*",10
    db "  x@%x;   `#@@~-#@@+                                   .x@Ox@#:X@%`   ;+#@=",10
    db " +@%+~`   *@@O*%@X@%'                                  `#%-~#@#%@X'   -*O@#`",10
    db "`X@Oo~`   *@@%@#*;%%`    .-*xx+:           .-*xx=`     `#%-;+O@@#-    -xO@@-",10
    db "-@%oox:   :%@@O+=o@X.   `O@###%%~         'o@X#%%%=     *@X+O%%x'    ;+OX@@-",10
    db ";%@##o=.   -X@#oX@%;    ~@%%@@o@O         -@#@@@O@X.    'X@%O+'    .:=xX%@%:",10
    db " x@%#Xx*;. .'=#@@#-     `o@%#X%#-         'o@%#X%#-      ~%@o=:   `;+xOX@@=",10
    db " 'O@@%#Ox*+*xx%%*'       .-o@%%#xxoOOOOOOoxx@@@%='       .~#@%O*=+ooOX#@%+",10
    db "  .*#@@@%%%@@@O-      .;+oX%@##XOo*+++++*xxoO%@@#Ox~`      .=%@@@@@@@@%O;",10
    db "    `#@@%Xo+X@*    .~o#%#Ox+-'.. .-~   :+`   `--xoX%%O+`    =@#;+#%@@#;",10
    db "     ;%@%Oo*%@%o;.~#@#*:=Xox*-   'O@O*x%%;   ;ox*x*:=X@%x`-x#@@ox#@@@+",10
    db "      ;x#@@@%ox#@#@#*`  `;;;`.    .-+xx+`     ';-;:. `=O@%@%OxO@@@%o-.",10
    db "        .=%@@@##@@#=-'                               '=xo@@#%%%@%O`",10
    db "          '-*oX%@%~`.                                .:--#@%Xox~`",10
    db "        :=oOXOOX@%+~`                                .--~#@#OXXXOo~'",10
    db "      -O%%@@%%%@@@Xo=:.                             :~~*x@@@@%##@%@#*'",10
    db "     ~%%X%@#O#%%@@%-=x;                         `:`:*-+*#@@@%#XO%@#%@O.",10
    db "    ;%@%@O+O%%X#@@@#x+~=-`:.                  '`::;~*oo#@@@%#O%#x*%@@@*",10
    db "    *@@X~x@%@@%@%%@@@Xx*==~`'..             :-==~++*O#@@@@@@@@@%%%~*%@O.",10
    db "    ;x+'*@%@@o+X#%@@@@@Xx+*~~~+;     .':--:;;+*++*o#@@@@@%%%X+#@%@%::*~",10
    db "       '#@%@*+@@%%@@#%@@@@#XOxx+==~;-~=+++*xooOX#%@@@@##@%#@@#-X@@@+",10
    db "       .#@%+;%%%@X=x%%#@@%O#%@%%###XXOXXX#%%@@@%XX@@%#@X~*%@#@*'o@@+",10
    db "        -*~ =@%@%;'#@@@#='  ';~*xooOOOOOoox+=~;`  ;o@@%@*.*@@@x .+*'",10
    db "            `X@@o..O@%@X.                          ~@%%@= :#@@~",10
    db "             :oo:  :O@@%-                          X@@%+.  +O*.",10
    db "                    .-xo:                          *o*`",10
    db "",10
    db "",10
    db "",10
    db "                              ~ C A N C E R ~",10
    db 0

art_leo:
    db "",10
    db "",10
    db "                                            .'*XX##@@@%@%O%@#oOXX;'.",10
    db "                                         `xX%%@@%#Ooooo~*#@*OO#%%@@#=.",10
    db "                    :OXXO*-            `+X@@@%#Ox=;`-~*x+--*=x+=xO%@@#+.",10
    db "                    '=X@@@@O;        ;o%@%#%%##Xo=xooX%%##x##@%#%@##@@@X'",10
    db "                     `X@@%#@%*      =%@@##@#o##%@#X#%@%##%@@@#X@@@@%#%%@*.",10
    db "                     *@@%%X#@%:     =@@@o#@xX@@%OX@X+`   .-=;  :*#@@@#%@X'",10
    db "                     +@@@@%%@%:    ~%@@%x#@%%@%x#@x`+oo*:;-' ;xxO##@%O~X@O'",10
    db "                     `o@@@@@%+.  .*%@@%oxoo@@XO%@*..`o@@#OO~;+OX#X*@@xo%@@o.",10
    db "      '-*oOXXXXOOoxxoX%%%@X='    'x@@@%%O-x@XoX@X' '`:-+~'+%@@%@@%o@@o=*#@*",10
    db "   .=O%%%%#%%%%%%@%%%%%%X*'      'O@@@@%o+xO++#@o:.;=x%@O+-;*O@%o;+%@XoO#@%-",10
    db "  ~#@%%@#x+~-;;;-=++=-;`         +@@@@@%O*xo~o@@X=`;-~#@X*~=xX@%Xxo@%O+x%@@*",10
    db " =@##@O;.                      .:#@@@@@@##X;*O%@@o~+;.'X@@@@@@@@@#@O~~=~#@X;",10
    db ":%%o@o.            .`;~==++**oX#@%#o@@@@@%=xX+O#@@%o+:'%@@@@@@@@@@X+*`oXX@x",10
    db "=@XX@=         .;*O#%#XOoooxx*+~;-+=@@@@@%OXo-+O#@@@@#;#@#OX#@@@@#xx*~O@@@=",10
    db ":%@o%%~.    '-x#@#o*-:.          .-;X@@@@@@##o';xO#%@@Xo@@@X=*@@@#=~;~#@@X.",10
    db " =%%OX%#XOX#%@@%=`;;'               :*O@@@@@@#o~`~xX%@@xO%%%##%%%%~X##@%;'",10
    db "  ;O%%%#X###%@%~                      ;#@@@@@@@#o+~+o%@@O~:' .;*%%*%@@@x",10
    db "    `=xOXXXO@@*~                       ~##%@@@@@@%O*+x#@@@%#X#@@%X%@@@O'",10
    db "           -%#~`       .*x`         `;   '=%@@@@@@%#O+*X%%#X#XXX#%@@O=.",10
    db "           *@O-.      ;x@%x=---;' '~#o     -oX#@@@@@@@X%#XO%%@@@@@#~.",10
    db "          ;#@o+'    '=o@@@%#Xoxx*=*%@+.     .;#@@@@@@@@@%@@@@@@@%x'",10
    db "       .~o%@O;' .`~=*X@@@@@@@@@%%X#@@o=`    :#@@%@@@@@@@@@@@@@%@+",10
    db "       =@%*: '~+*O#@@#@@@@@@@@@OO#%@@@O~.   -@@@@@@@@@@@@@@%O*~%%~",10
    db "       x@O~'.x@%XOx+:+@@@@@@@#~  .`;o@%x:   '#@#Oo#@%%#O%@@%O='~%%-",10
    db "       o@o~.:%%;     'x@@@%@@@o+~:. .*@%=`   x@x. `;`'  :o@%O*-.-#%x+~:",10
    db "       X@o-.~@@Xx:    .+%@%##%@@@@O`  =%#*` .:#@Oo+'     .~%@Xx; :xx#%@o'",10
    db "       X@x`oO=#X@O      -#@@%%@@@@@-   +@#= `*+=##@#:      :O@%o=~#Ox%%%;",10
    db "       -O%#%@%%%#*       '~+*xx**=;.    +%%o+X%*#%%@-       .-xOX####Xo=.",10
    db "          ':::`.                         '=xoOoooo*-.",10
    db "",10
    db "",10
    db "",10
    db "                                 ~ L E O ~",10
    db 0

art_virgo:
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "                     `~xoOXXOxxx*~`                                        #",10
    db "                   -O%O*+-~++O@XxX%X+.                                     #",10
    db "                .;o@#oo+-~=~=*%@x-=o%X;             .;`                    #",10
    db "               :o@@%@%%%O+=+x#%X%Xo*x%%:        '-xxX#:                    #",10
    db "               x@@@%%%%%o+oX%O;.+#%XoX@x      .~o%@#@X=                    #",10
    db "              .#@@@%@%%##%@o:    -xO%%@O ..  `+%@%%%%x.                    #",10
    db "               =@@%%%%X=:=~;. :;.;~-o@@O'*O`:O@@@%%%*`                    ;%",10
    db "               *@@@xO-..`oXo' =%~oX*o@@Oo#%OO%%@%@#~.:';.                -X@",10
    db "             .~%%X%%##*-+=: ''*O-;=*%@%*@@@%#%@%%Oxx#%#OoXo`             oX%",10
    db "           '+#%Ox*o#%@@o:   *OOo~.+%%%OO@@@O##xO#%@%@@%%%*.              oX%",10
    db "      '.  ;##oxxoxOX#@@@@Xx+~;-+o#@%X#%*@@X%#X%%@%%%%@#x;.               -X@",10
    db "  :oOX#O*`O@xoOOOoOX#@@@@@oooO@@@@@%Xo%#@X%oX@@%@%%O*-'                   ;%",10
    db " -O#X##X@+O@X%X#%#X%@%%%%*`   ;O@%%@%O%@##X%XOX%@Xx=;                      #",10
    db "~#OO@@%X%#X@@%@@%@@o*-#xo%#XOXXXXx=;o@@@%%#X%@%%%@%@%X*'                   #",10
    db "~o#XX@OXXX@@%%#%@%oX%#@*~=#o=====::#%%%@@%#O#%@%@@#XX+-'                   #",10
    db "  =o*x%#XO#@@@@@X%#@#@%#*-'*Oo+.  O#o~`X@XXXXXo=`:'.                       #",10
    db "   =X%%%%##@%%%%@%@@@@@@##XO*-.  -%@o' X%@X~~+O%#-                         #",10
    db "   =%%%@%##-o%@%#%%#%@@@@XxO%@*`x@@@@X`*%%%;   `+=                         #",10
    db "   -OO%##OO#@@#O%%%%%##O=..~#@%#@@%@@%: -O@x                               #",10
    db "      '+X%%o-%*+O+:. .`~xO%@@%@@@@@@@%*' +@o                               #",10
    db "      `oo*~ .X#-:;~*o#@%XOoO%%%@@@Xx#@%O+#%-                               #",10
    db "             ;oX#%@%#%Xx~+-X##%%@#*ox@%oox;                                #",10
    db "                x@x**=+;.:;*O%%X%+:~-x@+                                   #",10
    db "               'x=....'     -~O``.   .x*                                   #",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "                               ~ V I R G O ~",10
    db 0

art_libra:
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "                               '~++=xOo+;:`.",10
    db "                              -%%oX@%+o@@X#%O*+`",10
    db "                        ';=*oO%@o'~@%;.#%`;%%x%%x=;'",10
    db "        `+oo*-      `=xX%%#XO#%@%%%%%@o%#'-@O'#@X#%%Xx=`      -*oo+:",10
    db "       -%%#%@@x~+xO#%#XooX%%@@X~-~~O%@@@#*%@XX@@#OOooOX##Ox=~*%@%#%%~",10
    db "       ;%@%@@%#%%####%@@%XOo@@~ *%@@@@@%@@@%@@@%OO#%@%#OOXXX#%%@@%@%~",10
    db "        :x@@@@%%%##Xo*=:.  `%%` '~+x#@#OOx+-+*%X'  .`~+oO##%%%@@@@o;",10
    db "        :#%%#%O:'.         .x@o`    '*%o~;..+X@+          .'`x%%@%#-",10
    db "       ;#%-%O+@O.           .*@#+'    -~  :*#@X'           .o@ox%;#%~",10
    db "      :#%~'%O.=%x.            ~X@#='    .-o%@#:           .*@x'x%`:X%-",10
    db "     ;##; .%O. =@o'            .x@O~'   :oX@%:           'x@*. x%: `X%~",10
    db "    -%#:  .%o.  *@O'            *@x      =o@%:          'o@x.  x%:  `X%=",10
    db "   -%#:   '%o   .+%O`           o@+      ~*%#`         'O@*.   *%;   `O%=",10
    db "  ~%X`    .%o.    +@X`          X@~      ;~%%;        'O@x     *%;    'O%=",10
    db "'+%%ooOOOOX@%OOOOoxO@#-         #@;      :~#@-       ;X@XoOOOOX%@XOOOoox%@*'",10
    db "*@@@@@@@@@@@@%@@@@@@@@%`       '%%`      .-#@~       #@@@@@@@@@@@@%@@@@@@@@*",10
    db "-#@%OOXXXX########%%@@o.       -%X'      :~#@+       *@@#OOXXX########%#%@#-",10
    db " '+X%#O*=~~+O###%@@@X=.        +@x       ;*X@*       .;o%%Xx=--xXOX#%@@@X+'",10
    db "    `=*OX##%%%#XO*=`           x@+       `*O@o          '-*oX##%%%#XOx+:",10
    db "          .''..               .X@~       .~x@X.               ..'..",10
    db "                              `#%;        `+@%'",10
    db "                              `ox.         'oo.",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "                               ~ L I B R A ~",10
    db 0

art_scorpio:
    db "",10
    db "                                                     .-*xoo*xoOOx+:.",10
    db "                                                   '*#@Xx*X@@%x*O%@#+'",10
    db "                                               .-o#%@@X=+oX@@@Oxxx%@@%X=.",10
    db "                                              -X@#xxo#@@%@@%X%@%%@@@XO%@O`",10
    db "                                             `#@o'.;o%@@@o;. ':-+%@oxOX@@x",10
    db "                                             :%@* '~O%@@@x      .x@@#X#@@X'",10
    db "                                             .x@%*+o#@@@#;        ;X@%X#%@o.",10
    db "                                               *@@X%@@@O;         `%@-`xX@@:",10
    db "                                           '***O@%%@@o;           .O@O+o%@%:",10
    db "                                           .*#@@@@#o;            .*%@@@@@@=",10
    db "                                             .`;-`.             .o@%=`*X@@~",10
    db "                                                              .`+@@*-~x%@@~",10
    db "                                       `~==` `*OOo:        `+o#@@%@@%X%@@o'",10
    db "                               .;+x*;.*%@@%%+#@@#%#;':-+xxo#@#*-:-*O%@@%o'",10
    db "                             .=#@@@#@X@@@@X%@@@@@%@%%@@#XXoX%@Xx~+X%@@@+",10
    db "       .;=*oOOOOOoOX#####XOoxx@@@%###@@@%@@@@@@%O*xoOX%#O~. `x#@##%@@@%;",10
    db "     ;x#@%#o*++*o%@%*=*O%@#o#@@%#%@@%@@@#x-~=xoX@X=''.`*#@o-=xo%@@@@@#-",10
    db "   -O@@Xx;:.   '-*%@@%@@@@@#X#@@#o+-`:;*O%@O~'. ;O@X;'~**#@#X%#%@@@@O:",10
    db " .*@%o~`'`:::-=xO#@@O*+~`-*#@@%@o.     ..`+#@x`:-*o@%oO#X%@@@@@@@@@@#O='",10
    db " +@#-;*xO###XXXX%@%*'    :o@@#x*::x##o'  .+o#@o*ooX#@@%%%%@@@@@@%#%@@%@#=.",10
    db ";%%xO%@@%@@%%@@@X+:     `#@%@#~;:+@@@#;~xxo#O@%##X#%@@@@@@@%##%@@%x*X@#@@*",10
    db "=@#%@%o*#@##@@#=.       `#@#X@@@%#XoooO#%%%@@@@@@@@@@@@@@@%%@@@@#@#~'*%@@#:",10
    db "~@@@o:o@@@@%O='          `;:X@@@@@@@@@@@@@@@@@@@@@@@%##XO%@@x-=%%#@%;.x@@@-",10
    db "`O#=  :~=-:.               .~***==*oOOX@@=x%@%@@XX%@Xxoo%@X@#` =#@@@~ :O@@o'",10
    db "                 .:~+++=-:`-+*xxx*+;. :%@#O%@#-o#@@@@*  o@X#@~  x@@@~  .~oO:",10
    db "                =#@@@#X#%@@@#OoooO#@#O#@Xoo%@#` `##X@O  :#@@@~  =@@@=",10
    db "            '~-'-xoX#@@%#@%*`      ;O@@oxO#@%=  ;%%@@=  :%@@O.  .*%@X",10
    db "            =@@%Xox**x%@@#=`.    ':~xX@@%@@#-  =#@@@x'  `%@@*     `~-",10
    db "            'x%@%####Oox=`::`:;-+oOO#@@@%O='  -%@@X-     +%@o",10
    db "              :x%@%XOx*x***xoooX#%#%@@O~.     *@@o.       :+-",10
    db "                `=oX%@@%%%@%%%%@@@@#x;.       `=~.",10
    db "                    ';~+xoOOOOo*+~;.",10
    db "",10
    db "                             ~ S C O R P I O ~",10
    db 0

art_sagittarius:
    db "",10
    db "",10
    db "",10
    db "",10
    db "                           ;xO-  'X@%X#XOOX%@@%X#%@O`    'X@@+",10
    db "                        `=#%@@%= =@@Xx#@OXO=++:=*%@@*  .=XxO@@X=.",10
    db "                        +%%@@@@X`-@@%%@O.+x. -x*#O@@*.-ox: .=X@@#=.",10
    db "                         -X#%@@@%#@@X#O:;*='.*X-.+@o~ox;     .~#%%X;",10
    db "                           .:#%%%%@@@#O=;~'xXXx:=%%Xo-.        'O%%#: :-:.",10
    db "                            .x@@%O%@@@@@%Ox==+x#@@%o==-;```'''';O@@@o+#@@%#~",10
    db "                              -X@@@%Xo*++**#%%#XXo+*OX#%@@@@%%%#X#@@@oo%#x~'",10
    db "                              :#%*;**xoOXOXx-o@@@#%#Ooox**+*xoO##@@@%` '",10
    db "           ';~~;.             -%#x+~~=++xxo+=O@XXo@%XXXOOOox*+=-+@%@*",10
    db "        `*#%%#X%%X*:=*oOOox*=;'`+oOOO%@%#O****=.:O@X-.          x@%%-",10
    db "      .+%%ooOO#@@@@%O*=~~=*xoX##XOoOX%%%O+'      x@oOX+`      ;o@%#~",10
    db "      ~@#xo#@@@#@@o=;         .`:-~--*=~*oOo*-`~O%@= :xXx;  `o@@%*'",10
    db "      o@OOX@@%~#%o*;                 ..   .`~*o*-O@~   '+OO+#@%x`",10
    db "     .#@oX#@@O=@O+=.     ..                     -%@:      :X@@o",10
    db ";x: .+@%OX@@@x~@O+-      +#;                  ';o@%*;.     -O#o.",10
    db "*@%O%@@##@@@%:.#%*~.   :+#@O*~;`'``'-;    `;~*oX@%XX%%O+",10
    db ":X@@%%@@@@@#-  =@O.   -*#@@%%#XOooOO%O:  'XX##@@@%%#O+x@=",10
    db " .+O%@@@#o='  'x@X' '=O@@@@@@@#@%%%%@@o-.:%@#O+**xx#@XX%-",10
    db "    .`:`     :#%O-+O%%@@@@@%O-.`;~=++o@#;.##'   .;o@Xo@+",10
    db "             `%%;o@o;-%@@@@=         .*@#-+@*  `X@@#x@O.",10
    db "              +@oo@*  ;X@%@%*'        .*@#~#%` ;@@@@X*'",10
    db "              .#%=#%:  `X@%%@O`         +@O+@O''+x+;.",10
    db "               *%#o@X;  '*@@@@#;        .o@+x@O`",10
    db "                ~@@@@%-  .+oOOx:         ;X@@@@X'",10
    db "                .=xxxx;                   ;xOXXo'",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "                         ~ S A G I T T A R I U S ~",10
    db 0

art_capricorn:
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "                 ;~~:;%@%@%%##@#o+;``:-`",10
    db "                .X@%%%#OO%#%@@O+=;`",10
    db "                 :o@%+:'=+=xO##%%@@-              :~`",10
    db "                 ;X%~ .*x` ;#@@%#O~.            :O@@~                    ``",10
    db "               'x%o`  .==.'=x+O@o.             :%#O@x.                :+X#*.",10
    db "               *@X*:: ':~~x%*';o@+             x@x+x%#-      :=-    -o%O~.",10
    db "               =@#X%XX%%@%#~   'O@x'           +@Oo++%#oOXOO#%@x  -X%o: .'..",10
    db "                -x#@X%Xx@O*;   .:x%%x:         'X%XX~##ox**oX%X`.*%o`.`:xox`",10
    db "                  x@@#~O@+;.    .`'~o#X*-'      :%@%###XOoX%%*'.x@x~*O*xXOo`",10
    db "                  :*+.'%#*=;       :;'~xX%Xo+;. ~%%X%@@%#O*~'  +@o.-ox~O#Xo:",10
    db "                -O#####@%#~.       ``    '-o@%#O%%XX@O:.      ;%O. -o~o#oo*:",10
    db "               '##+XXX#@@#OXO-           .+ooOoo%@%@X'     `xX%#: .*ooXoXXO:",10
    db "               ;%o#%*oX%@@%X=.  `o~.  .~=*xO+OOOxO%@o.    'X%=;' '-x%%#Xo*~.",10
    db "               -@oX@x*+x%X='`=*x#@Ox+~-~=oxXOX*o*X*X@O`   +@o:~~+X@O=`  '``.",10
    db "            :*oX@##@#+%#~~O#%##@@%%%#XX###X#XXooxOOOX@X' `%#:`oo#@x`=oO*xOo;",10
    db "           ~%%o;*@@@#'O%~X@o='.`;+*xo%@@@@@@@%#oXOOXOX@= o%**+oO@o. '=o*ooo;",10
    db "          *@o`*x'o#o:`;X%x#@@%o+;.  -@@@@@@@@%@@##oOo#@#o@%##OX@#`  ':=xoO#~",10
    db "        .*@x; 'OO+*xO#%%@@xO@%OO%O: =@@@%%@@@OX@##XXXX@O~-;~*oX%#x-:=xoOXXX+",10
    db "    :~+*O%xx~;-~O#%%#XooXX%#@@XoX@%X#@@%#X%#%@%#oXOXX%@o*=`    .~o%#OOXOXO#=",10
    db "  .x@Xx*=:.;+xOX%X+;'   :-o%%%#X%@@@%@@@%###XXOXoX#X%@#o*~`    `=*;o@%%###X:",10
    db " .x@Xx'-oOOO#%@XXO+~*oox`:~o%%%#%@@Xoxo#@@#XX#O##%@@#o*=+;'  ..`=*o+x@@%@%X.",10
    db ":X%oo+`+oXX@@%+'.+X##o*O#=-~xO#@@X=--~*xxoX#%%####o=~+=:.'`'+Ox+XXXOo#@#%#X-",10
    db "=o-`~`.`:~-*x;   ;-:`..;*~-:==xX='.   .:'                  `=~:;;++~===~;~-'",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "                           ~ C A P R I C O R N ~",10
    db 0

art_aquarius:
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "                                         `X%xx#x**=+x##-",10
    db "                                         O@###o#####XX%%*'",10
    db "                                        .X@#o`..-x=X@##%%x",10
    db "                                   .`;-`.X@XO*o`-O;;~X@@@=",10
    db "                                 .*#%@@@#O#@+;Ooo':=#@@@#'",10
    db "                              `+*x@%#%XOXO-+OXox*o#%XX@o'",10
    db "                             ~%%%%##~`oOOoX' `o@@oxXo'-#O.",10
    db "                            .#@@@@@X* `XxoX*.;=@@XXO. `-#*",10
    db "                            `%@%#X%X#x=xOOoOxoO%@@X` :#o=%`",10
    db "                          .+##XooX%#@%%#XX%%#%@@#*'`*#%oX@X.",10
    db "                         'OXoo=+x%@%@@@@@@@Xxx*~~*O%@%%%Xx%+ .-;  '.",10
    db "                -+- *X~ .OXox=oO#@O*O@@@@@%OX%@@@@@@O-+;::x%:o#x=XX*",10
    db "            .--`xX#x~XO +%+X:#+o@x  .`-++~-;x%#XXo#o##*: :=%x*~.**=-'     ..",10
    db "            ;XXo:*x+`'::#xO=~X=x%o`O%*+O+..~%~**-=;Xo+O%##%%%ooX#OoX#Xo*xoX~",10
    db "''     .-*xox+--%O%Xx`~#XxO`x*-OO@XXoX#XXOOXX-xOOOOooXOOX@@@%%%%XXX##XOOOoO*",10
    db "=XO***O#XXXOXXXO@xX#X#Xxx#++x-=OoO%%##%~@OX%#Oox+++**o#@%%%%%OooOOoooOXXXXx;",10
    db "`=oOXXXoox+*xoOox%O**xXXo*xoox*~o##oo*;x#oxx**Oo*xOXOo*=+*x+=+*+;-;~**=~:.",10
    db " '=+**='-xoOOOo~`OX*==-~o#OO*xXO*==**=+Xxxx+-*xxo*~+oOooox+-+*oOOOOOOoxx*=.",10
    db "     `+ox=;:;;;-*x++xox*~=*: =o==xoxxox; `=+~=+-.:`'.:=xoxxoo+++-  '~+++;",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "                            ~ A Q U A R I U S ~",10
    db 0

art_pisces:
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "                                            :X#XX#Xo=:          +%@X#Xx~.",10
    db "             .`-~-:'   '`;~====-:'          .+%#oxxO#%X=.     .o#%#=`:+X#+.",10
    db "            :O@###%%#X#%@#OoooOX#%#o*`        :O@XooOX%@X:     :-~+o#Xx*O%o.",10
    db "          'o%#OoX%@%%Ox##;.+XXO+.`O%@x         :O@%XX%@@@%x=`       .-X%Ox@+",10
    db "         -#@OO#@#oox#*O%X''#%@@%:*%X%@+     .~O%#OoX#@@@@X#%@#*`      ~@OO@*",10
    db "        -%%X%@Xxx=XxO~o%%- ;oOo- `o@@O;   ;*#@XxxOOX%@%#%@#XX#%%x=~-;*%%O#%:",10
    db "        +%%%@X*OO*oo##*%%#~   ':+X@#~    .O@@#OX#%%O+-`:~x%@#X#X@@@X#%@%@%~",10
    db "         =@@*OOo#%####@OO%%Xo**O%%x`       `~+++=~+oX##%##%@%OxoX%@#x-~o%X:",10
    db "       '`*@#=Xx#@Oxoo#@XxXO%@@@#*`          .;+o##Xo**X##%%@%XXxX#%@XX#Oo%#'",10
    db "    ~oX%@@%X++o;o@%#@%###%%@@x;         .;*O#Xx==xX##Xx+;'*@#Oox%O#@%`:O@#@-",10
    db "  `O@@@@@@o~Xo#+.+XXXX%%@%X@O.       :+o#Xx=:=o##O+x#%Ox;x@%#o*;=XX%@*o@@%%:",10
    db "  o%@@%Ox@%o~+x=oX#X%%X@%X#%-   '-+oXXo=:;+O#O*-..O@OX%@@Xo*+oox%#%%@@@@@@x",10
    db "  X%O@o``%%oOO+o%%@@O:.`+o*;-+oX#Ox~`;+O#Xx~.    ~@%@@#OOOo+*=;oo##@@@@@#=.",10
    db "  *@O~o%X#@Oooxo#%@%*xxoOXX#Ox=::~*O##o=`      :*#%O#o#OO%#####-#%O%@X*;.",10
    db " :O@@#*+xx%@%X#X#@@%%###XooOOX###Ox~`       '+X@@%Xoo+X%%xx*o%#x#O%@*.",10
    db ":#%%@%X%%##@@%XXX#@@##XXXOxxoOOOOo*-.     .*%%*--=x###o%@#X#%@X#%%@o.",10
    db "*@O#@+ .;=+*o%%#X#%@X=:;~*X%%##OX@@%;    ;X%x`.~+=`'x%%O*%o*#o@#%@@O-",10
    db "*@xo%X;      :x#@%%##@@@@@%XooO#@O~.   .=%%=.'X%@%%:.o#%+x%%%O%@@%#@*",10
    db "`##**o#Xx=;'.  '-xX%%%@@@@%OO%@O-      x@%%%O.o##%#` =%%#@#O#@@%##@O.",10
    db " `O%o-'-o#@%O.     `x%@@@##%%@*        ;x@@%X;`:~~;;~X@@#%@@@%X#@#~",10
    db "   ;xX#OX@X-         -X@@%#XOX@o.       `OX#%%#XXXX#%@@#XoOX####*.",10
    db "      ';=+*;          .=X%%%#OX%X=         .':-~====-:'      ..",10
    db "                         `~xOXXXo=",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "",10
    db "                              ~ P I S C E S ~",10
    db 0

txt_love_0:
    db ", your passion is magnetic today.",10
    db "Speak from the heart and a warm",10
    db "connection will answer back.",10
    db 0

txt_love_1:
    db ", steady affection is your strength.",10
    db "A small, loyal gesture will deepen",10
    db "an important bond this week.",10
    db 0

txt_love_2:
    db ", a lively conversation sparks",10
    db "something special. Listen as much",10
    db "as you talk and romance will bloom.",10
    db 0

txt_love_3:
    db ", your intuition guides your heart.",10
    db "Trust your feelings; someone close",10
    db "is ready to open up to you.",10
    db 0

txt_career_0:
    db ", your creativity will help you",10
    db "solve a difficult problem today.",10
    db "Stay focused and confident!",10
    db 0

txt_career_1:
    db ", patient effort is about to pay off.",10
    db "Finish the task you keep postponing",10
    db "and a mentor will take notice.",10
    db 0

txt_career_2:
    db ", a bright idea will set you apart.",10
    db "Share it with your team or class",10
    db "and welcome their feedback.",10
    db 0

txt_career_3:
    db ", your empathy will help a group today.",10
    db "Trust your instincts when a plan",10
    db "feels off, and ask for clarity.",10
    db 0

txt_health_0:
    db ", your energy is high today.",10
    db "Channel it into a brisk walk or a",10
    db "workout, then stretch and hydrate.",10
    db 0

txt_health_1:
    db ", ground yourself with routine.",10
    db "Regular meals, steady sleep and",10
    db "time outdoors will restore balance.",10
    db 0

txt_health_2:
    db ", a busy mind needs a pause.",10
    db "Try deep breathing or a short",10
    db "screen-free break to refresh.",10
    db 0

txt_health_3:
    db ", rest and hydration are your allies.",10
    db "Take a calm evening with music or",10
    db "a warm bath to recharge.",10
    db 0

sign_titles:
    dd title_aries, title_taurus, title_gemini, title_cancer, title_leo, title_virgo, title_libra, title_scorpio, title_sagittarius, title_capricorn, title_aquarius, title_pisces
sign_names:
    dd name_aries, name_taurus, name_gemini, name_cancer, name_leo, name_virgo, name_libra, name_scorpio, name_sagittarius, name_capricorn, name_aquarius, name_pisces
sign_symbols:
    dd sym_aries, sym_taurus, sym_gemini, sym_cancer, sym_leo, sym_virgo, sym_libra, sym_scorpio, sym_sagittarius, sym_capricorn, sym_aquarius, sym_pisces
sign_dates:
    dd date_aries, date_taurus, date_gemini, date_cancer, date_leo, date_virgo, date_libra, date_scorpio, date_sagittarius, date_capricorn, date_aquarius, date_pisces
sign_traits:
    dd trait_aries, trait_taurus, trait_gemini, trait_cancer, trait_leo, trait_virgo, trait_libra, trait_scorpio, trait_sagittarius, trait_capricorn, trait_aquarius, trait_pisces
sign_colors:
    dd color_aries, color_taurus, color_gemini, color_cancer, color_leo, color_virgo, color_libra, color_scorpio, color_sagittarius, color_capricorn, color_aquarius, color_pisces
element_names:
    dd elem_0, elem_1, elem_2, elem_3
sign_element:
    db 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3
lucky_numbers:
    dd 9, 6, 5, 2, 1, 7, 6, 8, 3, 4, 11, 7
art_table:
    dd art_aries, art_taurus, art_gemini, art_cancer, art_leo, art_virgo, art_libra, art_scorpio, art_sagittarius, art_capricorn, art_aquarius, art_pisces
love_table:
    dd txt_love_0, txt_love_1, txt_love_2, txt_love_3
career_table:
    dd txt_career_0, txt_career_1, txt_career_2, txt_career_3
health_table:
    dd txt_health_0, txt_health_1, txt_health_2, txt_health_3

section .bss
inbuf        resb 64
onebyte      resb 4
name_buf     resb 32
numbuf       resb 16
birth_month  resd 1
birth_day    resd 1
sign_index   resd 1

section .text
global _start

_start:
    call display_welcome
    call get_user_info

    PRINT msg_hello
    PRINT name_buf
    PRINT msg_excl

    call determine_zodiac
    call display_zodiac_info

menu_loop:
    call display_menu
    PRINT msg_choice
    call read_line
    mov esi, inbuf
    call parse_number
    cmp eax, 6
    je  quit
    call show_horoscope
    cmp eax, 0
    je  menu_loop
    call ask_return_menu
    cmp eax, 1
    je  menu_loop
quit:
    call exit_program

display_welcome:
    PRINT welcome_art
    ret

get_user_info:
    push eax
    push esi
    push edi
.ask_name:
    PRINT msg_name
    call read_line
    mov esi, inbuf
.skip_sp:
    mov al, [esi]
    cmp al, 0
    je  .name_bad
    cmp al, ' '
    jne .name_ok
    inc esi
    jmp .skip_sp
.name_bad:
    PRINT msg_bad_name
    jmp .ask_name
.name_ok:
    mov edi, name_buf
.copy:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    cmp al, 0
    jne .copy
.ask_date:
    PRINT msg_month
    call read_line
    mov esi, inbuf
    call parse_number
    mov [birth_month], eax
    PRINT msg_day
    call read_line
    mov esi, inbuf
    call parse_number
    mov [birth_day], eax
    call validate_birthdate
    cmp eax, 1
    je  .done
    PRINT msg_retry
    jmp .ask_date
.done:
    pop edi
    pop esi
    pop eax
    ret

validate_birthdate:
    push ebx
    push ecx
    push esi
    mov eax, [birth_month]
    cmp eax, 1
    jl  .bad_month
    cmp eax, 12
    jg  .bad_month
    mov ebx, [birth_day]
    cmp ebx, 1
    jl  .bad_day
    cmp ebx, 31
    jg  .bad_day
    movzx ecx, byte [days_in_month + eax - 1]
    cmp ebx, ecx
    jg  .bad_date
    mov eax, 1
    jmp .out
.bad_month:
    PRINT msg_inv_month
    xor eax, eax
    jmp .out
.bad_day:
    PRINT msg_inv_day
    xor eax, eax
    jmp .out
.bad_date:
    PRINT msg_inv_date
    mov esi, [month_names + eax*4 - 4]
    call print_string
    PRINT msg_has_only
    mov eax, ecx
    call print_number
    PRINT msg_days
    cmp dword [birth_month], 2
    jne .date_end
    cmp ebx, 29
    jne .date_end
    PRINT msg_feb29
.date_end:
    xor eax, eax
.out:
    pop esi
    pop ecx
    pop ebx
    ret

determine_zodiac:
    push eax
    push ebx
    mov eax, [birth_month]
    mov ebx, [birth_day]
    cmp eax, 1
    je  .jan
    cmp eax, 2
    je  .feb
    cmp eax, 3
    je  .mar
    cmp eax, 4
    je  .apr
    cmp eax, 5
    je  .may
    cmp eax, 6
    je  .jun
    cmp eax, 7
    je  .jul
    cmp eax, 8
    je  .aug
    cmp eax, 9
    je  .sep
    cmp eax, 10
    je  .oct
    cmp eax, 11
    je  .nov
    jmp .dec
.jan:
    cmp ebx, 19
    jle .capricorn
    jmp .aquarius
.feb:
    cmp ebx, 18
    jle .aquarius
    jmp .pisces
.mar:
    cmp ebx, 20
    jle .pisces
    jmp .aries
.apr:
    cmp ebx, 19
    jle .aries
    jmp .taurus
.may:
    cmp ebx, 20
    jle .taurus
    jmp .gemini
.jun:
    cmp ebx, 20
    jle .gemini
    jmp .cancer
.jul:
    cmp ebx, 22
    jle .cancer
    jmp .leo
.aug:
    cmp ebx, 22
    jle .leo
    jmp .virgo
.sep:
    cmp ebx, 22
    jle .virgo
    jmp .libra
.oct:
    cmp ebx, 22
    jle .libra
    jmp .scorpio
.nov:
    cmp ebx, 21
    jle .scorpio
    jmp .sagittarius
.dec:
    cmp ebx, 22
    jge .capricorn
    jmp .sagittarius
.aries:
    mov eax, 0
    jmp .store
.taurus:
    mov eax, 1
    jmp .store
.gemini:
    mov eax, 2
    jmp .store
.cancer:
    mov eax, 3
    jmp .store
.leo:
    mov eax, 4
    jmp .store
.virgo:
    mov eax, 5
    jmp .store
.libra:
    mov eax, 6
    jmp .store
.scorpio:
    mov eax, 7
    jmp .store
.sagittarius:
    mov eax, 8
    jmp .store
.capricorn:
    mov eax, 9
    jmp .store
.aquarius:
    mov eax, 10
    jmp .store
.pisces:
    mov eax, 11
.store:
    mov [sign_index], eax
    pop ebx
    pop eax
    ret

display_zodiac_art:
    push eax
    push esi
    mov eax, [sign_index]
    mov esi, [art_table + eax*4]
    call print_string
    pop esi
    pop eax
    ret

display_zodiac_info:
    push eax
    push ecx
    push esi
    PRINT hdr_sign
    call display_zodiac_art
    mov eax, [sign_index]
    PRINT lbl_sign
    mov esi, [sign_names + eax*4]
    call print_string
    PRINT msg_nl
    PRINT lbl_dates
    mov esi, [sign_dates + eax*4]
    call print_string
    PRINT msg_nl
    PRINT lbl_element
    movzx ecx, byte [sign_element + eax]
    mov esi, [element_names + ecx*4]
    call print_string
    PRINT msg_nl
    PRINT lbl_symbol
    mov esi, [sign_symbols + eax*4]
    call print_string
    PRINT msg_nl
    PRINT lbl_trait
    mov esi, [sign_traits + eax*4]
    call print_string
    PRINT msg_nl
    pop esi
    pop ecx
    pop eax
    ret

print_sign_title:
    push eax
    push esi
    mov eax, [sign_index]
    mov esi, [sign_titles + eax*4]
    call print_string
    pop esi
    pop eax
    ret

display_menu:
    PRINT menu_text
    ret

show_horoscope:
    push ebx
    push ecx
    push esi
    cmp eax, 1
    je  .love
    cmp eax, 2
    je  .career
    cmp eax, 3
    je  .health
    cmp eax, 4
    je  .lucky
    cmp eax, 5
    je  .info
    PRINT msg_inv_menu
    xor eax, eax
    jmp .out
.love:
    PRINT hdr_love
    call print_sign_title
    mov eax, [sign_index]
    movzx ecx, byte [sign_element + eax]
    mov esi, [love_table + ecx*4]
    call print_string
    jmp .shown
.career:
    PRINT hdr_career
    call print_sign_title
    mov eax, [sign_index]
    movzx ecx, byte [sign_element + eax]
    mov esi, [career_table + ecx*4]
    call print_string
    jmp .shown
.health:
    PRINT hdr_health
    call print_sign_title
    mov eax, [sign_index]
    movzx ecx, byte [sign_element + eax]
    mov esi, [health_table + ecx*4]
    call print_string
    jmp .shown
.lucky:
    PRINT hdr_lucky
    mov ebx, [sign_index]
    PRINT lbl_lucky_no
    mov eax, [lucky_numbers + ebx*4]
    call print_number
    PRINT msg_nl
    PRINT lbl_lucky_col
    mov esi, [sign_colors + ebx*4]
    call print_string
    PRINT msg_nl
    jmp .shown
.info:
    call display_zodiac_info
.shown:
    mov eax, 1
.out:
    pop esi
    pop ecx
    pop ebx
    ret

ask_return_menu:
.ask:
    PRINT msg_return
    call read_line
    cmp eax, 1
    jne .bad
    mov al, [inbuf]
    cmp al, 'Y'
    je  .yes
    cmp al, 'y'
    je  .yes
    cmp al, 'N'
    je  .no
    cmp al, 'n'
    je  .no
.bad:
    PRINT msg_inv_yn
    jmp .ask
.yes:
    mov eax, 1
    ret
.no:
    xor eax, eax
    ret

exit_program:
    PRINT msg_bye
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80

print_string:
    pusha
    xor edx, edx
.len:
    cmp byte [esi + edx], 0
    je  .write
    inc edx
    jmp .len
.write:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, esi
    int 0x80
    popa
    ret

print_number:
    pusha
    mov edi, numbuf + 15
    mov byte [edi], 0
    mov ebx, 10
.digit:
    xor edx, edx
    div ebx
    add dl, '0'
    dec edi
    mov [edi], dl
    test eax, eax
    jnz .digit
    mov esi, edi
    call print_string
    popa
    ret

read_line:
    push ebx
    push ecx
    push edx
    push edi
    xor edi, edi
.next:
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, onebyte
    mov edx, 1
    int 0x80
    cmp eax, 0
    jle .eof
    mov al, [onebyte]
    cmp al, 10
    je  .done
    cmp al, 13
    je  .next
    cmp edi, MAXLEN
    jge .next
    mov [inbuf + edi], al
    inc edi
    jmp .next
.eof:
    cmp edi, 0
    jne .done
    call exit_program
.done:
    mov byte [inbuf + edi], 0
    mov eax, edi
    pop edi
    pop edx
    pop ecx
    pop ebx
    ret

parse_number:
    push ebx
    push ecx
    push edx
    push esi
    xor eax, eax
    xor ecx, ecx
.lead:
    cmp byte [esi], ' '
    jne .digits
    inc esi
    jmp .lead
.digits:
    movzx edx, byte [esi]
    cmp edx, '0'
    jl  .trail
    cmp edx, '9'
    jg  .trail
    cmp ecx, 4
    jge .bad
    imul eax, eax, 10
    sub edx, '0'
    add eax, edx
    inc ecx
    inc esi
    jmp .digits
.trail:
    cmp ecx, 0
    je  .bad
.skip:
    cmp byte [esi], ' '
    jne .end
    inc esi
    jmp .skip
.end:
    cmp byte [esi], 0
    jne .bad
    jmp .out
.bad:
    mov eax, -1
.out:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
