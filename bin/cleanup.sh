#!/bin/bash
# shellcheck disable=1091,1110,1112,2154
source config.sh

if [[ $verbose == "true" ]]; then
  printf "\nCleanup"
fi

# ASTERISKS
# escape asterisks for translations that use them (LSB)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\*/\\\*/g' {} +
# remove all  \*\* that get created with the command above
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\\\*\\\*//g' {} +
if [[ "${verbose}" == "true" ]]; then
  echo -n "."
fi

# ITALICS
# transform _Selah_ to <i>Selah</i> and give it an extra space
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/[_*]Selah[_*]/ <i>Selah<\/i>/g' {} +
# put beginning italics after certain punctuation marks
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/([“‘\(]|\[)_/\1<i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/_([“‘\(]|\[)/\1<i>/g' {} +
# put ending italics before certain punctuation marks
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/_([!?.,:;”’\)]|\])/<\/i>\1/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/([!?.,:;”’\)]|\])_/<\/i>\1/g' {} +
# transform underscored text into CSS italics
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/_ _/<\/i> <i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/_([A-Za-z1-9])/<i>\1/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/([A-Za-z1-9])_/\1<\/i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ *<\/i>/<\/i>/g' {} +
# replace css italics with asterisks
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<\/*i>/*/g' {} +
if [[ "${verbose}" == "true" ]]; then
  echo -n "."
fi

# HEADINGS
# create first heading if it exists
if [[ $yaml_enabled == "true" ]]; then
  find . -type f -wholename "${reading_dir}/*.md" -exec sed -i '6 s/^[A-Za-z0-9].*/## &/g' {} +
elif [[ $yaml_enabled == "false" ]]; then
  find . -type f -wholename "${reading_dir}/*.md" -exec sed -i '3 s/^[A-Za-z0-9].*/## &/g' {} +
fi
# create all headings that immediately follow punction without a space
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/([!?.,:;”’\)]|\])([A-Z0-9])/\1\n## \2/g' {} +
# delete "Chapter x" heading
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/##### Chapter.*//g' {} +
# remove "1" from books that only have one chapter (Obadiah 1 -> Obadiah)
# short_title (Obadiah 1) and abbreviations (Obad. 1)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E "s/(${short_title_31}|${abbreviation_31}) 0/\1/g" {} + # Obadiah
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E "s/(${short_title_57}|${abbreviation_57}) 1/\1/g" {} + # Philemon
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E "s/(${short_title_63}|${abbreviation_63}) 1/\1/g" {} + # 2 John
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E "s/(${short_title_64}|${abbreviation_64}) 1/\1/g" {} + # 3 John
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E "s/(${short_title_65}|${abbreviation_65}) 1/\1/g" {} + # Jude
# format verses into H6 headings
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/###### [0-9]{1,3} /\n&\n/g' {} +
# fix some superscripts back to verses
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ <sup class=\"versenum mid-line\">/\n###### /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<\/sup>/\n/g' {} +
if [[ "${verbose}" == "true" ]]; then
  echo -n "."
fi

# REMOVE MISC
# delete empty headings
find . -wholename "${reading_dir}/*.md" -print0 | xargs -0 perl -pi -e 's/#*$//g'
# remove Psalm headings for certain translations
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/^Psalm [0-9]{1,3}//g' {} +
# delete Psalm book headings
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/## Book (One|Two|Three|Four|Five)//g' {} +
# remove tags
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<b class="quote">//g' {} +
# remove <em> and </em>
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/[<]\/*em[>]//g' {} +
if [[ "${verbose}" == "true" ]]; then
  echo -n "."
fi

# BRACKETS
# escape brackets
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i '/^#/!s/[][]/\\&/g' {} +
# fix alias brackets in frontmatter
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i '2 s/\\*\[/[/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i '2 s/\\*\]/]/g' {} +
if [[ "${verbose}" == "true" ]]; then
  echo -n "."
fi

# SPACES
# remove extra space before some hyphens
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ —/—/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/— /—/g' {} +
# replace multiple spaces in a row with just one space
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/ {2,}/ /g' {} +
# remove space before right-sided punctuation
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/(.) ([!?.,:;”’\)]|\])/\1\2/g' {} +
# remove space after certain left-sided punctuation
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/([“‘\(]|\[) (.)/\1\2/g' {} +
# add space before escaped asterisks
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/\\\*/ &/g' {} +
# add space before escaped left bracket
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\\\[/ \\[/g' {} +
# remove space between two escaped left brackets
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\\\[ \\\[/\\[\\[/g' {} +
# correct spacing for numbers over 1,000 with commas
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/([0-9]), ([0-9])/\1,\2/g' {} +
find . -type f -wholename "${outlines_dir}/*.md" -exec sed -i -E ':a;$!{N;s/([0-9]),\n## ([0-9])/\1,\2/;ba;}' {} +
# remove duplicate spaces
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/ {2,}/ /g' {} +
# delete spaces after text
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ *$//g' {} +
# delete spaces before text
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^ *//g' {} +
if [[ "${verbose}" == "true" ]]; then
  echo -n "."
fi

# CREATE NOTES
if [[ $main_translation == "true" ]]; then
  # delete all text and create checkbox for chapters that do not start with a heading
  if [[ $yaml_enabled == "true" ]]; then
    find . -type f -wholename "*notes.md" -exec sed -i '4,$s/^[^#].*//g' {} +
    find . -type f -wholename "*notes.md" -exec sed -i '7 s/###### 1$/- [ ] /g' {} +
  elif [[ $yaml_enabled == "false" ]]; then
    find . -type f -wholename "*notes.md" -exec sed -i '4,$s/^[^#].*//g' {} +
    find . -type f -wholename "*notes.md" -exec sed -i 's/^[^#].*//g' {} +
    find . -type f -wholename "*notes.md" -exec sed -i '4 s/###### 1$/- [ ] /g' {} +
  fi
  # delete verse headings
  find . -type f -wholename "*notes.md" -exec sed -i 's/###### [0-9]*//g' {} +
  # add checkbox after headings
  find . -type f -wholename "*notes.md" -exec sed -i 's/^## .*/&\n- [ ] /g' {} +
  # remove extra checkbox
  find . -type f -wholename "*notes.md" -exec sed -i ':a;$!{N;s/\- \[ \] \n\- \[ \]/- [ ] /;ba;}' {} +
  if [[ "${verbose}" == "true" ]]; then
    echo -n "."
  fi
fi

# NEWLINES
# correct newline spacing
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E ':a;$!{N;s/\n{2,}/\n/;ba;}' {} +
# correct newline spacing for outlines
find . -type f -wholename "${outlines_dir}/*.md" -exec sed -i -E ':a;$!{N;s/\n{2,}/\n/;ba;}' {} +
# chomp off all trailing newlines
find . -type f -wholename "${reading_dir}/*.md" -exec perl -pi -e 'chomp if eof' {} +
if [[ "${verbose}" == "true" ]]; then
  echo -n "."
fi

# MOVE FILES
if [[ $main_translation == "true" ]]; then
  mv "${reading_dir}/"*notes.md "${notes_dir}/"
  if [[ "${verbose}" == "true" ]]; then
    echo -n "."
  fi
fi

# PILCROW SIGNS
# add pilcrow signs to verses where a new paragraph starts
source bin/pilcrow-signs.sh
if [[ "${verbose}" == "true" ]]; then
  echo -n "."
fi

if [[ $verbose == "true" ]]; then
  printf '\nDownloaded the %s Bible.\n' "${translation}"
fi
