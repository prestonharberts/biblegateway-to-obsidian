#!/bin/bash

translation="CSB" # Which translation to use
bible_name="Bible"


standard_translation=$(echo "${translation}" | sed 's/ /-/g; s/.*/\L&/g')
standard_bible_name=$(echo "${bible_name}" | sed 's/ /-/g; s/.*/\L&/g')
bible_folder="./${standard_bible_name}-${standard_translation}"
mkdir -p "${bible_folder}"

audio_folder="${bible_folder}/audio"
contents_folder="${bible_folder}/contents"
notes_folder="${bible_folder}/notes"
reading_folder="${bible_folder}/reading"

mkdir -p "${audio_folder}" "${contents_folder}" "${notes_folder}" "${reading_folder}"

# Book chapter list
length_array=(50 40 27 36 34 24 21 4 31 24 22 25 29 36 10 13 10 42 150 31 12 8 66 52 5 48 12 14 3 9 1 4 7 3 3 3 2 14 4 28 16 24 21 28 16 16 13 6 6 4 4 5 3 6 4 3 1 13 5 5 3 5 1 1 1 22)

# Long titles of the books of the Bible
long_title_array=("Book of Genesis" "Book of Exodus" "Book of Leviticus" "Book of Numbers" "Book of Deuteronomy" "Book of Joshua" "Book of Judges" "Book of Ruth" "First Book of Samuel" "Second Book of Samuel" "First Book of Kings" "Second Book of Kings" "First Book of Chronicles" "Second Book of Chronicles" "Book of Ezra" "Book of Nehemiah" "Book of Esther" "Book of Job" "Book of Psalms" "Book of Proverbs" "Book of Ecclesiastes" "Song of Solomon" "Book of Isaiah" "Book of Jeremiah" "Book of Lamentations" "Book of Ezekiel" "Book of Daniel" "Book of Hosea" "Book of Joel" "Book of Amos" "Book of Obadiah" "Book of Jonah" "Book of Micah" "Book of Nahum" "Book of Habakkuk" "Book of Zephaniah" "Book of Haggai" "Book of Zechariah" "Book of Malachi" "Gospel of Matthew" "Gospel of Mark" "Gospel of Luke" "Gospel of John" "Acts of the Apostles" "Epistle to the Romans" "First Epistle to the Corinthians" "Second Epistle to the Corinthians" "Epistle to the Galatians" "Epistle to the Ephesians" "Epistle to the Philippians" "Epistle to the Colossians" "First Epistle to the Thessalonians" "Second Epistle to the Thessalonians" "First Epistle to Timothy" "Second Epistle to Timothy" "Epistle to Titus" "Epistle to Philemon" "Epistle to the Hebrews" "Epistle of James" "First Epistle of Peter" "Second Epistle of Peter" "First Epistle of John" "Second Epistle of John" "Third Epistle of John" "Epistle of Jude" "Book of Revelation")

# Short titles of the books of the Bible
short_title_array=(Genesis Exodus Leviticus Numbers Deuteronomy Joshua Judges Ruth "1 Samuel" "2 Samuel" "1 Kings" "2 Kings" "1 Chronicles" "2 Chronicles" Ezra Nehemiah Esther Job Psalm Proverbs Ecclesiastes "Song of Solomon" Isaiah Jeremiah Lamentations Ezekiel Daniel Hosea Joel Amos Obadiah Jonah Micah Nahum Habakkuk Zephaniah Haggai Zechariah Malachi Matthew Mark Luke John Acts Romans "1 Corinthians" "2 Corinthians" Galatians Ephesians Philippians Colossians "1 Thessalonians" "2 Thessalonians" "1 Timothy" "2 Timothy" Titus Philemon Hebrews James "1 Peter" "2 Peter" "1 John" "2 John" "3 John" Jude Revelation)

# Abbreviations of the books of the Bible
abbreviation_array=(Gn Ex Lv Nm Dt Jos Jdg Ru 1Sm 2Sm 1Kg 2Kg 1Ch 2Ch Ezr Neh Est Jb Ps Pr Ec Sg Is Jr Lm Ezk Dn Hs Jl Am Ob Jnh Mc Nah Hab Zph Hg Zch Mal Mt Mk Lk Jn Ac Rm 1Co 2Co Gl Eph Php Col 1Th 2Th 1Tm 2Tm Ti Phm Heb Jms 1Pt 2Pt 1Jn 2Jn 3Jn Jd Rv)

# Testaments of the books of the Bible
testament_array=("Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament")

# Genres of the books of the Bible
genre_array=(Pentateuch Pentateuch Pentateuch Pentateuch Pentateuch "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Poetical books" "Poetical books" "Book of Wisdom" "Book of Wisdom" "Book of Wisdom" "Major prophets" "Major prophets" "Major prophets" "Major prophets" "Major prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" Gospels Gospels Gospels Gospels "Church history" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "General epistles" "General epistles" "General epistles" "General epistles" "General epistles" "General epistles" "General epistles" "General epistles" Apocalyptic)

# Create kebab-cased arrays of testament, genre, and book arrays
# TODO: Allow user selection of various naming conventions
standard_long_title_array=${long_title_array}
standard_short_title_array=${short_title_array}
standard_abbreviation_array=${abbreviation_array}
standard_testament_array=${testament_array}
standard_genre_array=${genre_array}
for ((book = 0; book < 66; book++)); do
  standard_long_title_array[$book]=$(echo "${long_title_array[$book]}" | sed 's/ /-/g; s/.*/\L&/g')
  standard_short_title_array[$book]=$(echo "${short_title_array[$book]}" | sed 's/ /-/g; s/.*/\L&/g')
  standard_abbreviation_array[$book]=$(echo "${abbreviation_array[$book]}" | sed 's/ /-/g; s/.*/\L&/g')
  standard_testament_array[$book]=$(echo "${testament_array[$book]}" | sed 's/ /-/g; s/.*/\L&/g')
  standard_genre_array[$book]=$(echo "${genre_array[$book]}" | sed 's/ /-/g; s/.*/\L&/g')
done
