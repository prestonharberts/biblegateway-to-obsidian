#!/bin/bash

source config.sh

# Initialize audio Bible file
if [[ $enable_audio_bible == "true" ]]; then
    for ((book = 0; book < book_max; book++)); do
        source get-info.sh

        if [[ $book != 0 ]]; then
            ((previous_book_num = book - 1))
        fi
        ((next_book_num = book + 1))

        previous_book="${standard_abbreviation_arr[previous_book_num]}"
        next_book="${standard_abbreviation_arr[next_book_num]}"

        for ((chapter = 1; chapter <= chapter_max; chapter++)); do
            yaml="---\naliases: [\"${short_title} ${chapter} ${audio}\", \"${abbreviation}. ${chapter} ${audio}\"]\n---"

            ((previous_chapter = chapter - 1)) # Counting the previous and next chapter for navigation
            ((next_chapter = chapter + 1))

            # Exporting
            curr_file_notes="${standard_abbreviation}${chapter}${notes}"        # Setting the current file
            previous_file="${standard_abbreviation}${previous_chapter}${audio}" # Naming previous and next files
            next_file="${standard_abbreviation}${next_chapter}${audio}"

            # Formatting Navigation and omitting links that aren't necessary
            if [[ $chapter_max -eq 1 ]]; then
                # For a book that only has one chapter
                navigation="##### ←[[${previous_book}${length_arr[$previous_book_num]}${audio}|Previous]] / [[${curr_file_notes}|Notes]] / [[${next_book}1${audio}|Next]]→"
            elif [[ $chapter -eq $chapter_max ]] && [[ $book -eq $((book_max - 1)) ]]; then
                # If this is the last chapter of the book
                navigation="##### ←[[${previous_file}|Previous]] / [[${curr_file_notes}|Notes]]"
            elif [[ $chapter -eq $chapter_max ]] && [[ $book -ne $((book_max - 1)) ]]; then
                # If this is the last chapter of the book
                navigation="##### ←[[${previous_file}|Previous]] / [[${curr_file_notes}|Notes]] / [[${next_book}1${audio}|Next]]→"
            elif [[ ${chapter} -eq 1 ]] && [[ $book -eq 0 ]]; then
                # If this is the first chapter of the book
                navigation="##### [[${curr_file_notes}|Notes]] / [[${next_file}|Next]]→"
            elif [[ ${chapter} -eq 1 ]] && [[ $book -ne 0 ]]; then
                # If this is the first chapter of the book
                navigation="##### ←[[${previous_book}${length_arr[$previous_book_num]}${audio}|Previous]] / [[${curr_file_notes}|Notes]] / [[${next_file}|Next]]→"
            else
                # Navigation for everything else
                navigation="##### ←[[${previous_file}|Previous]] / [[${curr_file_notes}|Notes]] / [[${next_file}|Next]]→"
            fi

            if [[ $primary_translation == "true" ]]; then
                echo -e "${yaml}\n${navigation}\n# ${short_title} ${chapter}" >>"${outline_dir}/${standard_abbreviation}${chapter}${audio}.md"
                title="##### [[${standard_abbreviation}${chapter}|${translation}]]:"
                audio_bible="![[${standard_abbreviation}${chapter}${standard_translation}.mp3]]" # Setting the current file
                echo -e "${title}\n${audio_bible}" >>"${outline_dir}/${standard_abbreviation}${chapter}${audio}.md"
            elif [[ $primary_translation == "false" ]]; then
                title="##### [[${standard_abbreviation}${chapter}${standard_translation}|${translation}]]:"
                audio_bible="![[${standard_abbreviation}${chapter}${standard_translation}.mp3]]" # Setting the current file
                echo -e "${title}\n${audio_bible}" >>"${outline_dir}/${standard_abbreviation}${chapter}${audio}.md"
            fi
        done
    done
fi