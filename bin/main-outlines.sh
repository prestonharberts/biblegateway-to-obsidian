#!/bin/bash
# shellcheck disable=1091,2154
source config.sh

yaml="---\naliases: [\"${bible_name}\"]\n---"
# initialize the bible file for all of the old/new testament
if [[ "${yaml_enabled}" == "true" ]]; then
  echo -e "${yaml}\n# ${bible_name}\n\n## Contents\n\n[[${standard_testament_arr[0]}|${testament_arr[0]}]]\n[[${standard_testament_arr[39]}|${testament_arr[39]}]]" >>"${outlines_dir}/${standard_bible_name}.md"
elif [[ "${yaml_enabled}" == "false" ]]; then
  echo -e "# ${bible_name}\n\n## Contents\n\n[[${standard_testament_arr[0]}|${testament_arr[0]}]]\n[[${standard_testament_arr[39]}|${testament_arr[39]}]]" >>"${outlines_dir}/${standard_bible_name}.md"
fi
# initialize the old/new testament file for all of the genres
echo -e "---\naliases: [\"${testament_arr[0]}\", \"${testament_abbreviation_arr[0]}\"]\n---\n# ${testament_arr[0]}\n\n## Contents\n\n[[${standard_genre_arr[0]}|${genre_arr[0]}]]\n[[${standard_genre_arr[5]}|${genre_arr[5]}]]\n[[${standard_genre_arr[17]}|${genre_arr[17]}]]\n[[${standard_genre_arr[19]}|${genre_arr[19]}]]\n[[${standard_genre_arr[22]}|${genre_arr[22]}]]\n[[${standard_genre_arr[27]}|${genre_arr[27]}]]" >>"${outlines_dir}/${standard_testament_arr[0]}.md"
echo -e "---\naliases: [\"${testament_arr[39]}\", \"${testament_abbreviation_arr[39]}\"]\n---\n# ${testament_arr[39]}\n\n## Contents\n\n[[${standard_genre_arr[39]}|${genre_arr[39]}]]\n[[${standard_genre_arr[43]}|${genre_arr[43]}]]\n[[${standard_genre_arr[44]}|${genre_arr[44]}]]\n[[${standard_genre_arr[57]}|${genre_arr[57]}]]\n[[${standard_genre_arr[65]}|${genre_arr[65]}]]" >>"${outlines_dir}/${standard_testament_arr[39]}.md"
# initialize the genre file for all of the bible
if [[ "${yaml_enabled}" == "true" ]]; then
  echo -e "---\naliases: [\"${genre_arr[0]}\"]\n---\n# ${genre_arr[0]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[0]}.md"
  echo -e "---\naliases: [\"${genre_arr[5]}\", \"${standard_genre_alias_arr[5]}\"]\n---\n# ${genre_arr[5]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[5]}.md"
  echo -e "---\naliases: [\"${genre_arr[17]}\", \"${standard_genre_alias_arr[17]}\"]\n---\n# ${genre_arr[17]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[17]}.md"
  echo -e "---\naliases: [\"${genre_arr[19]}\"]\n---\n# ${genre_arr[19]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[19]}.md"
  echo -e "---\naliases: [\"${genre_arr[22]}\", \"${standard_genre_alias_arr[22]}\"]\n---\n# ${genre_arr[22]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[22]}.md"
  echo -e "---\naliases: [\"${genre_arr[27]}\", \"${standard_genre_alias_arr[27]}\"]\n---\n# ${genre_arr[27]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[27]}.md"
  echo -e "---\naliases: [\"${genre_arr[39]}\", \"${standard_genre_alias_arr[39]}\"]\n---\n# ${genre_arr[39]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[39]}.md"
  echo -e "---\naliases: [\"${genre_arr[43]}\", \"${standard_genre_alias_arr[43]}\"]\n---\n# ${genre_arr[43]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[43]}.md"
  echo -e "---\naliases: [\"${genre_arr[44]}\"]\n---\n# ${genre_arr[44]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[44]}.md"
  echo -e "---\naliases: [\"${genre_arr[57]}\", \"${standard_genre_alias_arr[57]}\"]\n---\n# ${genre_arr[57]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[57]}.md"
  echo -e "---\naliases: [\"${genre_arr[65]}\", \"${standard_genre_alias_arr[65]}\"]\n---\n# ${genre_arr[65]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[65]}.md"
elif [[ "${yaml_enabled}" == "false" ]]; then
  echo -e "###### [[${standard_testament_arr[0]}|${testament_arr[0]}]]\n# ${genre_arr[0]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[0]}.md"
  echo -e "###### [[${standard_testament_arr[5]}|${testament_arr[5]}]]\n# ${genre_arr[5]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[5]}.md"
  echo -e "###### [[${standard_testament_arr[17]}|${testament_arr[17]}]]\n# ${genre_arr[17]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[17]}.md"
  echo -e "###### [[${standard_testament_arr[19]}|${testament_arr[19]}]]\n# ${genre_arr[19]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[19]}.md"
  echo -e "###### [[${standard_testament_arr[22]}|${testament_arr[22]}]]\n# ${genre_arr[22]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[22]}.md"
  echo -e "###### [[${standard_testament_arr[27]}|${testament_arr[27]}]]\n# ${genre_arr[27]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[27]}.md"
  echo -e "###### [[${standard_testament_arr[39]}|${testament_arr[39]}]]\n# ${genre_arr[39]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[39]}.md"
  echo -e "###### [[${standard_testament_arr[43]}|${testament_arr[43]}]]\n# ${genre_arr[43]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[43]}.md"
  echo -e "###### [[${standard_testament_arr[44]}|${testament_arr[44]}]]\n# ${genre_arr[44]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[44]}.md"
  echo -e "###### [[${standard_testament_arr[57]}|${testament_arr[57]}]]\n# ${genre_arr[57]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[57]}.md"
  echo -e "###### [[${standard_testament_arr[65]}|${testament_arr[65]}]]\n# ${genre_arr[65]}\n\n## Contents\n" >>"${outlines_dir}/${standard_genre_arr[65]}.md"
fi
for ((book = 0; book < book_max; book++)); do
  source bin/get-info.sh
  if [[ "${short_title}" == "${abbreviation}" ]]; then
    yaml="---\naliases: [\"${long_title}\", \"${short_title}\"]\n---"
  else
    yaml="---\naliases: [\"${long_title}\", \"${short_title}\", \"${abbreviation}\"]\n---"
  fi
  if [[ "${yaml_enabled}" == "true" ]]; then
    echo -e "${yaml}" >>"${outlines_dir}/${standard_abbreviation}.md"
  fi
  echo -e "# ${long_title}\n\n## Contents\n" >>"${outlines_dir}/${standard_abbreviation}.md"
  # create an overview file for each book of the Bible:
  echo -e "[[${standard_abbreviation}|${long_title}]]" >>"${outlines_dir}/${standard_genre}.md"
  for ((chapter = 1; chapter <= chapter_max; chapter++)); do
    if [ $chapter -gt 1 ]; then
      echo -en "[[${standard_abbreviation}${chapter}|]]" >>"${outlines_dir}/${standard_abbreviation}.md"
    elif [ $chapter -eq 0 ]; then
      echo -en "[[${standard_abbreviation}${chapter}|Start reading (${translation})]]" >>"${outlines_dir}/${standard_abbreviation}.md"
    fi
  done
done
