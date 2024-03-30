#!/bin/bash
# shellcheck disable=1091,2086,2154
source config.sh

if [[ "${verbose}" == "true" ]]; then
  printf 'Downloading the %s Bible.' "${translation}"
fi

# cycling through the book counter, setting which book and its max chapter
((book = 0))
for ((book = 0; book < book_max; book++)); do
  source bin/get-info.sh

  if [[ "${verbose}" == "true" && "${short_title}" != "Psalm" ]]; then
    printf '\n%s' "${short_title}"
  elif [[ "${verbose}" == "true" ]]; then
    printf '\n%s' "Psalms"
  fi

  if [ $book != 0 ]; then
    ((previous_book_num = book - 1))
  fi
  ((next_book_num = book + 1))

  previous_book="${standard_abbreviation_arr[previous_book_num]}"
  next_book="${standard_abbreviation_arr[next_book_num]}"

  for ((chapter = 1; chapter <= chapter_max; chapter++)); do
    if [[ "${verbose}" == "true" ]]; then
      echo -n "."
    fi

    ((previous_chapter = chapter - 1)) # counting the previous and next chapter for navigation
    ((next_chapter = chapter + 1))

    # exporting
    curr_file="${standard_abbreviation}${chapter}"               # setting the current file
    curr_file_notes="${standard_abbreviation}${chapter}${notes}" # setting the current file
    previous_file="${standard_abbreviation}${previous_chapter}"  # naming previous and next files
    next_file="${standard_abbreviation}${next_chapter}"
    previous_file_notes="${standard_abbreviation}${previous_chapter}${notes}" # naming previous and next files
    next_file_notes="${standard_abbreviation}${next_chapter}${notes}"

    # formatting Navigation and omitting links that aren't necessary
    if [ $chapter_max -eq 1 ]; then
      # for a book that only has one chapter
      navigation="##### ←←[[${previous_book}${length_arr[$previous_book_num]}|Prev]] / [[${curr_file_notes}|Notes]] / [[${standard_abbreviation}${chapter}${audio}|Audio]] / [[${next_book}1|Next]]→→"
      navigation_notes="##### ←←[[${previous_book}${length_arr[$previous_book_num]}${notes}|Prev]] / [[${curr_file}|Read]] / [[${standard_abbreviation}${chapter}${audio}|Audio]] / [[${next_book}1${notes}|Next]]→→"
    elif [ $chapter -eq $chapter_max ] && [ $book -eq $((book_max - 1)) ]; then
      # if this is the last chapter of the book
      navigation="##### ←[[${previous_file}|Prev]] / [[${curr_file_notes}|Notes]] / [[${standard_abbreviation}${chapter}${audio}|Audio]]"
      navigation_notes="##### ←[[${previous_file_notes}|Prev]] / [[${curr_file}|Read]] / [[${standard_abbreviation}${chapter}${audio}|Audio]]"
    elif [ $chapter -eq $chapter_max ] && [ $book -ne $((book_max - 1)) ]; then
      # if this is the last chapter of the book
      navigation="##### ←[[${previous_file}|Prev]] / [[${curr_file_notes}|Notes]] / [[${standard_abbreviation}${chapter}${audio}|Audio]] / [[${next_book}1|Next]]→→"
      navigation_notes="##### ←[[${previous_file_notes}|Prev]] / [[${curr_file}|Read]] / [[${standard_abbreviation}${chapter}${audio}|Audio]] / [[${next_book}1${notes}|Next]]→→"
    elif [ ${chapter} -eq 1 ] && [ $book -eq 0 ]; then
      # if this is the first chapter of the book
      navigation="##### [[${curr_file_notes}|Notes]] / [[${standard_abbreviation}${chapter}${audio}|Audio]] / [[${next_file}|Next]]→"
      navigation_notes="##### [[${curr_file}|Read]] / [[${standard_abbreviation}${chapter}${audio}|Audio]] / [[${next_file_notes}|Next]]→"
    elif [ ${chapter} -eq 1 ] && [ $book -ne 0 ]; then
      # if this is the first chapter of the book
      navigation="##### ←←[[${previous_book}${length_arr[$previous_book_num]}|Prev]] / [[${curr_file_notes}|Notes]] / [[${standard_abbreviation}${chapter}${audio}|Audio]] / [[${next_file}|Next]]→"
      navigation_notes="##### ←←[[${previous_book}${length_arr[$previous_book_num]}${notes}|Prev]] / [[${curr_file}|Read]] / [[${standard_abbreviation}${chapter}${audio}|Audio]] / [[${next_file_notes}|Next]]→"
    else
      # navigation for everything else
      navigation="##### ←[[${previous_file}|Prev]] / [[${curr_file_notes}|Notes]] / [[${standard_abbreviation}${chapter}${audio}|Audio]] / [[${next_file}|Next]]→"
      navigation_notes="##### ←[[${previous_file_notes}|Prev]] / [[${curr_file}|Read]] / [[${standard_abbreviation}${chapter}${audio}|Audio]] / [[${next_file_notes}|Next]]→"
    fi

    short_title_no_spaces=$(echo "${short_title}" | sed 's/ //g')
    text=$(ruby bg2md.rb -e -c -f -l -r -v "${translation}" "${short_title_no_spaces}${chapter}") # this calls the 'bg2md' script
    text="${text/^(.*?)v1/v1/}"                                                                   # deleting unwanted headers

    if [[ "${short_title}" == "${abbreviation}" ]]; then
      yaml="---\naliases: [\"${short_title} ${chapter}\"]\n---"
      yaml_notes="---\naliases: [\"${short_title} ${chapter} ${notes}\"]\n---"
    else
      yaml="---\naliases: [\"${short_title} ${chapter}\", \"${abbreviation} ${chapter}\"]\n---"
      yaml_notes="---\naliases: [\"${short_title} ${chapter} ${notes}\", \"${abbreviation} ${chapter} ${notes}\"]\n---"
    fi

    if [[ "${yaml_enabled}" == "true" ]] && [[ "${enable_audio_bible}" == "true" ]]; then
      echo -en "${yaml}\n# ${short_title} ${chapter} ${translation}\n${navigation}${text}\n${navigation}" >>"${reading_dir}/${curr_file}.md"
      echo -en "${yaml_notes}\n# ${short_title} ${chapter} notes\n${navigation_notes}${text}" >>"${reading_dir}/${curr_file_notes}.md"
    elif [[ "${yaml_enabled}" == "true" ]] && [[ "${enable_audio_bible}" == "false" ]]; then
      echo -en "${yaml}\n# ${short_title} ${chapter} ${translation}\n${navigation}${text}\n${navigation}" >>"${reading_dir}/${curr_file}.md"
      echo -en "${yaml_notes}\n# ${short_title} ${chapter} notes\n${navigation_notes}${text}" >>"${reading_dir}/${curr_file_notes}.md"
    elif [[ "${yaml_enabled}" == "false" ]] && [[ "${enable_audio_bible}" == "true" ]]; then
      echo -en "# ${short_title} ${chapter} ${translation}\n${navigation_notes}${text}\n\n${navigation}" >>"${reading_dir}/${curr_file}.md"
      echo -en "# ${short_title} ${chapter} notes\n${navigation_notes}${text}" >>"${reading_dir}/${curr_file_notes}.md"
    else
      echo -en "# ${short_title} ${chapter} ${translation}\n${navigation_notes}${text}\n${navigation}" >>"${reading_dir}/${curr_file}.md"
      echo -en "# ${short_title} ${chapter} notes\n${navigation_notes}${text}" >>"${reading_dir}/${curr_file_notes}.md"
    fi
  done
done
