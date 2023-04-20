#!/bin/bash

source config.sh

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
