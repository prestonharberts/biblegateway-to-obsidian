#!/bin/bash
# shellcheck disable=1091,2086,2154,2162
source config.sh

# find book index
for ((book = 0; book < book_max; book++)); do
  source bin/get-info.sh
  if [[ "${short_title}" == "${1}" ]]; then
    break
  fi
done
# opening prompt
echo "Enter verse numbers to add pilcrow sign to. Enter 'n' to go to next chapter."
echo "Every first verse of every chapter already has one, so do not add one to it!"
if [ $chapter_max -eq 1 ]; then
  echo "Now beginning: ${1} (${chapter_max} chapter)"
elif [ $chapter_max -gt 1 ]; then
  echo "Now beginning: ${1} (${chapter_max} chapters)"
fi
# make pilcrow-signs
if [[ -f "bin/pilcrow-signs.sh" ]]; then
  echo -e "# Book ${book}: ${short_title}" >>bin/pilcrow-signs.sh
else
  echo -e "#!/bin/bash" >>bin/pilcrow-signs.sh
  echo -e "# shellcheck disable=SC1091,2154" >>bin/pilcrow-signs.sh
  echo -e "source config.sh" >>bin/pilcrow-signs.sh
  echo -e "if [[ \"\${main_translation}\" == \"true\" ]]; then" >>bin/pilcrow-signs.sh
  echo -e "  if_not_main=\"\"" >>bin/pilcrow-signs.sh
  echo -e "elif [[ \"\${main_translation}\" == \"false\" ]]; then" >>bin/pilcrow-signs.sh
  echo -e "  if_not_main=\"\${standard_translation}\"" >>bin/pilcrow-signs.sh
  echo -e "fi" >>bin/pilcrow-signs.sh
  echo -e "sed -i \"s/###### 1$/###### ¶ 1/g\" \"\${reading_dir}/\"*.md" >>bin/pilcrow-signs.sh
  ((book++))
  echo -e "# Book ${book}: ${short_title}" >>bin/pilcrow-signs.sh
  ((book--))
  chmod u+x pilcrow-signs
fi
# read verse num to add pilcrow sign to and add sed line to script
chapter=1
while ((chapter <= chapter_max)); do
  if [ $chapter_max -gt 1 ]; then
    printf '\n%s %s\n' "$short_title" "$chapter"
  elif [ $chapter_max -eq 1 ]; then
    printf '\n%s\n' "$short_title"
  fi
  read -p ">>> " verse
  while ((verse != "n")); do
    echo -e "sed -i \"s/###### ${verse}$/###### ¶ ${verse}/g\" \"\${reading_dir}/${standard_abbreviation}${chapter}\${if_not_main}.md\"" >>bin/pilcrow-signs.sh
    read -p ">>> " verse
  done
  if [[ "${verse}" == "n" ]]; then
    ((chapter++))
  fi
done
# closing prompt
echo
if [ $chapter_max -eq 1 ]; then
  echo "Finished: ${1} (${chapter_max} chapter)"
elif [ $chapter_max -gt 1 ]; then
  echo "Finished: ${1} (${chapter_max} chapters)"
fi
