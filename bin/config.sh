#!/bin/bash

# Choose the character used to separate words in file and folder names
filename_separator="-"
# Choose whether or not to make file and folder names lowercase
lowercase="true"
# Choose whether or not to keep abbreviation periods in the filename
filename_periods="false"
# Choose whether or not to keep the filename separator between the initial and its number
remove_abbreviation_separator="true"
# Choose whether or not to display verbose console messages
verbose="true"
# Choose whether or not to display verbose console messages
yaml_enabled="true"
# Choose whether or not to have parentheses for translation in filename
parentheses_enabled="false"
# Choose whether or not to have audio bibles
enable_audio_bible="true"

# Customize the following if needed

translation="CSB"
# Choose whether or not the translation to download is your primary translation
# Secondary translations will be without note files and appended to outlines
primary_translation="true"

outline="Outline"
reading="Reading"
notes="Notes"
audio="Audio"

bible_name="Bible"
audio_bible_name="Audio Bible"

testament_1="Old Testament"
testament_2="New Testament"

genre_1="Pentateuch"
genre_2="Historical books"
genre_3="Poetical books"
genre_4="Book of Wisdom"
genre_5="Major prophets"
genre_6="Minor prophets"
genre_7="Gospels"
genre_8="Church history"
genre_9="Pauline epistles"
genre_10="General epistles"
genre_11="Apocalyptic"

long_title_1="Book of Genesis"
long_title_2="Book of Exodus"
long_title_3="Book of Leviticus"
long_title_4="Book of Numbers"
long_title_5="Book of Deuteronomy"
long_title_6="Book of Joshua"
long_title_7="Book of Judges"
long_title_8="Book of Ruth"
long_title_9="First Book of Samuel"
long_title_10="Second Book of Samuel"
long_title_11="First Book of Kings"
long_title_12="Second Book of Kings"
long_title_13="First Book of Chronicles"
long_title_14="Second Book of Chronicles"
long_title_15="Book of Ezra"
long_title_16="Book of Nehemiah"
long_title_17="Book of Esther"
long_title_18="Book of Job"
long_title_19="Book of Psalms"
long_title_20="Book of Proverbs"
long_title_21="Book of Ecclesiastes"
long_title_22="Song of Solomon"
long_title_23="Book of Isaiah"
long_title_24="Book of Jeremiah"
long_title_25="Book of Lamentations"
long_title_26="Book of Ezekiel"
long_title_27="Book of Daniel"
long_title_28="Book of Hosea"
long_title_29="Book of Joel"
long_title_30="Book of Amos"
long_title_31="Book of Obadiah"
long_title_32="Book of Jonah"
long_title_33="Book of Micah"
long_title_34="Book of Nahum"
long_title_35="Book of Habakkuk"
long_title_36="Book of Zephaniah"
long_title_37="Book of Haggai"
long_title_38="Book of Zechariah"
long_title_39="Book of Malachi"
long_title_40="Gospel of Matthew"
long_title_41="Gospel of Mark"
long_title_42="Gospel of Luke"
long_title_43="Gospel of John"
long_title_44="Acts of the Apostles"
long_title_45="Epistle to the Romans"
long_title_46="First Epistle to the Corinthians"
long_title_47="Second Epistle to the Corinthians"
long_title_48="Epistle to the Galatians"
long_title_49="Epistle to the Ephesians"
long_title_50="Epistle to the Philippians"
long_title_51="Epistle to the Colossians"
long_title_52="First Epistle to the Thessalonians"
long_title_53="Second Epistle to the Thessalonians"
long_title_54="First Epistle to Timothy"
long_title_55="Second Epistle to Timothy"
long_title_56="Epistle to Titus"
long_title_57="Epistle to Philemon"
long_title_58="Epistle to the Hebrews"
long_title_59="Epistle of James"
long_title_60="First Epistle of Peter"
long_title_61="Second Epistle of Peter"
long_title_62="First Epistle of John"
long_title_63="Second Epistle of John"
long_title_64="Third Epistle of John"
long_title_65="Epistle of Jude"
long_title_66="Book of Revelation"

short_title_1="Genesis"
short_title_2="Exodus"
short_title_3="Leviticus"
short_title_4="Numbers"
short_title_5="Deuteronomy"
short_title_6="Joshua"
short_title_7="Judges"
short_title_8="Ruth"
short_title_9="1 Samuel"
short_title_10="2 Samuel"
short_title_11="1 Kings"
short_title_12="2 Kings"
short_title_13="1 Chronicles"
short_title_14="2 Chronicles"
short_title_15="Ezra"
short_title_16="Nehemiah"
short_title_17="Esther"
short_title_18="Job"
short_title_19="Psalm"
short_title_20="Proverbs"
short_title_21="Ecclesiastes"
short_title_22="Song of Solomon"
short_title_23="Isaiah"
short_title_24="Jeremiah"
short_title_25="Lamentations"
short_title_26="Ezekiel"
short_title_27="Daniel"
short_title_28="Hosea"
short_title_29="Joel"
short_title_30="Amos"
short_title_31="Obadiah"
short_title_32="Jonah"
short_title_33="Micah"
short_title_34="Nahum"
short_title_35="Habakkuk"
short_title_36="Zephaniah"
short_title_37="Haggai"
short_title_38="Zechariah"
short_title_39="Malachi"
short_title_40="Matthew"
short_title_41="Mark"
short_title_42="Luke"
short_title_43="John"
short_title_44="Acts"
short_title_45="Romans"
short_title_46="1 Corinthians"
short_title_47="2 Corinthians"
short_title_48="Galatians"
short_title_49="Ephesians"
short_title_50="Philippians"
short_title_51="Colossians"
short_title_52="1 Thessalonians"
short_title_53="2 Thessalonians"
short_title_54="1 Timothy"
short_title_55="2 Timothy"
short_title_56="Titus"
short_title_57="Philemon"
short_title_58="Hebrews"
short_title_59="James"
short_title_60="1 Peter"
short_title_61="2 Peter"
short_title_62="1 John"
short_title_63="2 John"
short_title_64="3 John"
short_title_65="Jude"
short_title_66="Revelation"

abbreviation_1="Gen."
abbreviation_2="Ex."
abbreviation_3="Lev."
abbreviation_4="Num."
abbreviation_5="Deut."
abbreviation_6="Josh."
abbreviation_7="Judg."
abbreviation_8="Ruth"
abbreviation_9="1 Sam."
abbreviation_10="2 Sam."
abbreviation_11="1 Kings"
abbreviation_12="2 Kings"
abbreviation_13="1 Chron."
abbreviation_14="2 Chron."
abbreviation_15="Ezra"
abbreviation_16="Neh."
abbreviation_17="Est."
abbreviation_18="Job"
abbreviation_19="Ps."
abbreviation_20="Prov."
abbreviation_21="Eccles."
abbreviation_22="Song"
abbreviation_23="Isa."
abbreviation_24="Jer."
abbreviation_25="Lam."
abbreviation_26="Ezek."
abbreviation_27="Dan."
abbreviation_28="Hos."
abbreviation_29="Joel"
abbreviation_30="Amos"
abbreviation_31="Obad."
abbreviation_32="Jonah"
abbreviation_33="Mic."
abbreviation_34="Nah."
abbreviation_35="Hab."
abbreviation_36="Zeph."
abbreviation_37="Hag."
abbreviation_38="Zech."
abbreviation_39="Mal."
abbreviation_40="Matt."
abbreviation_41="Mark"
abbreviation_42="Luke"
abbreviation_43="John"
abbreviation_44="Acts"
abbreviation_45="Rom."
abbreviation_46="1 Cor."
abbreviation_47="2 Cor."
abbreviation_48="Gal."
abbreviation_49="Eph."
abbreviation_50="Phil."
abbreviation_51="Col."
abbreviation_52="1 Thess."
abbreviation_53="2 Thess."
abbreviation_54="1 Tim."
abbreviation_55="2 Tim."
abbreviation_56="Titus"
abbreviation_57="Philem."
abbreviation_58="Heb."
abbreviation_59="James"
abbreviation_60="1 Pet."
abbreviation_61="2 Pet."
abbreviation_62="1 John"
abbreviation_63="2 John"
abbreviation_64="3 John"
abbreviation_65="Jude"
abbreviation_66="Rev."

# Do not touch anything past this line unless needed

book_max=66
length_arr=(50 40 27 36 34 24 21 4 31 24 22 25 29 36 10 13 10 42 150 31 12 8 66 52 5 48 12 14 3 9 1 4 7 3 3 3 2 14 4 28 16 24 21 28 16 16 13 6 6 4 4 5 3 6 4 3 1 13 5 5 3 5 1 1 1 22)

testament_arr=("${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_1}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}" "${testament_2}")
genre_arr=("${genre_1}" "${genre_1}" "${genre_1}" "${genre_1}" "${genre_1}" "${genre_2}" "${genre_2}" "${genre_2}" "${genre_2}" "${genre_2}" "${genre_2}" "${genre_2}" "${genre_2}" "${genre_2}" "${genre_2}" "${genre_2}" "${genre_2}" "${genre_3}" "${genre_3}" "${genre_4}" "${genre_4}" "${genre_4}" "${genre_5}" "${genre_5}" "${genre_5}" "${genre_5}" "${genre_5}" "${genre_6}" "${genre_6}" "${genre_6}" "${genre_6}" "${genre_6}" "${genre_6}" "${genre_6}" "${genre_6}" "${genre_6}" "${genre_6}" "${genre_6}" "${genre_6}" "${genre_7}" "${genre_7}" "${genre_7}" "${genre_7}" "${genre_8}" "${genre_9}" "${genre_9}" "${genre_9}" "${genre_9}" "${genre_9}" "${genre_9}" "${genre_9}" "${genre_9}" "${genre_9}" "${genre_9}" "${genre_9}" "${genre_9}" "${genre_9}" "${genre_10}" "${genre_10}" "${genre_10}" "${genre_10}" "${genre_10}" "${genre_10}" "${genre_10}" "${genre_10}" "${genre_11}")
long_title_arr=("${long_title_1}" "${long_title_2}" "${long_title_3}" "${long_title_4}" "${long_title_5}" "${long_title_6}" "${long_title_7}" "${long_title_8}" "${long_title_9}" "${long_title_10}" "${long_title_11}" "${long_title_12}" "${long_title_13}" "${long_title_14}" "${long_title_15}" "${long_title_16}" "${long_title_17}" "${long_title_18}" "${long_title_19}" "${long_title_20}" "${long_title_21}" "${long_title_22}" "${long_title_23}" "${long_title_24}" "${long_title_25}" "${long_title_26}" "${long_title_27}" "${long_title_28}" "${long_title_29}" "${long_title_30}" "${long_title_31}" "${long_title_32}" "${long_title_33}" "${long_title_34}" "${long_title_35}" "${long_title_36}" "${long_title_37}" "${long_title_38}" "${long_title_39}" "${long_title_40}" "${long_title_41}" "${long_title_42}" "${long_title_43}" "${long_title_44}" "${long_title_45}" "${long_title_46}" "${long_title_47}" "${long_title_48}" "${long_title_49}" "${long_title_50}" "${long_title_51}" "${long_title_52}" "${long_title_53}" "${long_title_54}" "${long_title_55}" "${long_title_56}" "${long_title_57}" "${long_title_58}" "${long_title_59}" "${long_title_60}" "${long_title_61}" "${long_title_62}" "${long_title_63}" "${long_title_64}" "${long_title_65}" "${long_title_66}")
short_title_arr=("${short_title_1}" "${short_title_2}" "${short_title_3}" "${short_title_4}" "${short_title_5}" "${short_title_6}" "${short_title_7}" "${short_title_8}" "${short_title_9}" "${short_title_10}" "${short_title_11}" "${short_title_12}" "${short_title_13}" "${short_title_14}" "${short_title_15}" "${short_title_16}" "${short_title_17}" "${short_title_18}" "${short_title_19}" "${short_title_20}" "${short_title_21}" "${short_title_22}" "${short_title_23}" "${short_title_24}" "${short_title_25}" "${short_title_26}" "${short_title_27}" "${short_title_28}" "${short_title_29}" "${short_title_30}" "${short_title_31}" "${short_title_32}" "${short_title_33}" "${short_title_34}" "${short_title_35}" "${short_title_36}" "${short_title_37}" "${short_title_38}" "${short_title_39}" "${short_title_40}" "${short_title_41}" "${short_title_42}" "${short_title_43}" "${short_title_44}" "${short_title_45}" "${short_title_46}" "${short_title_47}" "${short_title_48}" "${short_title_49}" "${short_title_50}" "${short_title_51}" "${short_title_52}" "${short_title_53}" "${short_title_54}" "${short_title_55}" "${short_title_56}" "${short_title_57}" "${short_title_58}" "${short_title_59}" "${short_title_60}" "${short_title_61}" "${short_title_62}" "${short_title_63}" "${short_title_64}" "${short_title_65}" "${short_title_66}")
abbreviation_arr=("${abbreviation_1}" "${abbreviation_2}" "${abbreviation_3}" "${abbreviation_4}" "${abbreviation_5}" "${abbreviation_6}" "${abbreviation_7}" "${abbreviation_8}" "${abbreviation_9}" "${abbreviation_10}" "${abbreviation_11}" "${abbreviation_12}" "${abbreviation_13}" "${abbreviation_14}" "${abbreviation_15}" "${abbreviation_16}" "${abbreviation_17}" "${abbreviation_18}" "${abbreviation_19}" "${abbreviation_20}" "${abbreviation_21}" "${abbreviation_22}" "${abbreviation_23}" "${abbreviation_24}" "${abbreviation_25}" "${abbreviation_26}" "${abbreviation_27}" "${abbreviation_28}" "${abbreviation_29}" "${abbreviation_30}" "${abbreviation_31}" "${abbreviation_32}" "${abbreviation_33}" "${abbreviation_34}" "${abbreviation_35}" "${abbreviation_36}" "${abbreviation_37}" "${abbreviation_38}" "${abbreviation_39}" "${abbreviation_40}" "${abbreviation_41}" "${abbreviation_42}" "${abbreviation_43}" "${abbreviation_44}" "${abbreviation_45}" "${abbreviation_46}" "${abbreviation_47}" "${abbreviation_48}" "${abbreviation_49}" "${abbreviation_50}" "${abbreviation_51}" "${abbreviation_52}" "${abbreviation_53}" "${abbreviation_54}" "${abbreviation_55}" "${abbreviation_56}" "${abbreviation_57}" "${abbreviation_58}" "${abbreviation_59}" "${abbreviation_60}" "${abbreviation_61}" "${abbreviation_62}" "${abbreviation_63}" "${abbreviation_64}" "${abbreviation_65}" "${abbreviation_66}")

standard_translation=${translation}
standard_bible_name=${bible_name}
standard_audio_bible_name=${audio_bible_name}

standard_testament_arr=("${testament_arr[@]}")
standard_genre_arr=("${genre_arr[@]}")
standard_long_title_arr=("${long_title_arr[@]}")
standard_short_title_arr=("${short_title_arr[@]}")
standard_abbreviation_arr=("${abbreviation_arr[@]}")

# Customize variables to user preference

if [[ $remove_abbreviation_separator == "true" ]]; then
    for ((book = 0; book < book_max; book++)); do
        standard_abbreviation_arr[book]=${standard_abbreviation_arr[book]// /}
    done
fi
if [[ $filename_separator != " " ]]; then
    standard_translation=${standard_translation// /${filename_separator}}
    standard_bible_name=${standard_bible_name// /${filename_separator}}
    standard_audio_bible_name=${standard_audio_bible_name// /${filename_separator}}

    outline=${outline// /${filename_separator}}
    reading=${reading// /${filename_separator}}
    notes=${notes// /${filename_separator}}
    audio=${audio// /${filename_separator}}

    for ((book = 0; book < book_max; book++)); do
        standard_testament_arr[book]=${standard_testament_arr[book]// /${filename_separator}}
        standard_genre_arr[book]=${standard_genre_arr[book]// /${filename_separator}}
        standard_long_title_arr[book]=${standard_long_title_arr[book]// /${filename_separator}}
        standard_short_title_arr[book]=${standard_short_title_arr[book]// /${filename_separator}}
        standard_abbreviation_arr[book]=${standard_abbreviation_arr[book]// /${filename_separator}}
    done
fi
if [[ $lowercase == "true" ]]; then
    standard_translation=${standard_translation,,}
    standard_bible_name=${standard_bible_name,,}
    standard_audio_bible_name=${standard_audio_bible_name,,}

    outline=${outline,,}
    reading=${reading,,}
    notes=${notes,,}
    audio=${audio,,}

    for ((book = 0; book < book_max; book++)); do
        standard_testament_arr[book]=${standard_testament_arr[book],,}
        standard_genre_arr[book]=${standard_genre_arr[book],,}
        standard_long_title_arr[book]=${standard_long_title_arr[book],,}
        standard_short_title_arr[book]=${standard_short_title_arr[book],,}
        standard_abbreviation_arr[book]=${standard_abbreviation_arr[book],,}
    done
fi
if [[ $filename_periods == "false" ]]; then
    for ((book = 0; book < book_max; book++)); do
        standard_abbreviation_arr[book]=${standard_abbreviation_arr[book]//\./}
    done
fi

bible_dir="./${standard_bible_name}"
translation_dir="${bible_dir}/${standard_translation}"
outline_dir="${bible_dir}/${outline}"
notes_dir="${bible_dir}/${notes}"
reading_dir="${translation_dir}/${reading}"
audio_dir="${translation_dir}/${audio}"

mkdir -p "${bible_dir}" "${translation_dir}" "${outline_dir}" "${notes_dir}" "${reading_dir}" "${audio_dir}"

if [[ $parentheses_enabled == "true" ]]; then
    translation="(${translation})"
    standard_translation="(${standard_translation})"
fi

# long_title_arr=("Book of Genesis" "Book of Exodus" "Book of Leviticus" "Book of Numbers" "Book of Deuteronomy" "Book of Joshua" "Book of Judges" "Book of Ruth" "First Book of Samuel" "Second Book of Samuel" "First Book of Kings" "Second Book of Kings" "First Book of Chronicles" "Second Book of Chronicles" "Book of Ezra" "Book of Nehemiah" "Book of Esther" "Book of Job" "Book of Psalms" "Book of Proverbs" "Book of Ecclesiastes" "Song of Solomon" "Book of Isaiah" "Book of Jeremiah" "Book of Lamentations" "Book of Ezekiel" "Book of Daniel" "Book of Hosea" "Book of Joel" "Book of Amos" "Book of Obadiah" "Book of Jonah" "Book of Micah" "Book of Nahum" "Book of Habakkuk" "Book of Zephaniah" "Book of Haggai" "Book of Zechariah" "Book of Malachi" "Gospel of Matthew" "Gospel of Mark" "Gospel of Luke" "Gospel of John" "Acts of the Apostles" "Epistle to the Romans" "First Epistle to the Corinthians" "Second Epistle to the Corinthians" "Epistle to the Galatians" "Epistle to the Ephesians" "Epistle to the Philippians" "Epistle to the Colossians" "First Epistle to the Thessalonians" "Second Epistle to the Thessalonians" "First Epistle to Timothy" "Second Epistle to Timothy" "Epistle to Titus" "Epistle to Philemon" "Epistle to the Hebrews" "Epistle of James" "First Epistle of Peter" "Second Epistle of Peter" "First Epistle of John" "Second Epistle of John" "Third Epistle of John" "Epistle of Jude" "Book of Revelation")
# short_title_arr=(Genesis Exodus Leviticus Numbers Deuteronomy Joshua Judges Ruth "1 Samuel" "2 Samuel" "1 Kings" "2 Kings" "1 Chronicles" "2 Chronicles" Ezra Nehemiah Esther Job Psalm Proverbs Ecclesiastes "Song of Solomon" Isaiah Jeremiah Lamentations Ezekiel Daniel Hosea Joel Amos Obadiah Jonah Micah Nahum Habakkuk Zephaniah Haggai Zechariah Malachi Matthew Mark Luke John Acts Romans "1 Corinthians" "2 Corinthians" Galatians Ephesians Philippians Colossians "1 Thessalonians" "2 Thessalonians" "1 Timothy" "2 Timothy" Titus Philemon Hebrews James "1 Peter" "2 Peter" "1 John" "2 John" "3 John" Jude Revelation)
# abbreviation_arr=(Gn Ex Lv Nm Dt Jos Jdg Ru 1Sm 2Sm 1Kg 2Kg 1Ch 2Ch Ezr Neh Est Jb Ps Pr Ec Sg Is Jr Lm Ezk Dn Hs Jl Am Ob Jnh Mc Nah Hab Zph Hg Zch Mal Mt Mk Lk Jn Ac Rm 1Co 2Co Gl Eph Php Col 1Th 2Th 1Tm 2Tm Ti Phm Heb Jms 1Pt 2Pt 1Jn 2Jn 3Jn Jd Rv)
