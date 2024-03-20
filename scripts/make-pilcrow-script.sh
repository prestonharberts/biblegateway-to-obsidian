#!/bin/bash

source config.sh

#find book index
for ((book = 0; book < book_max; book++)); do
    source get-info.sh
    if [[ $short_title == $1 ]]; then
        break
    fi
done

#opening prompt
echo "Enter verse numbers to add pilcrow sign to. Enter 'n' to go to next chapter."
echo "Every first verse of every chapter already has one, so do not add one to it!"
if [[ $chapter_max -eq 1 ]]; then
    echo "Now beginning: ${1} (${chapter_max} chapter)"
elif [[ $chapter_max -gt 1 ]]; then
    echo "Now beginning: ${1} (${chapter_max} chapters)"
fi

#make pilcrow-script.sh
if [[ -f "pilcrow-script.sh" ]]; then
    echo -e "# Book ${book}: ${short_title}" >>pilcrow-script.sh
else
    echo -e "#!/bin/bash" >>pilcrow-script.sh
    echo -e "source config.sh" >>pilcrow-script.sh
    echo -e "if [[ \$primary_translation == \"true\" ]]; then" >>pilcrow-script.sh
    echo -e "    if_secondary=\"\"" >>pilcrow-script.sh
    echo -e "else" >>pilcrow-script.sh
    echo -e "    if_secondary=\"\${standard_translation}\"" >>pilcrow-script.sh
    echo -e "fi" >>pilcrow-script.sh
    echo -e "sed -i \"s/###### 1$/###### ¶ 1/g\" \"\${reading_dir}/\"*.md" >>pilcrow-script.sh
    ((book++))
    echo -e "# Book ${book}: ${short_title}" >>pilcrow-script.sh
    ((book--))
    chmod u+x pilcrow-script.sh
fi

#read verse num to add pilcrow sign to and add sed line to script
chapter=1
while ((chapter <= chapter_max)); do
    if [[ $chapter_max -gt 1 ]]; then
        printf '\n%s %s\n' "$short_title" "$chapter"
    elif [[ $chapter_max -eq 1 ]]; then
        printf '\n%s\n' "$short_title"
    fi
    read -p ">>> " verse
    while ((verse != "n")); do
            echo -e "sed -i \"s/###### ${verse}$/###### ¶ ${verse}/g\" \"\${reading_dir}/${standard_abbreviation}${chapter}\${if_secondary}.md\"" >>pilcrow-script.sh
        read -p ">>> " verse
    done
    # if [[ $verse == "n" ]] && [[ $chapter -eq $chapter_max ]]; then
    #break
    if [[ $verse == "n" ]]; then
        ((chapter++))
    fi
done

#closing prompt
echo
if [[ $chapter_max -eq 1 ]]; then
    echo "Finished: ${1} (${chapter_max} chapter)"
elif [[ $chapter_max -gt 1 ]]; then
    echo "Finished: ${1} (${chapter_max} chapters)"
fi