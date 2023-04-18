#!/bin/bash

translation='ESV'    # Which translation to use

# Copyright disclaimer
echo "I confirm that I will not distribute the generated files if the copyright standards require me not to and wish to continue downloading the $translation in its entirety:"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) exit;;
    esac
done

# Initialize variables
book_counter=0 # Setting the counter to 0
book_counter_max=66 # Setting the max amount to 66, since there are 66 books we want to import

# Book list
declare -a bookarraytext # Declaring the Books of the Bible as a list to be used in text
declare -a bookarrayfile # Declaring the Books of the Bible as a list to be used as filenames
declare -a abbarraytext # Delaring the abbreviations for each book to be used in text
declare -a abbarrayfile # Delaring the abbreviations for each book to be used as filenames
declare -a testarraytext # Declaring the testaments for each book to be used in tables of contents
declare -a testarrayfile # Declaring the testaments for each book to be used as filenames
declare -a genrearraytext # Declaring the genres for each book to be used in tables of contents
declare -a genrearrayfile # Declaring the genres for each book to be used as filenames
declare -a lengtharray # Declaring amount of chapters in each book

# -------------------------------------------
# TRANSLATION: Lists of Names
# -------------------------------------------
# For Translation, translate these three lists. Seperated by space and wrapped in quotes if they include whitespace.
# Name of "The Bible" in your language and make a folder for it if it does not exist
biblenametext="Bible"
biblenamefile="bible"
# Name of the parent folder that the bible folder will be inside
parentfolder="christianity"
# Make folders
mkdir -p "${parentfolder}"
mkdir -p "${parentfolder}/${biblenamefile}"
# Full names of the books of the Bible
bookarraytext=("Book of Genesis" "Book of Exodus" "Book of Leviticus" "Book of Numbers" "Book of Deuteronomy" "Book of Joshua" "Book of Judges" "Book of Ruth" "First Book of Samuel" "Second Book of Samuel" "First Book of Kings" "Second Book of Kings" "First Book of Chronicles" "Second Book of Chronicles" "Book of Ezra" "Book of Nehemiah" "Book of Esther" "Book of Job" "Book of Psalms" "Book of Proverbs" "Book of Ecclesiastes" "Song of Solomon" "Book of Isaiah" "Book of Jeremiah" "Book of Lamentations" "Book of Ezekiel" "Book of Daniel" "Book of Hosea" "Book of Joel" "Book of Amos" "Book of Obadiah" "Book of Jonah" "Book of Micah" "Book of Nahum" "Book of Habakkuk" "Book of Zephaniah" "Book of Haggai" "Book of Zechariah" "Book of Malachi" "Gospel of Matthew" "Gospel of Mark" "Gospel of Luke" "Gospel of John" "Acts of the Apostles" "Epistle to the Romans" "First Epistle to the Corinthians" "Second Epistle to the Corinthians" "Epistle to the Galatians" "Epistle to the Ephesians" "Epistle to the Philippians" "Epistle to the Colossians" "First Epistle to the Thessalonians" "Second Epistle to the Thessalonians" "First Epistle to Timothy" "Second Epistle to Timothy" "Epistle to Titus" "Epistle to Philemon" "Epistle to the Hebrews" "Epistle of James" "First Epistle of Peter" "Second Epistle of Peter" "First Epistle of John" "Second Epistle of John" "Third Epistle of John" "Epistle of Jude" "Book of Revelation")
bookarrayfile=(book-of-genesis book-of-exodus book-of-leviticus book-of-numbers book-of-deuteronomy book-of-joshua book-of-judges book-of-ruth first-book-of-samuel second-book-of-samuel first-book-of-kings second-book-of-kings first-book-of-chronicles second-book-of-chronicles book-of-ezra book-of-nehemiah book-of-esther book-of-job book-of-psalms book-of-proverbs book-of-ecclesiastes song-of-solomon book-of-isaiah book-of-jeremiah book-of-lamentations book-of-ezekiel book-of-daniel book-of-hosea book-of-joel book-of-amos book-of-obadiah book-of-jonah book-of-micah book-of-nahum book-of-habakkuk book-of-zephaniah book-of-haggai book-of-zechariah book-of-malachi gospel-of-matthew gospel-of-mark gospel-of-luke gospel-of-john acts-of-the-apostles epistle-to-the-romans first-epistle-to-the-corinthians second-epistle-to-the-corinthians epistle-to-the-galatians epistle-to-the-ephesians epistle-to-the-philippians epistle-to-the-colossians first-epistle-to-the-thessalonians second-epistle-to-the-thessalonians first-epistle-to-timothy second-epistle-to-timothy epistle-to-titus epistle-to-philemon epistle-to-the-hebrews epistle-of-james first-epistle-of-peter second-epistle-of-peter first-epistle-of-john second-epistle-of-john third-epistle-of-john epistle-of-jude book-of-revelation)
# Short names of the books of the Bible
abbarraytext=(Genesis Exodus Leviticus Numbers Deuteronomy Joshua Judges Ruth "1 Samuel" "2 Samuel" "1 Kings" "2 Kings" "1 Chronicles" "2 Chronicles" Ezra Nehemiah Esther Job Psalm Proverbs Ecclesiastes "Song of Solomon" Isaiah Jeremiah Lamentations Ezekiel Daniel Hosea Joel Amos Obadiah Jonah Micah Nahum Habakkuk Zephaniah Haggai Zechariah Malachi Matthew Mark Luke John Acts Romans "1 Corinthians" "2 Corinthians" Galatians Ephesians Philippians Colossians Thessalonians Thessalonians "1 Timothy" "2 Timothy" Titus Philemon Hebrews James "1 Peter" "2 Peter" "1 John" "2 John" "3 John" Jude Revelation)
abbarrayfile=(genesis exodus leviticus numbers deuteronomy joshua judges ruth 1-samuel 2-samuel 1-kings 2-kings 1-chronicles 2-chronicles ezra nehemiah esther job psalm proverbs ecclesiastes song-of-solomon isaiah jeremiah lamentations ezekiel daniel hosea joel amos obadiah jonah micah nahum habakkuk zephaniah haggai zechariah malachi matthew mark luke john acts romans 1-corinthians 2-corinthians galatians ephesians philippians colossians thessalonians thessalonians 1-timothy 2-timothy titus philemon hebrews james 1-peter 2-peter 1-john 2-john 3-john jude revelation)
# Both testaments in an array to be used in parallel with the other arrays
testarraytext=("Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "Old Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament" "New Testament")
testarrayfile=(old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament old-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament new-testament)
# All genres in an array to be used in parallel with the other arrays
genrearraytext=(Pentateuch Pentateuch Pentateuch Pentateuch Pentateuch "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Historical books" "Poetical books" "Poetical books" "Book of Wisdom" "Book of Wisdom" "Book of Wisdom" "Major prophets" "Major prophets" "Major prophets" "Major prophets" "Major prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" "Minor prophets" Gospels Gospels Gospels Gospels "Church history" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "Pauline epistles" "General epistles" "General epistles" "General epistles" "General epistles" "General epistles" "General epistles" "General epistles" "General epistles" Apocalyptic)
genrearrayfile=(pentateuch pentateuch pentateuch pentateuch pentateuch historical-books historical-books historical-books historical-books historical-books historical-books historical-books historical-books historical-books historical-books historical-books historical-books poetical-books poetical-books book-of-wisdom book-of-wisdom book-of-wisdom major-prophets major-prophets major-prophets major-prophets major-prophets minor-prophets minor-prophets minor-prophets minor-prophets minor-prophets minor-prophets minor-prophets minor-prophets minor-prophets minor-prophets minor-prophets minor-prophets gospels gospels gospels gospels church-history pauline-epistles pauline-epistles pauline-epistles pauline-epistles pauline-epistles pauline-epistles pauline-epistles pauline-epistles pauline-epistles pauline-epistles pauline-epistles pauline-epistles pauline-epistles general-epistles general-epistles general-epistles general-epistles general-epistles general-epistles general-epistles general-epistles apocalyptic)
# -------------------------------------------

# Initialize the Bible file for all of the Old/New Testament
echo -e "# ${biblenametext}\n\n## Contents\n\n[[${testarrayfile[0]}|${testarraytext[0]}]]\n[[${testarrayfile[39]}|${testarraytext[39]}]]" >> "${parentfolder}/${biblenamefile}/${biblenamefile}.md"

# Initialize the Old/New Testament file for all of the genres
echo -e "# ${testarraytext[0]}\n\n## Contents\n\n[[${genrearrayfile[0]}|${genrearraytext[0]}]]\n[[${genrearrayfile[5]}|${genrearraytext[5]}]]\n[[${genrearrayfile[17]}|${genrearraytext[17]}]]\n[[${genrearrayfile[19]}|${genrearraytext[19]}]]\n[[${genrearrayfile[22]}|${genrearraytext[22]}]]\n[[${genrearrayfile[27]}|${genrearraytext[27]}]]" >> "${parentfolder}/${biblenamefile}/${testarrayfile[0]}.md"
echo -e "# ${testarraytext[39]}\n\n## Contents\n\n[[${genrearrayfile[39]}|${genrearraytext[39]}]]\n[[${genrearrayfile[43]}|${genrearraytext[43]}]]\n[[${genrearrayfile[44]}|${genrearraytext[44]}]]\n[[${genrearrayfile[57]}|${genrearraytext[57]}]]\n[[${genrearrayfile[65]}+${genrearraytext[65]}]]" >> "${parentfolder}/${biblenamefile}/${testarrayfile[39]}.md"

# Initialize the genre file for all of the Bible
echo -e "# ${genrearraytext[0]}\n\n## Contents\n" >> "${parentfolder}/${biblenamefile}/${genrearrayfile[0]}.md"
echo -e "# ${genrearraytext[5]}\n\n## Contents\n" >> "${parentfolder}/${biblenamefile}/${genrearrayfile[5]}.md"
echo -e "# ${genrearraytext[17]}\n\n## Contents\n" >> "${parentfolder}/${biblenamefile}/${genrearrayfile[17]}.md"
echo -e "# ${genrearraytext[19]}\n\n## Contents\n" >> "${parentfolder}/${biblenamefile}/${genrearrayfile[19]}.md"
echo -e "# ${genrearraytext[22]}\n\n## Contents\n" >> "${parentfolder}/${biblenamefile}/${genrearrayfile[22]}.md"
echo -e "# ${genrearraytext[27]}\n\n## Contents\n" >> "${parentfolder}/${biblenamefile}/${genrearrayfile[27]}.md"
echo -e "# ${genrearraytext[39]}\n\n## Contents\n" >> "${parentfolder}/${biblenamefile}/${genrearrayfile[39]}.md"
echo -e "# ${genrearraytext[43]}\n\n## Contents\n" >> "${parentfolder}/${biblenamefile}/${genrearrayfile[43]}.md"
echo -e "# ${genrearraytext[44]}\n\n## Contents\n" >> "${parentfolder}/${biblenamefile}/${genrearrayfile[44]}.md"
echo -e "# ${genrearraytext[57]}\n\n## Contents\n" >> "${parentfolder}/${biblenamefile}/${genrearrayfile[57]}.md"
echo -e "# ${genrearraytext[65]}\n\n## Contents\n" >> "${parentfolder}/${biblenamefile}/${genrearrayfile[65]}.md"

# Book chapter list
lengtharray=(50 40 27 36 34 24 21 4 31 24 22 25 29 36 10 13 10 42 150 31 12 8 66 52 5 48 12 14 3 9 1 4 7 3 3 3 2 14 4 28 16 24 21 28 16 16 13 6 6 4 4 5 3 6 4 3 1 13 5 5 3 5 1 1 1 22)

echo "Starting download of the ${translation} Bible."

  # Cycling through the book counter, setting which book and its maxchapter
  for ((book_counter=0; book_counter <= book_counter_max; book_counter++))
  do

    echo ""   # Make a new line which the '-n' flag to the echo command prevents.

    booktext=${bookarraytext[$book_counter]}
    bookfile=${bookarrayfile[$book_counter]}
    maxchapter=${lengtharray[$book_counter]}
    abbtext=${abbarraytext[$book_counter]}
    abbfile=${abbarrayfile[$book_counter]}

    echo -n "${booktext} "

    # Create an overview file for each book of the Bible:
    echo -e "# ${booktext}\n\n## Contents\n" >> "${parentfolder}/${biblenamefile}/$bookfile.md"

    # Create an overview file for each book of the Bible:
    echo -e "[[${bookarrayfile}|${bookarraytext}]]" >> "${parentfolder}/${biblenamefile}/${genrearrayfile}.md"

    for ((chapter=1; chapter <= maxchapter; chapter++))
    do

        echo -n "."

    ((prevchapter=chapter-1)) # Counting the previous and next chapter for navigation
    ((nextchapter=chapter+1))

# Exporting
exportprefix="${abbfile}-" # Setting the first half of the filename
filename=${exportprefix}$chapter # Setting the filename


  prevfile=${exportprefix}$prevchapter # Naming previous and next files
  nextfile=${exportprefix}$nextchapter

  if [[ $chapter -gt 1 ]]; then
      echo -e "[[${abbfile}-$chapter|]]" >> "${parentfolder}/${biblenamefile}/$bookfile.md"
    else
      echo -e "[[${abbfile}-$chapter|Start reading]]" >> "${parentfolder}/${biblenamefile}/$bookfile.md"
  fi

  audiobible="![[${abbfile}-$chapter.mp3]]"
  contents="## Contents\n\n[[${abbfile}-$chapter-notes|Chapter notes]]"

  # Formatting Navigation and omitting links that aren't necessary
  if [[ $maxchapter = 1 ]]; then
    # For a book that only has one chapter
    navigation="$contents"
  elif [[ $chapter = $maxchapter ]]; then
    # If this is the last chapter of the book
    navigation="$contents\n\n## Related\n\n[[${prevfile}|Previous chapter]]"
  elif [[ ${chapter} = 1 ]] ; then
    # If this is the first chapter of the book
    navigation="$contents\n\n## Related\n\n[[${nextfile}|Next chapter]]"
  else
    # Navigation for everything else
    navigation="$contents\n\n## Related\n\n[[${prevfile}|Previous chapter]]\n[[${nextfile}|Next chapter]]"
  fi

    text=$(ruby bg2md.rb -e -c -f -l -r -v "${translation}" "${abbtext} ${chapter}") # This calls the 'bg2md_mod' script


  text=$(echo "$text" | sed 's/^(.*?)v1/v1/') # Deleting unwanted headers

  # Formatting the title for markdown
  title="# ${abbtext} ${chapter}"

  # Navigation format
  export="# ${abbtext} $chapter\n\n$audiobible\n$text\n\n$navigation"

  # Export
  echo -e "$export" >> "./${parentfolder}/${biblenamefile}/${filename}.md"
  echo -e "$export" >> "./${parentfolder}/${biblenamefile}/${filename}-notes.md"

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

# Create editorial headers
find . -type f -name "*[0-9].md" -exec sed -i '5 s/[A-Za-z0-9].*/\n## &/' {} + # Make first header if it exists
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

# Delete Psalm book headings
find . -type f -name "*.md" -exec sed -i 's/## Book One/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/## Book Two/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/## Book Three/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/## Book Four/## /' {} +

# Fix some superscripts back to verses

find . -type f -name "*.md" -exec sed -i 's/ <sup class=\"versenum mid-line\">/\n\n###### /' {} +
find . -type f -name "*.md" -exec sed -i 's/<\/sup>/\n\n/' {} +
find . -type f -name "*.md" -exec sed -i 's/<sup class=\"versenum mid-line\">/\n\n###### /' {} +
find . -type f -name "*.md" -exec sed -i 's/<\/sup>/\n\n/' {} +

# Correct newline spacing
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n\n/;ba;}' {} +

# Make table of contents' empty links be on the same line as the "Start reading" link
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/Start reading]]\n/Start reading]]/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/|]]\n/|]]/;ba;}' {} +

# Make first header if it exists
find . -type f -name "*notes.md" -exec sed -i '5 s/[A-Za-z0-9].*/\n## &/' {} +

# Make note files empty
find . -type f -name "*notes.md" -exec sed -i 's/^[^#![].*//g' {} +
find . -type f -name "*notes.md" -exec sed -i 's/###### [0-9]*//g' {} +

# Remove audiobible
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
