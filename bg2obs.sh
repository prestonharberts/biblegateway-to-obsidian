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
declare -a lengtharray # Declaring amount of chapters in each book

# -------------------------------------------
# TRANSLATION: Lists of Names
# -------------------------------------------
# For Translation, translate these three lists. Seperated by space and wrapped in quotes if they include whitespace.
# Name of "The Bible" in your language and make a folder for it if it does not exist
biblenametext="Bible"
biblenamefile="bible"
mkdir -p ${biblenamefile}
# Full names of the books of the Bible
bookarraytext=("Book of Genesis" "Book of Exodus" "Book of Leviticus" "Book of Numbers" "Book of Deuteronomy" "Book of Joshua" "Book of Judges" "Book of Ruth" "First Book of Samuel" "Second Book of Samuel" "First Book of Kings" "Second Book of Kings" "First Book of Chronicles" "Second Book of Chronicles" "Book of Ezra" "Book of Nehemiah" "Book of Esther" "Book of Job" "Book of Psalms" "Book of Proverbs" "Book of Ecclesiastes" "Song of Solomon" "Book of Isaiah" "Book of Jeremiah" "Book of Lamentations" "Book of Ezekiel" "Book of Daniel" "Book of Hosea" "Book of Joel" "Book of Amos" "Book of Obadiah" "Book of Jonah" "Book of Micah" "Book of Nahum" "Book of Habakkuk" "Book of Zephaniah" "Book of Haggai" "Book of Zechariah" "Book of Malachi" "Gospel of Matthew" "Gospel of Mark" "Gospel of Luke" "Gospel of John" "Acts of the Apostles" "Epistle to the Romans" "First Epistle to the Corinthians" "Second Epistle to the Corinthians" "Epistle to the Galatians" "Epistle to the Ephesians" "Epistle to the Philippians" "Epistle to the Colossians" "First Epistle to the Thessalonians" "Second Epistle to the Thessalonians" "First Epistle to Timothy" "Second Epistle to Timothy" "Epistle to Titus" "Epistle to Philemon" "Epistle to the Hebrews" "Epistle of James" "First Epistle of Peter" "Second Epistle of Peter" "First Epistle of John" "Second Epistle of John" "Third Epistle of John" "Epistle of Jude" "Book of Revelation")
bookarrayfile=(book-of-genesis book-of-exodus book-of-leviticus book-of-numbers book-of-deuteronomy book-of-joshua book-of-judges book-of-ruth first-book-of-samuel second-book-of-samuel first-book-of-kings second-book-of-kings first-book-of-chronicles second-book-of-chronicles book-of-ezra book-of-nehemiah book-of-esther book-of-job book-of-psalms book-of-proverbs book-of-ecclesiastes song-of-solomon book-of-isaiah book-of-jeremiah book-of-lamentations book-of-ezekiel book-of-daniel book-of-hosea book-of-joel book-of-amos book-of-obadiah book-of-jonah book-of-micah book-of-nahum book-of-habakkuk book-of-zephaniah book-of-haggai book-of-zechariah book-of-malachi gospel-of-matthew gospel-of-mark gospel-of-luke gospel-of-john acts-of-the-apostles epistle-to-the-romans first-epistle-to-the-corinthians second-epistle-to-the-corinthians epistle-to-the-galatians epistle-to-the-ephesians epistle-to-the-philippians epistle-to-the-colossians first-epistle-to-the-thessalonians second-epistle-to-the-thessalonians first-epistle-to-timothy second-epistle-to-timothy epistle-to-titus epistle-to-philemon epistle-to-the-hebrews epistle-of-james first-epistle-of-peter second-epistle-of-peter first-epistle-of-john second-epistle-of-john third-epistle-of-john epistle-of-jude book-of-revelation)
# Short names of the books of the Bible
abbarraytext=(Genesis Exodus Leviticus Numbers Deuteronomy Joshua Judges Ruth "1 Samuel" "2 Samuel" "1 Kings" "2 Kings" "1 Chronicles" "2 Chronicles" Ezra Nehemiah Esther Job Psalm Proverbs Ecclesiastes "Song of Solomon" Isaiah Jeremiah Lamentations Ezekiel Daniel Hosea Joel Amos Obadiah Jonah Micah Nahum Habakkuk Zephaniah Haggai Zechariah Malachi Matthew Mark Luke John Acts Romans "1 Corinthians" "2 Corinthians" Galatians Ephesians Philippians Colossians Thessalonians Thessalonians "1 Timothy" "2 Timothy" Titus Philemon Hebrews James "1 Peter" "2 Peter" "1 John" "2 John" "3 John" Jude Revelation)
abbarrayfile=(genesis exodus leviticus numbers deuteronomy joshua judges ruth 1-samuel 2-samuel 1-kings 2-kings 1-chronicles 2-chronicles ezra nehemiah esther job psalm proverbs ecclesiastes song-of-solomon isaiah jeremiah lamentations ezekiel daniel hosea joel amos obadiah jonah micah nahum habakkuk zephaniah haggai zechariah malachi matthew mark luke john acts romans 1-corinthians 2-corinthians galatians ephesians philippians colossians thessalonians thessalonians 1-timothy 2-timothy titus philemon hebrews james 1-peter 2-peter 1-john 2-john 3-john jude revelation)
# -------------------------------------------

# Book chapter list
lengtharray=(50 40 27 36 34 24 21 4 31 24 22 25 29 36 10 13 10 42 150 31 12 8 66 52 5 48 12 14 3 9 1 4 7 3 3 3 2 14 4 28 16 24 21 28 16 16 13 6 6 4 4 5 3 6 4 3 1 13 5 5 3 5 1 1 1 22)

# Initialise the Bible file for all of the books
echo -e "# ${biblenametext}\n" >> "${biblenamefile}.md"

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


  # TODO
  # Formatting Navigation and omitting links that aren't necessary
  if [[ $maxchapter = 1 ]]; then
    # For a book that only has one chapter
    navigation="[[${booktext}]]"
  elif [[ $chapter = $maxchapter ]]; then
    # If this is the last chapter of the book
    navigation="[[${prevfile}|← ${booktext} ${prevchapter}]] | [[${booktext}]]"
  elif [[ ${chapter} = 1 ]] ; then
    # If this is the first chapter of the book
    navigation="[[${booktext}]] | [[${nextfile}|${booktext} ${nextchapter} →]]"
  else
    # Navigation for everything else
    navigation="[[${prevfile}|← ${booktext} ${prevchapter}]] | [[${booktext}]] | [[${nextfile}|${booktext} ${nextchapter} →]]"
  fi

    text=$(ruby bg2md.rb -e -c -f -l -r -v "${translation}" "${booktext} ${chapter}") # This calls the 'bg2md_mod' script


  text=$(echo "$text" | sed 's/^(.*?)v1/v1/') # Deleting unwanted headers

  # Formatting the title for markdown
  title="# ${abbtext} ${chapter}"

  # Navigation format
  export="${title}\n\n$navigation\n***\n\n$text\n\n***\n$navigation"

  # Export
  echo -e "$export" >> "$filename.md"

  # Creating a folder

  foldername="${bookfile}" # Setting the folder name

  # Creating a folder for the book of the Bible if it doesn't exist, otherwise moving new file into existing folder
  mv "${filename}".md "./${biblenamefile}/"


done # End of the book exporting loop

  # Create an overview file for each book of the Bible:
  overview_file="links: [[${biblenametext}]]\n# ${booktext}\n\n[Start Reading →]([[${abb} 1]])"
  echo -e $overview_file >> "$bookfile.md"
  mv $bookfile.md ${biblenamefile}/${foldername}

  # Append the bookname to the Bible file
  echo -e "* [[${bookfile}|${booktext}]]" >> "${biblenamefile}.md"
  done

# Tidy up the Markdown files by removing unneeded headers and separating the verses
# with some blank space and an H6-level verse number.
#
# Using a perl one-liner here in order to help ensure that this works across platforms
# since the sed utility works differently on macOS and Linux variants. The perl should
# work consistently.

echo "Cleaning up the Markdown files."

# Clear unnecessary headers
find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/#.*(#####\D[1]\D)/#$1/g'

# Format verses into H6 headers
find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/######\s([0-9]\s|[0-9][0-9]\s|[0-9][0-9][0-9]\s)/\n\n###### $1\n/g'

# Delete crossreferences
find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/\<crossref intro.*crossref\>//g'

echo "Download complete. Markdown files ready for Obsidian import."
