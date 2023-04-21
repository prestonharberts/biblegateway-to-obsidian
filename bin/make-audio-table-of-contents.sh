#!/bin/bash

source config.sh

# Name of the audio Bible file
audio_bible_name="Audio Bible"

standard_audio_bible_name=$(echo "${audio_bible_name}" | sed 's/ /-/g; s/.*/\L&/g')

# Initialize variables
book_max=66 # Setting the max amount to 66, since there are 66 books we want to import

# Initialize audio Bible file
echo -e "## ${audio_bible_name}\n" >>"${contents_folder}/${standard_audio_bible_name}.md"

# Cycling through the book counter, setting which book and its max chapter
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

    # Navigation format
    export="${title}\n${audio_bible}"

    # Export
    echo -e "$export" >>"${contents_folder}/${standard_abbreviation}-audio.md"

  done # End of the book exporting loop

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
