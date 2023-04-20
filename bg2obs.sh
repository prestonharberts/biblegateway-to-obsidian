#!/bin/bash

source config.sh
source make-contents.sh

echo "Starting download of the ${translation} Bible."

# Cycling through the book counter, setting which book and its max chapter
for ((book = 0; book < 66; book++)); do

  echo "" # Make a new line which the '-n' flag to the echo command prevents.

  long_title="${long_title_array[$book]}"
  short_title="${short_title_array[$book]}"
  abbreviation="${abbreviation_array[$book]}"
  standard_long_title="${standard_long_title_array[$book]}"
  standard_short_title="${standard_short_title_array[$book]}"
  standard_abbreviation="${standard_abbreviation_array[$book]}"
  standard_genre="${standard_genre_array[$book]}"
  max_chapter=${length_array[$book]}

  echo -n "${short_title} "

  # Create an overview file for each book of the Bible:
  echo -e "# ${long_title}\n\n## Contents\n" >>"${contents_folder}/${standard_long_title}.md"

  # Create an overview file for each book of the Bible:
  echo -e "[[${standard_long_title}|${long_title}]]" >>"${contents_folder}/${standard_genre}.md"

  for ((chapter = 1; chapter <= max_chapter; chapter++)); do

    echo -n "."

    ((prevchapter = chapter - 1)) # Counting the previous and next chapter for navigation
    ((nextchapter = chapter + 1))

    # Exporting
    export_prefix="${standard_abbreviation}"
    filename="${export_prefix}${chapter}" # Setting the filename

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

    text=$(ruby bg2md.rb -e -c -f -l -r -v "${translation}" "${short_title} ${chapter}") # This calls the 'bg2mdmod' script

    text=$(echo "${text}" | sed 's/^(.*?)v1/v1/') # Deleting unwanted headers

    # Formatting the title for markdown
    heading="# ${short_title} ${chapter}"

    # Navigation format
    export="${heading}\n\n${audio_bible}\n${text}\n\n${navigation}"

    # Export
    echo -e "$export" >>"${reading_folder}/${filename}.md"
    echo -e "$export" >>"${notes_folder}/${filename}-notes.md"

  done # End of the book exporting loop

done

source clean-files.sh
