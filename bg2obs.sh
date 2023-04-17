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
declare -a bookarray # Declaring the Books of the Bible as a list
declare -a abbarray # Delaring the abbreviations for each book. You can adapt if you'd like
declare -a lengtharray # Declaring amount of chapters in each book

# -------------------------------------------
# TRANSLATION: Lists of Names
# -------------------------------------------
# For Translation, translate these three lists. Seperated by space and wrapped in quotes if they include whitespace.
# Name of "The Bible" in your language
biblename="The Bible"
# Full names of the books of the Bible
bookarray=(Genesis Exodus Leviticus Numbers Deuteronomy Joshua Judges Ruth "1 Samuel" "2 Samuel" "1 Kings" "2 Kings" "1 Chronicles" "2 Chronicles" Ezra Nehemiah Esther Job Psalms Proverbs Ecclesiastes "Song of Solomon" Isaiah Jeremiah Lamentations Ezekiel Daniel Hosea Joel Amos Obadiah Jonah Micah Nahum Habakkuk Zephaniah Haggai Zechariah Malachi Matthew Mark Luke John Acts
Romans "1 Corinthians" "2 Corinthians" Galatians Ephesians Philippians Colossians "1 Thessalonians" "2 Thessalonians" "1 Timothy" "2 Timothy" Titus Philemon Hebrews James "1 Peter" "2 Peter" "1 John" "2 John" "3 John" Jude Revelation)
# Short names of the books of the Bible
abbarray=(Gen Exod Lev Num Deut Josh Judg Ruth "1 Sam" "2 Sam" "1 Kings" "2 Kings" "1 Chron" "2 Chron" Ezr Neh Esth Job Ps Prov Eccles Song Isa Jer Lam Ezek Dan Hos Joel Am Obad Jonah Micah Nah Hab Zeph Hag Zech Mal Matt Mark Luke John Acts Rom "1 Cor" "2 Cor" Gal Ephes Phil Col "1 Thess" "2 Thess" "1 Tim" "2 Tim" Titus Philem Heb James "1 Pet" "2 Pet" "1 John" "2 John" "3 John" Jude Rev)
# -------------------------------------------

# Book chapter list
lengtharray=(50 40 27 36 34 24 21 4 31 24 22 25 29 36 10 13 10 42 150 31 12 8 66 52 5 48 12 14 3 9 1 4 7 3 3 3 2 14 4 28 16 24 21 28 16 16 13 6 6 4 4 5 3 6 4 3 1 13 5 5 3 5 1 1 1 22)

# Initialise the "The Bible" file for all of the books
echo -e "# ${biblename}\n" >> "${biblename}.md"

echo "Starting download of ${translation} Bible."

  # Cycling through the book counter, setting which book and its maxchapter
  for ((book_counter=0; book_counter <= book_counter_max; book_counter++))
  do

    echo ""   # Make a new line which the '-n' flag to the echo command prevents.

    book=${bookarray[$book_counter]}
    maxchapter=${lengtharray[$book_counter]}
    abbreviation=${abbarray[$book_counter]}

    echo -n "${book} "

    for ((chapter=1; chapter <= maxchapter; chapter++))
    do

        echo -n "."

((prev_chapter=chapter-1)) # Counting the previous and next chapter for navigation
((next_chapter=chapter+1))

# Exporting
export_prefix="${abbreviation} " # Setting the first half of the filename
filename=${export_prefix}$chapter # Setting the filename


  prev_file=${export_prefix}$prev_chapter # Naming previous and next files
  next_file=${export_prefix}$next_chapter


  # Formatting Navigation and omitting links that aren't necessary
  if [[ $maxchapter = 1 ]]; then
    # For a book that only has one chapter
    navigation="[[${book}]]"
  elif [[ $chapter = $maxchapter ]]; then
    # If this is the last chapter of the book
    navigation="[[${prev_file}|← ${book} ${prev_chapter}]] | [[${book}]]"
  elif [[ ${chapter} = 1 ]] ; then
    # If this is the first chapter of the book
    navigation="[[${book}]] | [[${next_file}|${book} ${next_chapter} →]]"
  else
    # Navigation for everything else
    navigation="[[${prev_file}|← ${book} ${prev_chapter}]] | [[${book}]] | [[${next_file}|${book} ${next_chapter} →]]"
  fi

    text=$(ruby bg2md.rb -e -c -f -l -r -v "${translation}" "${book} ${chapter}") # This calls the 'bg2md_mod' script


  text=$(echo "$text" | sed 's/^(.*?)v1/v1/') # Deleting unwanted headers

  # Formatting the title for markdown
  title="# ${book} ${chapter}"

  # Navigation format
  export="${title}\n\n$navigation\n***\n\n$text\n\n***\n$navigation"

  # Export
  echo -e "$export" >> "$filename.md"

  # Creating a folder

  folder_name="${book}" # Setting the folder name

  # Creating a folder for the book of the Bible if it doesn't exist, otherwise moving new file into existing folder
  mkdir -p "./${biblename} (${translation})/${folder_name}"; mv "${filename}".md "./${biblename} (${translation})/${folder_name}"


done # End of the book exporting loop

  # Create an overview file for each book of the Bible:
  overview_file="links: [[${biblename}]]\n# ${book}\n\n[Start Reading →]([[${abbreviation} 1]])"
  echo -e $overview_file >> "$book.md"
  mv "$book.md" "./${biblename} (${translation})/${folder_name}"

  # Append the bookname to "The Bible" file
  echo -e "* [[${book}]]" >> "${biblename}.md"
  done

# Tidy up the Markdown files by removing unneeded headers and separating the verses
# with some blank space and an H6-level verse number.
#
# Using a perl one-liner here in order to help ensure that this works across platforms
# since the sed utility works differently on macOS and Linux variants. The perl should
# work consistently.

if [[ $verbose = "true" ]] ; then
	echo ""
	echo "Cleaning up the Markdown files."
fi
# Clear unnecessary headers
find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/#.*(#####\D[1]\D)/#$1/g'

# Format verses into H6 headers
find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/######\s([0-9]\s|[0-9][0-9]\s|[0-9][0-9][0-9]\s)/\n\n###### $1\n/g'

# Delete crossreferences
find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/\<crossref intro.*crossref\>//g'

if [[ $verbose = "true" ]]; then
echo "Download complete. Markdown files ready for Obsidian import."
fi
