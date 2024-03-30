#!/bin/bash
source config.sh

for ((book = 0; book < book_max; book++)); do
    source bin/get-info.sh
    for ((chapter = 1; chapter <= chapter_max; chapter++)); do
        if [[ $chapter -gt 1 ]]; then
            echo -en "[[${standard_abbreviation}${chapter}${standard_translation}|]]" >>"${outlines_dir}/${standard_abbreviation}.md"
        else
            echo -en " [[${standard_abbreviation}${chapter}${standard_translation}|(${translation})]]" >>"${outlines_dir}/${standard_abbreviation}.md"
        fi
    done
done
