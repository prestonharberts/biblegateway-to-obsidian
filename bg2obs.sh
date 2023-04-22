#!/bin/bash

source config
source make-outlines

if [[ $verbose == "true" ]]; then
  printf 'Starting download of the %s Bible.' "${translation}"
fi

# Cycling through the book counter, setting which book and its max chapter
((book = 0))
for ((book = 0; book < book_max; book++)); do
  source fetch-info

  if [[ $verbose == "true" ]]; then
    printf '\n%s' "${short_title}"
  fi

  for ((chapter = 1; chapter <= chapter_max; chapter++)); do
    if [[ $verbose == "true" ]]; then
      echo -n "."
    fi

    ((prevchapter = chapter - 1)) # Counting the previous and next chapter for navigation
    ((nextchapter = chapter + 1))

    # Exporting
    curr_file="${standard_short_title}${filename_separator}${chapter}"         # Setting the current file
    previous_file="${standard_short_title}${filename_separator}${prevchapter}" # Naming previous and next files
    next_file="${standard_short_title}${filename_separator}${nextchapter}"

    audio_bible="![[${curr_file}.mp3]]"
    contents="## Contents\n\n[[${curr_file}${filename_separator}${notes}|Chapter notes]]"

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

    if [[ $yaml_enabled == "true" ]]; then
      yaml="---\naliases: ${short_title} ${chapter}, ${abbreviation} ${chapter}, ${standard_abbreviation}${filename_separator}${chapter}\n---"
    fi

    # Export
    echo -e "${yaml}\n# ${short_title} ${chapter}\n\n${audio_bible}\n${text}\n\n${navigation}" >>"${reading_dir}/${curr_file}.md"
    echo -e "# ${short_title} ${chapter}\n\n${audio_bible}\n${text}\n\n${navigation}" >>"${notes_dir}/${curr_file}-notes.md"
  done # End of the book exporting loop
done

source cleanup

if [[ $verbose == "true" ]]; then
  echo "Markdown files ready for Obsidian."
fi
