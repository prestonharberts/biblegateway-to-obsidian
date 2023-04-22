#!/bin/bash

source config
source src/variables

# Create kebab-cased variables
standard_translation=$(echo "${translation}" | sed 's/ /-/g; s/.*/\L&/g')
standard_bible_name=$(echo "${bible_name}" | sed 's/ /-/g; s/.*/\L&/g')
for ((book = 0; book < book_max; book++)); do
  standard_long_title_array[book]=$(echo "${long_title_array[$book]}" | sed 's/ /-/g; s/.*/\L&/g')
  standard_short_title_array[book]=$(echo "${short_title_array[$book]}" | sed 's/ /-/g; s/.*/\L&/g')
  standard_abbreviation_array[book]=$(echo "${abbreviation_array[$book]}" | sed 's/ //g; s/.*/\L&/g; s/\.//g')
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
