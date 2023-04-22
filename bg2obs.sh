#!/bin/bash

# Customize the following if needed
translation="CSB" # Which translation to use
bible_name="Bible"

long_title_array=("Book of Genesis" "Book of Exodus" "Book of Leviticus" "Book of Numbers" "Book of Deuteronomy" "Book of Joshua" "Book of Judges" "Book of Ruth" "First Book of Samuel" "Second Book of Samuel" "First Book of Kings" "Second Book of Kings" "First Book of Chronicles" "Second Book of Chronicles" "Book of Ezra" "Book of Nehemiah" "Book of Esther" "Book of Job" "Book of Psalms" "Book of Proverbs" "Book of Ecclesiastes" "Song of Solomon" "Book of Isaiah" "Book of Jeremiah" "Book of Lamentations" "Book of Ezekiel" "Book of Daniel" "Book of Hosea" "Book of Joel" "Book of Amos" "Book of Obadiah" "Book of Jonah" "Book of Micah" "Book of Nahum" "Book of Habakkuk" "Book of Zephaniah" "Book of Haggai" "Book of Zechariah" "Book of Malachi" "Gospel of Matthew" "Gospel of Mark" "Gospel of Luke" "Gospel of John" "Acts of the Apostles" "Epistle to the Romans" "First Epistle to the Corinthians" "Second Epistle to the Corinthians" "Epistle to the Galatians" "Epistle to the Ephesians" "Epistle to the Philippians" "Epistle to the Colossians" "First Epistle to the Thessalonians" "Second Epistle to the Thessalonians" "First Epistle to Timothy" "Second Epistle to Timothy" "Epistle to Titus" "Epistle to Philemon" "Epistle to the Hebrews" "Epistle of James" "First Epistle of Peter" "Second Epistle of Peter" "First Epistle of John" "Second Epistle of John" "Third Epistle of John" "Epistle of Jude" "Book of Revelation")
short_title_array=(Genesis Exodus Leviticus Numbers Deuteronomy Joshua Judges Ruth "1 Samuel" "2 Samuel" "1 Kings" "2 Kings" "1 Chronicles" "2 Chronicles" Ezra Nehemiah Esther Job Psalm Proverbs Ecclesiastes "Song of Solomon" Isaiah Jeremiah Lamentations Ezekiel Daniel Hosea Joel Amos Obadiah Jonah Micah Nahum Habakkuk Zephaniah Haggai Zechariah Malachi Matthew Mark Luke John Acts Romans "1 Corinthians" "2 Corinthians" Galatians Ephesians Philippians Colossians "1 Thessalonians" "2 Thessalonians" "1 Timothy" "2 Timothy" Titus Philemon Hebrews James "1 Peter" "2 Peter" "1 John" "2 John" "3 John" Jude Revelation)
abbreviation_array=(Gn Ex Lv Nm Dt Jos Jdg Ru 1Sm 2Sm 1Kg 2Kg 1Ch 2Ch Ezr Neh Est Jb Ps Pr Ec Sg Is Jr Lm Ezk Dn Hs Jl Am Ob Jnh Mc Nah Hab Zph Hg Zch Mal Mt Mk Lk Jn Ac Rm 1Co 2Co Gl Eph Php Col 1Th 2Th 1Tm 2Tm Ti Phm Heb Jms 1Pt 2Pt 1Jn 2Jn 3Jn Jd Rv)

old_testament="Old Testament"
new_testament="New Testament"

testament_array=("${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${old_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}" "${new_testament}")
genre_array=(Pentateuch Pentateuch Pentateuch Pentateuch Pentateuch "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Poetical books" "Poetical books" "Book of Wisdom" "Book of Wisdom" "Book of Wisdom" "Major prophets" "Major prophets" "Major prophets" "Major prophets" "Major prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" Gospels Gospels Gospels Gospels "Church history" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "General epistles" "General epistles" "General epistles" "General epistles" "General epistles" "General epistles" "General epistles" "General epistles" Apocalyptic)

book_max=66
length_array=(50 40 27 36 34 24 21 4 31 24 22 25 29 36 10 13 10 42 150 31 12 8 66 52 5 48 12 14 3 9 1 4 7 3 3 3 2 14 4 28 16 24 21 28 16 16 13 6 6 4 4 5 3 6 4 3 1 13 5 5 3 5 1 1 1 22)

# Create kebab-cased variables
standard_translation=$(echo "${translation}" | sed 's/ /-/g; s/.*/\L&/g')
standard_bible_name=$(echo "${bible_name}" | sed 's/ /-/g; s/.*/\L&/g')
for ((book = 0; book < book_max; book++)); do
  standard_long_title_array[book]=$(echo "${long_title_array[$book]}" | sed 's/ /-/g; s/.*/\L&/g')
  standard_short_title_array[book]=$(echo "${short_title_array[$book]}" | sed 's/ /-/g; s/.*/\L&/g')
  standard_abbreviation_array[book]=$(echo "${abbreviation_array[$book]}" | sed 's/ /-/g; s/.*/\L&/g')
  standard_testament_array[book]=$(echo "${testament_array[$book]}" | sed 's/ /-/g; s/.*/\L&/g')
  standard_genre_array[book]=$(echo "${genre_array[$book]}" | sed 's/ /-/g; s/.*/\L&/g')
done

bible_folder="./${standard_bible_name}-${standard_translation}"
audio_folder="${bible_folder}/audio"
contents_folder="${bible_folder}/contents"
notes_folder="${bible_folder}/notes"
reading_folder="${bible_folder}/reading"

mkdir -p "${bible_folder}"
mkdir -p "${audio_folder}" "${contents_folder}" "${notes_folder}" "${reading_folder}"

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

# Name of the audio Bible file
audio_bible_name="Audio Bible"
standard_audio_bible_name=$(echo "${audio_bible_name}" | sed 's/ /-/g; s/.*/\L&/g')
# Initialize audio Bible file
echo -e "## ${audio_bible_name}\n" >>"${contents_folder}/${standard_audio_bible_name}.md"

for ((book = 0; book < book_max; book++)); do
  short_title="${short_title_array[$book]}"
  standard_abbreviation="${standard_abbreviation_array[$book]}"
  chapter_max=${length_array[$book]}

  if [[ $book != 0 ]]; then
    ((previous_book_num = book - 1))
  fi
  ((next_book_num = book + 1))

  previous_book="${short_title[previous_book_num]}"
  next_book="${short_title[next_book_num]}"

  for ((chapter = 1; chapter <= chapter_max; chapter++)); do
    title="${short_title} ${chapter}"
    audio_bible="![[${standard_abbreviation}${chapter}.mp3]]"
    echo -e "${title}\n${audio_bible}" >>"${contents_folder}/${standard_abbreviation}-audio.md"
  done

  # Formatting Navigation and omitting links that aren't necessary
  if [[ $book -eq 0 ]]; then
    # For Genesis
    navigation="\n[[${standard_audio_bible_name}|All books]]\n[[${next_book}-audio|Next book]]"
  elif [[ $book -eq 65 ]]; then
    # For Revelation
    navigation="\n[[${standard_audio_bible_name}|All books]]\n[[${previous_book}-audio|Previous book]]"
    # For every other book
  else
    # Navigation for everything else
    navigation="\n[[${standard_audio_bible_name}|All books]]\n[[${previous_book}-audio|Previous book]]\n[[${next_book}-audio|Next book]]"
  fi

  if [[ "${navigation}" != "" ]]; then
    echo -e "${navigation}" >>"${contents_folder}/${standard_abbreviation}-audio.md"
  fi

  echo -e "[[${standard_abbreviation}-audio|${short_title}]]" >>"${contents_folder}/${standard_audio_bible_name}.md"
done

echo "Starting download of the ${translation} Bible."

# Cycling through the book counter, setting which book and its max chapter
for ((book = 0; book < book_max; book++)); do
  echo "" # Make a new line which the '-n' flag to the echo command prevents.

  long_title="${long_title_array[$book]}"
  short_title="${short_title_array[$book]}"
  standard_long_title="${standard_long_title_array[$book]}"
  standard_abbreviation="${standard_abbreviation_array[$book]}"
  standard_genre="${standard_genre_array[$book]}"
  chapter_max=${length_array[$book]}

  echo -n "${short_title} "

  # Create an overview file for each book of the Bible:
  echo -e "# ${long_title}\n\n## Contents\n" >>"${contents_folder}/${standard_long_title}.md"
  # Create an overview file for each book of the Bible:
  echo -e "[[${standard_long_title}|${long_title}]]" >>"${contents_folder}/${standard_genre}.md"

  for ((chapter = 1; chapter <= chapter_max; chapter++)); do
    echo -n "."

    ((prevchapter = chapter - 1)) # Counting the previous and next chapter for navigation
    ((nextchapter = chapter + 1))

    # Exporting
    export_prefix="${standard_abbreviation}"
    filename="${export_prefix}${chapter}"          # Setting the filename
    previous_file="${export_prefix}${prevchapter}" # Naming previous and next files
    next_file="${export_prefix}${nextchapter}"

    if [[ $chapter -gt 1 ]]; then
      echo -en "[[${export_prefix}${chapter}|]]" >>"${contents_folder}/${standard_long_title}.md"
    else
      echo -en "[[${export_prefix}${chapter}|Start reading]]" >>"${contents_folder}/${standard_long_title}.md"
    fi

    audio_bible="![[${filename}.mp3]]"
    contents="## Contents\n\n[[${filename}-notes|Chapter notes]]"

    # Formatting Navigation and omitting links that aren't necessary
    if [[ $chapter_max -eq 1 ]]; then
      # For a book that only has one chapter
      navigation="${contents}"
    elif [[ $chapter -eq $chapter_max ]]; then
      # If this is the last chapter of the book
      navigation="${contents}\n\n## Related\n\n[[${previous_file}|Previous chapter]]"
    elif [[ ${chapter} -eq 1 ]]; then
      # If this is the first chapter of the book
      navigation="${contents}\n\n## Related\n\n[[${next_file}|Next chapter]]"
    else
      # Navigation for everything else
      navigation="${contents}\n\n## Related\n\n[[${previous_file}|Previous chapter]]\n[[${next_file}|Next chapter]]"
    fi

    text=$(ruby bg2md.rb -e -c -f -l -r -v "${translation}" "${short_title} ${chapter}") # This calls the 'bg2mdmod' script
    # text=$(echo "${text}" | sed 's/^(.*?)v1/v1/') # Deleting unwanted headers
    text="${text/^(.*?)v1/v1/}" # Deleting unwanted headers

    # Export
    echo -e "# ${short_title} ${chapter}\n\n${audio_bible}\n${text}\n\n${navigation}" >>"${reading_folder}/${filename}.md"
    echo -e "# ${short_title} ${chapter}\n\n${audio_bible}\n${text}\n\n${navigation}" >>"${notes_folder}/${filename}-notes.md"
  done # End of the book exporting loop
done

# Tidy up the markdown files

printf "\nCleaning up the Markdown files."

# Format verses into H6 headers
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/###### [0-9] /\n\n&\n\n/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/###### [0-9][0-9] /\n\n&\n\n/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/###### [0-9][0-9][0-9] /\n\n&\n\n/g' {} +

# Remove spaces at the beginning of verses
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/^ *//g' {} +

# Correct Psalm headings for certain translations
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/^Psalm [0-9][0-9][0-9]//g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/^Psalm [0-9][0-9]//g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/^Psalm [0-9]//g' {} +

# Create editorial headers
find . -type f -wholename "*[0-9].md" -exec sed -i '5 s/[A-Za-z0-9].*/\n## &/g' {} +                               # Make first header if it exists
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/\.\"[A-Z0-9].*[A-Za-z0-9]$/\.\"\n\n## &/g' {} + # Header following quotes (period)
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/## \.\"/## /g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/!\"[A-Z0-9].*[A-Za-z0-9]$/!\"\n\n## &/g' {} + # Header following quotes (exclamation mark)
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/## !\"/## /g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/?\"[A-Z0-9].*[A-Za-z0-9]$/?\"\n\n## &/g' {} + # Header following quotes (question mark)
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/## ?\"/## /g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/\.'\''[A-Z0-9].*[A-Za-z0-9]$/\.'\''\n\n## &/g' {} + # Header following apostrophes (period)
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/## \.'\''/## /g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/!'\''[A-Z0-9].*[A-Za-z0-9]$/!'\''\n\n## &/g' {} + # Header following apostrophes (exclamation mark)
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/## !'\''/## /g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/?'\''[A-Z0-9].*[A-Za-z0-9]$/?'\''\n\n### &/g' {} + # Header following apostrophes (question mark)
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/## ?'\''/## /g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/)[A-Z0-9].*[A-Za-z0-9]$/)\n\n## &/g' {} + # Header following parentheses
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/## )/## /g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/![A-Z0-9].*[A-Za-z0-9]$/!\n\n## &/g' {} + # Header following exclamation mark
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/## !/## /g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/?[A-Z0-9].*[A-Za-z0-9]$/?\n\n## &/g' {} + # Header following exclamation mark
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/## ?/## /g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/\.[A-Z0-9].*[A-Za-z0-9]$/\.\n\n## &/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/## \./## /g' {} +

find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/ *$//g' {} +      # Delete spaces after text
find . -wholename "${reading_folder}/*.md" -print0 | xargs -0 perl -pi -e 's/#*$//g' # Delete empty headers

# Add space after
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/\.[A-Za-z0-9]/\.\.\.&/g' {} + # periods
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/\.\.\.\./\. /g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/\.\"[A-Za-z0-9]/\.\.\.&/g' {} + # quotation (period)
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/\.\.\.\.\"/\.\" /g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/!\"[A-Za-z0-9]/\.\.\.&/g' {} + # quotation (exclamation mark)
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/\.\.\.!\"/\!\" /g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/?\"[A-Za-z0-9]/\.\.\.&/g' {} + # quotation (question mark)
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/\.\.\.?\"/?\" /g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/\.'\''[A-Za-z0-9]/\.\.\.&/g' {} + # apostrophe (period)
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/\.\.\.\.'\''/\.'\'' /g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/!'\''[A-Za-z0-9]/\.\.\.&/g' {} + # apostrophe (exclamation mark)
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/\.\.\.!'\''/!'\'' /g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/?'\''[A-Za-z0-9]/\.\.\.&/g' {} + # apostrophe (question mark)
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/\.\.\.?'\''/?'\'' /g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/)[A-Za-z0-9]/\.\.\.&/g' {} + # parentheses
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/\.\.\.)/) /g' {} +

# Add newline betweeen commas and quotation mark
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/\,\"[A-Za-z0-9]/\.\.\.&/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/\.\.\.\,\"/\,\n\"/g' {} +

# Add newline after second headers (will be removed later if redundant)
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/## .*/&\n/g' {} +

# Delete Psalm book headings
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/## Book One//g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/## Book Two//g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/## Book Three//g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/## Book Four//g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/## Book Five//g' {} +

# Correct newline spacing
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n\n\n\n/;ba;}' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n\n\n\n/;ba;}' {} +

# Fix mp3 link
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/\. mp3/\.mp3/g' {} +

# Fix some superscripts back to verses

find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/ <sup class=\"versenum mid-line\">/\n\n###### /g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/<\/sup>/\n\n/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/<sup class=\"versenum mid-line\">/\n\n###### /g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/<\/sup>/\n\n/g' {} +

# Remove tags
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/<b class="quote">//g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/\*\*//g' {} +

# Correct newline spacing
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n\n/;ba;}' {} +

# Turn H6 into numbered list
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/###### //g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/ *$//g' {} + # Delete spaces after text
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/^[0-9][0-9][0-9]$/&.temp1/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/^[0-9][0-9]$/&.temp1/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/^[0-9]$/&.temp1/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/temp1\n\n/ /;ba;}' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/^[0-9][0-9][0-9]\./temp2&/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/^[0-9][0-9]\./temp2&/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/^[0-9]\./temp2&/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\ntemp2//;ba;}' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/^##.*$/&\n/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/mp3\]\]/&\n/g' {} +

# Correct newline spacing
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n\n\n\n/;ba;}' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n\n\n\n/;ba;}' {} +

# Make first header if it exists
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i '5 s/[A-Za-z0-9].*/\n## &/g' {} +

# Make note files empty
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i 's/^[^#![].*//g' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i 's/###### [0-9]*//g' {} +

# Remove audio bible
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i 's/.*mp3.*//g' {} +

# Add ' notes' to the title header
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i '1 s/$/ notes/g' {} +

# Remove Contents
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i 's/## Contents//g' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i 's/\[\[.*notes\]\]//g' {} +

# Change Related notes
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i 's/|Previous/-notes|Previous/g' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i 's/|Next/-notes|Next/g' {} +

# Correct newline spacing
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n\n\n\n/;ba;}' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n\n\n\n/;ba;}' {} +

# Add space after headers
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i 's/^## .*/&\n\n- [ ] /g' {} +

# Remove 1 headers
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/## 1\n\n//;ba;}' {} +

# Fix Related spacing
# find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n- [ ] \n\n\[\[/\n\n\[\[/;ba;}' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/## Related\n\n- \[ \] /## Related/;ba;}' {} +

printf "\nDownload complete. Markdown files ready for Obsidian import.\n"
