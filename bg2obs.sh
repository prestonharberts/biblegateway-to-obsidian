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
    curr_file="${standard_short_title}${filename_separator}${chapter}${filename_separator}${standard_translation}"         # Setting the current file
    curr_file_notes="${standard_short_title}${filename_separator}${chapter}${filename_separator}${notes}"                  # Setting the current file
    previous_file="${standard_short_title}${filename_separator}${prevchapter}${filename_separator}${standard_translation}" # Naming previous and next files
    next_file="${standard_short_title}${filename_separator}${nextchapter}${filename_separator}${standard_translation}"

    audio_bible="![[${curr_file}.mp3]]"
    contents="## Contents\n\n[[${curr_file_notes}|Chapter notes]]"

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
      yaml="---\naliases: ${short_title} ${chapter}, ${short_title} ${chapter} (${translation}), ${abbreviation} ${chapter}, ${abbreviation} ${chapter} (${translation}), ${standard_abbreviation}${filename_separator}${chapter}, ${standard_abbreviation}${filename_separator}${chapter}${filename_separator}${translation}\n---"
      echo -e "${yaml}\n# ${short_title} ${chapter}\n\n${audio_bible}\n${text}\n\n${navigation}" >>"${reading_dir}/${curr_file}.md"
    else
      echo -e "# ${short_title} ${chapter}\n\n${audio_bible}\n${text}\n\n${navigation}" >>"${reading_dir}/${curr_file}.md"
    fi

    # Export
    echo -e "# ${short_title} ${chapter}\n\n${audio_bible}\n${text}\n\n${navigation}" >>"${reading_dir}/${curr_file_notes}.md"
  done # End of the book exporting loop
done

source cleanup

if [[ $verbose == "true" ]]; then
  printf "\nMarkdown files ready for Obsidian.\n"
fi
