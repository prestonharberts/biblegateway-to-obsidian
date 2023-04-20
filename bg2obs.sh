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

# Titles of the books of the Bible
title_array=("Book of Genesis" "Book of Exodus" "Book of Leviticus" "Book of Numbers" "Book of Deuteronomy" "Book of Joshua" "Book of Judges" "Book of Ruth" "First Book of Samuel" "Second Book of Samuel" "First Book of Kings" "Second Book of Kings" "First Book of Chronicles" "Second Book of Chronicles" "Book of Ezra" "Book of Nehemiah" "Book of Esther" "Book of Job" "Book of Psalms" "Book of Proverbs" "Book of Ecclesiastes" "Song of Solomon" "Book of Isaiah" "Book of Jeremiah" "Book of Lamentations" "Book of Ezekiel" "Book of Daniel" "Book of Hosea" "Book of Joel" "Book of Amos" "Book of Obadiah" "Book of Jonah" "Book of Micah" "Book of Nahum" "Book of Habakkuk" "Book of Zephaniah" "Book of Haggai" "Book of Zechariah" "Book of Malachi" "Gospel of Matthew" "Gospel of Mark" "Gospel of Luke" "Gospel of John" "Acts of the Apostles" "Epistle to the Romans" "First Epistle to the Corinthians" "Second Epistle to the Corinthians" "Epistle to the Galatians" "Epistle to the Ephesians" "Epistle to the Philippians" "Epistle to the Colossians" "First Epistle to the Thessalonians" "Second Epistle to the Thessalonians" "First Epistle to Timothy" "Second Epistle to Timothy" "Epistle to Titus" "Epistle to Philemon" "Epistle to the Hebrews" "Epistle of James" "First Epistle of Peter" "Second Epistle of Peter" "First Epistle of John" "Second Epistle of John" "Third Epistle of John" "Epistle of Jude" "Book of Revelation")

# Abbreviations of the books of the Bible
abbreviation_array=(Genesis Exodus Leviticus Numbers Deuteronomy Joshua Judges Ruth "1 Samuel" "2 Samuel" "1 Kings" "2 Kings" "1 Chronicles" "2 Chronicles" Ezra Nehemiah Esther Job Psalm Proverbs Ecclesiastes "Song of Solomon" Isaiah Jeremiah Lamentations Ezekiel Daniel Hosea Joel Amos Obadiah Jonah Micah Nahum Habakkuk Zephaniah Haggai Zechariah Malachi Matthew Mark Luke John Acts Romans "1 Corinthians" "2 Corinthians" Galatians Ephesians Philippians Colossians "1 Thessalonians" "2 Thessalonians" "1 Timothy" "2 Timothy" Titus Philemon Hebrews James "1 Peter" "2 Peter" "1 John" "2 John" "3 John" Jude Revelation)

# Testaments of the books of the Bible
testament_array=("Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament")

# Genres of the books of the Bible
genre_array=(Pentateuch Pentateuch Pentateuch Pentateuch Pentateuch "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Poetical books" "Poetical books" "Book of Wisdom" "Book of Wisdom" "Book of Wisdom" "Major prophets" "Major prophets" "Major prophets" "Major prophets" "Major prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" Gospels Gospels Gospels Gospels "Church history" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "General epistles" "General epistles" "General epistles" "General epistles" "General epistles" "General epistles" "General epistles" "General epistles" Apocalyptic)

# Create kebab-cased arrays of testament, genre, and book arrays
# TODO: Allow user selection of various naming conventions
standard_title_array=${title_array}
standard_abbreviation_array=${abbreviation_array}
standard_testament_array=${testament_array}
standard_genre_array=${genre_array}
for ((book = 0; book < 66; book++)); do
  standard_title_array[$book]=$(echo "${title_array[$book]}" | sed 's/ /-/g; s/.*/\L&/g')
  standard_abbreviation_array[$book]=$(echo "${abbreviation_array[$book]}" | sed 's/ /-/g; s/.*/\L&/g')
  standard_testament_array[$book]=$(echo "${testament_array[$book]}" | sed 's/ /-/g; s/.*/\L&/g')
  standard_genre_array[$book]=$(echo "${genre_array[$book]}" | sed 's/ /-/g; s/.*/\L&/g')
done

# Initialize the Bible file for all of the Old/New Testament
echo -e "# ${bible_name}\n\n## Contents\n\n[[${standard_testament_array[0]}|${testament_array[0]}]]\n[[${standard_testament_array[39]}|${testament_array[39]}]]" >>"${contents_folder}/${standard_bible_name}.md"

# Initialize the Old/New Testament file for all of the genres
echo -e "# ${testament_array[0]}\n\n## Contents\n\n[[${standard_genre_array[0]}|${genre_array[0]}]]\n[[${standard_genre_array[5]}|${genre_array[5]}]]\n[[${standard_genre_array[17]}|${genre_array[17]}]]\n[[${standard_genre_array[19]}|${genre_array[19]}]]\n[[${standard_genre_array[22]}|${genre_array[22]}]]\n[[${standard_genre_array[27]}|${genre_array[27]}]]" >>"${contents_folder}/${standard_testament_array[0]}.md"
echo -e "# ${testament_array[39]}\n\n## Contents\n\n[[${standard_genre_array[39]}|${genre_array[39]}]]\n[[${standard_genre_array[43]}|${genre_array[43]}]]\n[[${standard_genre_array[44]}|${genre_array[44]}]]\n[[${standard_genre_array[57]}|${genre_array[57]}]]\n[[${standard_genre_array[65]}|${genre_array[65]}]]" >>"${contents_folder}/${standard_testament_array[39]}.md"

# Initialize the genre file for all of the Bible
echo -e "# ${genre_array[0]}\n\n## Contents\n" >>"${contents_folder}/${standard_genre_array[0]}.md"
echo -e "# ${genre_array[5]}\n\n## Contents\n" >>"${contents_folder}/${standard_genre_array[5]}.md"
echo -e "# ${genre_array[17]}\n\n## Contents\n" >>"${contents_folder}/${standard_genre_array[17]}.md"
echo -e "# ${genre_array[19]}\n\n## Contents\n" >>"${contents_folder}/${standard_genre_array[19]}.md"
echo -e "# ${genre_array[22]}\n\n## Contents\n" >>"${contents_folder}/${standard_genre_array[22]}.md"
echo -e "# ${genre_array[27]}\n\n## Contents\n" >>"${contents_folder}/${standard_genre_array[27]}.md"
echo -e "# ${genre_array[39]}\n\n## Contents\n" >>"${contents_folder}/${standard_genre_array[39]}.md"
echo -e "# ${genre_array[43]}\n\n## Contents\n" >>"${contents_folder}/${standard_genre_array[43]}.md"
echo -e "# ${genre_array[44]}\n\n## Contents\n" >>"${contents_folder}/${standard_genre_array[44]}.md"
echo -e "# ${genre_array[57]}\n\n## Contents\n" >>"${contents_folder}/${standard_genre_array[57]}.md"
echo -e "# ${genre_array[65]}\n\n## Contents\n" >>"${contents_folder}/${standard_genre_array[65]}.md"

# Book chapter list
length_array=(50 40 27 36 34 24 21 4 31 24 22 25 29 36 10 13 10 42 150 31 12 8 66 52 5 48 12 14 3 9 1 4 7 3 3 3 2 14 4 28 16 24 21 28 16 16 13 6 6 4 4 5 3 6 4 3 1 13 5 5 3 5 1 1 1 22)

echo "Starting download of the ${translation} Bible."

# Cycling through the book counter, setting which book and its max chapter
for ((book = 0; book < 66; book++)); do

  echo "" # Make a new line which the '-n' flag to the echo command prevents.

  title="${title_array[$book]}"
  standard_title="${standard_title_array[$book]}"
  abbreviation="${abbreviation_array[$book]}"
  standard_abbreviation="${standard_abbreviation_array[$book]}"
  standard_genre="${standard_genre_array[$book]}"
  max_chapter=${length_array[$book]}

  echo -n "${abbreviation} "

  # Create an overview file for each book of the Bible:
  echo -e "# ${title}\n\n## Contents\n" >>"${contents_folder}/${standard_title}.md"

  # Create an overview file for each book of the Bible:
  echo -e "[[${standard_title}|${title}]]" >>"${contents_folder}/${standard_genre}.md"

  for ((chapter = 1; chapter <= max_chapter; chapter++)); do

    echo -n "."

    ((prevchapter = chapter - 1)) # Counting the previous and next chapter for navigation
    ((nextchapter = chapter + 1))

    # Exporting
    export_prefix="${standard_abbreviation}-"
    filename="${export_prefix}${chapter}" # Setting the filename

    previous_file="${export_prefix}${prevchapter}" # Naming previous and next files
    next_file="${export_prefix}${nextchapter}"

    if [[ $chapter -gt 1 ]]; then
      echo -en "[[${standard_abbreviation}-${chapter}|]]" >>"${contents_folder}/${standard_title}.md"
    else
      echo -en "[[${standard_abbreviation}-${chapter}|Start reading]]" >>"${contents_folder}/${standard_title}.md"
    fi

    audio_bible="![[${standard_abbreviation}-$chapter.mp3]]"
    contents="## Contents\n\n[[${standard_abbreviation}-${chapter}-notes|Chapter notes]]"

    # Formatting Navigation and omitting links that aren't necessary
    if [[ $max_chapter -eq 1 ]]; then
      # For a book that only has one chapter
      navigation="${contents}"
    elif [[ $chapter -eq $max_chapter ]]; then
      # If this is the last chapter of the book
      navigation="${contents}\n\n## Related\n\n[[${previous_file}|Previous chapter]]"
    elif [[ ${chapter} -eq 1 ]]; then
      # If this is the first chapter of the book
      navigation="${contents}\n\n## Related\n\n[[${next_file}|Next chapter]]"
    else
      # Navigation for everything else
      navigation="${contents}\n\n## Related\n\n[[${previous_file}|Previous chapter]]\n[[${next_file}|Next chapter]]"
    fi

    text=$(ruby bg2md.rb -e -c -f -l -r -v "${translation}" "${abbreviation} ${chapter}") # This calls the 'bg2mdmod' script

    text=$(echo "${text}" | sed 's/^(.*?)v1/v1/') # Deleting unwanted headers

    # Formatting the title for markdown
    title="# ${abbreviation} ${chapter}"

    # Navigation format
    export="${title}\n\n${audio_bible}\n${text}\n\n${navigation}"

    # Export
    echo -e "$export" >>"${reading_folder}/${filename}.md"
    echo -e "$export" >>"${notes_folder}/${filename}-notes.md"

  done # End of the book exporting loop

done

# Tidy up the Markdown files

echo "Cleaning up the Markdown files."

# Format verses into H6 headers
find . -type f -name "*.md" -exec sed -i 's/###### [0-9] /\n\n&\n\n/g' {} +
find . -type f -name "*.md" -exec sed -i 's/###### [0-9][0-9] /\n\n&\n\n/g' {} +
find . -type f -name "*.md" -exec sed -i 's/###### [0-9][0-9][0-9] /\n\n&\n\n/g' {} +

# Remove spaces at the beginning of verses
find . -type f -name "*.md" -exec sed -i 's/^ *//g' {} +

# Correct Psalm headings for certain translations
find . -type f -name "*.md" -exec sed -i 's/^Psalm [0-9][0-9][0-9]//' {} +
find . -type f -name "*.md" -exec sed -i 's/^Psalm [0-9][0-9]//' {} +
find . -type f -name "*.md" -exec sed -i 's/^Psalm [0-9]//' {} +

# Create editorial headers
find . -type f -name "*[0-9].md" -exec sed -i '5 s/[A-Za-z0-9].*/\n## &/' {} +             # Make first header if it exists
find . -type f -name "*.md" -exec sed -i 's/\.\"[A-Z0-9].*[A-Za-z0-9]$/\.\"\n\n## &/' {} + # Header following quotes (period)
find . -type f -name "*.md" -exec sed -i 's/## \.\"/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/!\"[A-Z0-9].*[A-Za-z0-9]$/!\"\n\n## &/' {} + # Header following quotes (exclamation mark)
find . -type f -name "*.md" -exec sed -i 's/## !\"/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/?\"[A-Z0-9].*[A-Za-z0-9]$/?\"\n\n## &/' {} + # Header following quotes (question mark)
find . -type f -name "*.md" -exec sed -i 's/## ?\"/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/\.'\''[A-Z0-9].*[A-Za-z0-9]$/\.'\''\n\n## &/' {} + # Header following apostrophes (period)
find . -type f -name "*.md" -exec sed -i 's/## \.'\''/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/!'\''[A-Z0-9].*[A-Za-z0-9]$/!'\''\n\n## &/' {} + # Header following apostrophes (exclamation mark)
find . -type f -name "*.md" -exec sed -i 's/## !'\''/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/?'\''[A-Z0-9].*[A-Za-z0-9]$/?'\''\n\n### &/' {} + # Header following apostrophes (question mark)
find . -type f -name "*.md" -exec sed -i 's/## ?'\''/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/)[A-Z0-9].*[A-Za-z0-9]$/)\n\n## &/' {} + # Header following parentheses
find . -type f -name "*.md" -exec sed -i 's/## )/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/![A-Z0-9].*[A-Za-z0-9]$/!\n\n## &/' {} + # Header following exclamation mark
find . -type f -name "*.md" -exec sed -i 's/## !/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/?[A-Z0-9].*[A-Za-z0-9]$/?\n\n## &/' {} + # Header following exclamation mark
find . -type f -name "*.md" -exec sed -i 's/## ?/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/\.[A-Z0-9].*[A-Za-z0-9]$/\.\n\n## &/' {} +
find . -type f -name "*.md" -exec sed -i 's/## \./## /' {} +

# Delete spaces after text
find . -type f -name "*.md" -exec sed -i 's/ *$//' {} +

# Delete empty headers
find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/#*$//g'

# Add space after
find . -type f -name "*.md" -exec sed -i 's/\.[A-Za-z0-9]/\.\.\.&/' {} + # periods
find . -type f -name "*.md" -exec sed -i 's/\.\.\.\./\. /' {} +
find . -type f -name "*.md" -exec sed -i 's/\.\"[A-Za-z0-9]/\.\.\.&/' {} + # quotation (period)
find . -type f -name "*.md" -exec sed -i 's/\.\.\.\.\"/\.\" /' {} +
find . -type f -name "*.md" -exec sed -i 's/!\"[A-Za-z0-9]/\.\.\.&/' {} + # quotation (exclamation mark)
find . -type f -name "*.md" -exec sed -i 's/\.\.\.!\"/\!\" /' {} +
find . -type f -name "*.md" -exec sed -i 's/?\"[A-Za-z0-9]/\.\.\.&/' {} + # quotation (question mark)
find . -type f -name "*.md" -exec sed -i 's/\.\.\.?\"/?\" /' {} +
find . -type f -name "*.md" -exec sed -i 's/\.'\''[A-Za-z0-9]/\.\.\.&/' {} + # apostrophe (period)
find . -type f -name "*.md" -exec sed -i 's/\.\.\.\.'\''/\.'\'' /' {} +
find . -type f -name "*.md" -exec sed -i 's/!'\''[A-Za-z0-9]/\.\.\.&/' {} + # apostrophe (exclamation mark)
find . -type f -name "*.md" -exec sed -i 's/\.\.\.!'\''/!'\'' /' {} +
find . -type f -name "*.md" -exec sed -i 's/?'\''[A-Za-z0-9]/\.\.\.&/' {} + # apostrophe (question mark)
find . -type f -name "*.md" -exec sed -i 's/\.\.\.?'\''/?'\'' /' {} +
find . -type f -name "*.md" -exec sed -i 's/)[A-Za-z0-9]/\.\.\.&/' {} + # parentheses
find . -type f -name "*.md" -exec sed -i 's/\.\.\.)/) /' {} +

# Add newline betweeen commas and quotation mark
find . -type f -name "*.md" -exec sed -i 's/\,\"[A-Za-z0-9]/\.\.\.&/' {} +
find . -type f -name "*.md" -exec sed -i 's/\.\.\.\,\"/\,\n\"/' {} +

# Add newline after second headers (will be removed later if redundant)
find . -type f -name "*.md" -exec sed -i 's/## .*/&\n/' {} +

# Delete Psalm book headings
find . -type f -name "*.md" -exec sed -i 's/## Book One//' {} +
find . -type f -name "*.md" -exec sed -i 's/## Book Two//' {} +
find . -type f -name "*.md" -exec sed -i 's/## Book Three//' {} +
find . -type f -name "*.md" -exec sed -i 's/## Book Four//' {} +
find . -type f -name "*.md" -exec sed -i 's/## Book Five//' {} +

# Correct newline spacing
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n\n\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n\n\n\n/;ba;}' {} +

# Fix mp3 link
find . -type f -name "*.md" -exec sed -i 's/\. mp3/\.mp3/' {} +

# Fix some superscripts back to verses

find . -type f -name "*.md" -exec sed -i 's/ <sup class=\"versenum mid-line\">/\n\n###### /' {} +
find . -type f -name "*.md" -exec sed -i 's/<\/sup>/\n\n/' {} +
find . -type f -name "*.md" -exec sed -i 's/<sup class=\"versenum mid-line\">/\n\n###### /' {} +
find . -type f -name "*.md" -exec sed -i 's/<\/sup>/\n\n/' {} +

# Remove tags
find . -type f -name "*.md" -exec sed -i 's/<b class="quote">//' {} +
find . -type f -name "*.md" -exec sed -i 's/\*\*//' {} +

# Correct newline spacing
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n\n/;ba;}' {} +

# Make first header if it exists
find . -type f -name "*notes.md" -exec sed -i '5 s/[A-Za-z0-9].*/\n## &/' {} +

# Make note files empty
find . -type f -name "*notes.md" -exec sed -i 's/^[^#![].*//g' {} +
find . -type f -name "*notes.md" -exec sed -i 's/###### [0-9]*//g' {} +

# Remove audio bible
find . -type f -name "*notes.md" -exec sed -i 's/.*mp3.*//g' {} +

# Add ' notes' to the title header
find . -type f -name "*notes.md" -exec sed -i '1 s/$/ notes/g' {} +

# Remove Contents
find . -type f -name "*notes.md" -exec sed -i 's/## Contents//g' {} +
find . -type f -name "*notes.md" -exec sed -i 's/\[\[.*notes\]\]//g' {} +

# Change Related notes
find . -type f -name "*notes.md" -exec sed -i 's/|Previous/-notes|Previous/g' {} +
find . -type f -name "*notes.md" -exec sed -i 's/|Next/-notes|Next/g' {} +

# Correct newline spacing
find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n\n\n\n/;ba;}' {} +
find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n\n\n\n/;ba;}' {} +

# Add space after headers
find . -type f -name "*notes.md" -exec sed -i 's/^## .*/&\n\n- [ ] /g' {} +

# Remove 1 headers
find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/## 1\n\n//;ba;}' {} +

# Fix Related spacing
# find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/\n\n- [ ] \n\n\[\[/\n\n\[\[/;ba;}' {} +
find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/## Related\n\n- \[ \] /## Related/;ba;}' {} +

echo "Download complete. Markdown files ready for Obsidian import."
