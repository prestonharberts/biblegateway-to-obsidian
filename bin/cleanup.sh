#!/bin/bash
# shellcheck disable=1091,1110,1112,2154
source config.sh

if [[ $verbose == "true" ]]; then
    printf "\nCleanup"
fi

# HEADINGS
# delete "Chapter x" heading
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/##### Chapter.*//g' {} +
# format verses into H6 headers
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/###### [0-9]{1,3} /\n&\n/g' {} +
# fix headings immediately following punctuation
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/([!?.,”’:\)])([A-Za-z0-9])/\1\n## \2/g' {} +
# fix some superscripts back to verses
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ <sup class=\"versenum mid-line\">/\n###### /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<\/sup>/\n/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<sup class=\"versenum mid-line\">/\n###### /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<\/sup>/\n/g' {} +
# create editorial headers
if [[ $yaml_enabled == "true" ]]; then
    find . -type f -wholename "${reading_dir}/*.md" -exec sed -i '6 s/[A-Za-z0-9:].*/## &/g' {} + # make first header if it exists (YAML enabled)
else
    find . -type f -wholename "${reading_dir}/*.md" -exec sed -i '3 s/[A-Za-z0-9:].*/## &/g' {} + # make first header if it exists (YAML disabled)
fi
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/”[A-Z0-9][A-Za-z0-9: ].*$/”\n## &/g' {} + # header following quotes
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## ”/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/’[A-Z0-9][A-Za-z0-9: ].*$/’\n## &/g' {} + # header following apostrophes
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## ’/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/)[A-Z0-9][A-Za-z0-9: ].*$/)\n## &/g' {} + # header following parentheses
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## )/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.[A-Z0-9][A-Za-z0-9: ].*$/.\n## &/g' {} + # header following period
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## \./## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\,[A-Z][A-Za-z: ].*$/,\n## &/g' {} + # header following comma
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## \,/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/![A-Z0-9][A-Za-z0-9: ].*$/!\n## &/g' {} + # header following exclamation mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## !/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/?[A-Z0-9][A-Za-z0-9: ].*$/?\n## &/g' {} + # header following quotation mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## ?/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\:[A-Z0-9][A-Za-z0-9: ].*$/:\n## &/g' {} + # header following colon
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## \:/## /g' {} +
echo -n "."
# create editorial headers that got removed
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.”[A-Z0-9][A-Za-z0-9: ].*$/\.”\n## &/g' {} + # header following quotes (period)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/!”[A-Z0-9][A-Za-z0-9: ].*$/!”\n## &/g' {} +   # header following quotes (exclamation mark)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## !”/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/?”[A-Z0-9][A-Za-z0-9: ].*$/?”\n## &/g' {} + # header following quotes (question mark)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## ?”/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.'’'[A-Z0-9][A-Za-z0-9: ].*$/\.'’'\n## &/g' {} + # header following apostrophes (period)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## \.'’'/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/!'’'[A-Z0-9][A-Za-z0-9: ].*$/!'’'\n## &/g' {} + # header following apostrophes (exclamation mark)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## !'’'/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/?'’'[A-Z0-9][A-Za-z0-9: ].*$/?'’'\n### &/g' {} + # header following apostrophes (question mark)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## ?'’'/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/)[A-Z0-9][A-Za-z0-9: ].*$/)\n## &/g' {} + # header following parentheses
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## )/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.[A-Z0-9][A-Za-z0-9: ].*$/.\n## &/g' {} + # header following period
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## \./## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\,[A-Z][A-Za-z: ].*$/,\n## &/g' {} + # header following comma
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## \,/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/![A-Z0-9][A-Za-z0-9: ].*$/!\n## &/g' {} + # header following exclamation mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## !/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/?[A-Z0-9][A-Za-z0-9: ].*$/?\n## &/g' {} + # header following quotation mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## ?/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\:[A-Z0-9][A-Za-z0-9: ].*$/:\n## &/g' {} + # header following colon
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## \:/## /g' {} +
echo -n "."

# ITALICS
# transform _Selah_ to <i>Selah</i> and give it an extra space
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/[_*]Selah[_*]/ <i>Selah<\/i>/g' {} +
# put italic underscores before punctuation marks
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/_([!?.,”’:\)])/<\/i>\1/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/([!?.,”’:\)])_/<\/i>\1/g' {} +
# transform underscored text into CSS italics
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/_ _/<\/i> <i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/_([A-Za-z1-9])/<i>\1/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -E 's/([A-Za-z1-9])_/\1<\/i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ *<\/i>/<\/i>/g' {} +
echo -n "."

# ASTERISKS
# escape asterisks for translations that use them (LSB)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\*/\\\*/g' {} +
# remove all  \*\* that get created with the command above
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\\\*\\\*//g' {} +
echo -n "."

# REMOVE MISC
# delete empty headings
find . -wholename "${reading_dir}/*.md" -print0 | xargs -0 perl -pi -e 's/#*$//g'
# remove Psalm headings for certain translations
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^Psalm [0-9]{1,3}//g' {} +
# delete Psalm book headings
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## Book One//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## Book Two//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## Book Three//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## Book Four//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## Book Five//g' {} +
# remove tags
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<b class="quote">//g' {} +
# remove <em> and </em>
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/[<]em[>]//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/[<]\/em[>]//g' {} +
echo -n "."

# BRACKETS
# escape single brackets
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^\[/\\[/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^\[.*\]/&\.\.\./g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^[A-Za-z0-9[].*\[/&\.\.\./g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\[\.\.\./\\[/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^[A-Za-z0-9].*\]/&\.\.\./g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\]\.\.\./\\]/g' {} +
# escape double brackets
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^\[\[/\\[\\[/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^\[\\\[/\\[\\[/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^\\\[\[/\\[\\[/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^\[\[.*\]/&\.\.\./g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^[A-Za-z0-9].*\[\[/&\.\.\./g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\[\[\.\.\./\\[\\[/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^[A-Za-z0-9].*\]\]/&\.\.\./g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\]\]\.\.\./\\]\\]/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\\]\]/\\]\\]/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\]\\]/\\]\\]/g' {} +
echo -n "."
# fix alias brackets in frontmatter
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i '2 s/\\\[/\[/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i '2 s/\\\]/\]/g' {} +
echo -n "."

# SPACES
# remove extra space before some hyphens
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ —/—/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/— /—/g' {} +
# remove space before asterisks followed by right bracket
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ \*\]/\*]/g' {} +
# replace multiple spaces in a row with just one space
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ {2,\}/ /g' {} +
# add space after
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.[A-Za-z0-9*]/\.\.\.&/g' {} + # periods
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.\.\.\./\. /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.”[A-Za-z0-9*]/\.\.\.&/g' {} + # quotation (period)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.\.\.\.”/\.” /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/!”[A-Za-z0-9*]/\.\.\.&/g' {} + # quotation (exclamation mark)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.\.\.!”/\!” /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/?”[A-Za-z0-9*]/\.\.\.&/g' {} + # quotation (question mark)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.\.\.?”/?” /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.'’'[A-Za-z0-9*]/\.\.\.&/g' {} + # apostrophe (period)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.\.\.\.'’'/\.'’' /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/!'’'[A-Za-z0-9*]/\.\.\.&/g' {} + # apostrophe (exclamation mark)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.\.\.!'’'/!'’' /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/?'’'[A-Za-z0-9*]/\.\.\.&/g' {} + # apostrophe (question mark)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.\.\.?'’'/?'’' /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/)[A-Za-z0-9*]/\.\.\.&/g' {} + # parentheses
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.\.\.)/) /g' {} +
# add space between certain characters and right quotes
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\. ”/\.”/g' {} +                  # right double quote period
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\. '’'/\.'’'/g' {} +              # right single quote period
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\, ”/\,”/g' {} +                  # right double quote comma
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\, '’'/\,'’'/g' {} +              # right single quote comma
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\! ”/!”/g' {} +                   # right double quote exclamation mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\! '’'/!'’'/g' {} +               # right single quote exclamation mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\? ”/?”/g' {} +                   # right double quote question mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\? '’'/?'’'/g' {} +               # right single quote question mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\[A-Za-z0-9*] ”/&\.\.\./g' {} +   # right double quote letters and numbers
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ ”\.\.\./”/g' {} +                # right double quote letters and numbers
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\[A-Za-z0-9*] '’'/&\.\.\./g' {} + # right single quote letters and numbers
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ '’'\.\.\./'’'/g' {} +            # right single quote letters and numbers
# add space before/after punctuation and remove duplicate spaces
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/;/& /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\,/& /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\!/& /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\?/& /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\:/& /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/[ ]\{2,\}/ /g' {} +
# correct spacing for numbers over 1,000 with commas
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/[0-9]\, [0-9]/&\.\.\./g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ 0\.\.\./0/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ 1\.\.\./1/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ 2\.\.\./2/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ 3\.\.\./3/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ 4\.\.\./4/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ 5\.\.\./5/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ 6\.\.\./6/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ 7\.\.\./7/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ 8\.\.\./8/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ 9\.\.\./9/g' {} +
# add space between certain characters and right quotes
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\. ”/\.”/g' {} +                    # right double quote period
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\. '’'/\.'’'/g' {} +                # right single quote period
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\, ”/\,”/g' {} +                    # right double quote comma
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\, '’'/,'’'/g' {} +                 # right single quote comma
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\! ”/!”/g' {} +                     # right double quote exclamation mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\! '’'/!'’'/g' {} +                 # right single quote exclamation mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\? ”/?”/g' {} +                     # right double quote question mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\? '’'/?'’'/g' {} +                 # right single quote question mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\[A-Za-z0-9*] ”/&\.\.\.\./g' {} +   # right double quote letters and numbers
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/”\.\.\.\./”/g' {} +                 # right double quote letters and numbers
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\[A-Za-z0-9*] '’'/&\.\.\.\./g' {} + # right single quote letters and numbers
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/'’'\.\.\.\./'’'/g' {} +             # right single quote letters and numbers
# delete spaces after text
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ *$//g' {} +
# delete spaces before text
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^ *//g' {} +
echo -n "."

# NEWLINES
# correct newline spacing
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n{2,\}/\n/;ba;}' {} +
# correct newline spacing for outlines
find . -type f -wholename "${outlines_dir}/*.md" -exec sed -i ':a;$!{N;s/\n{2,\}/\n/;ba;}' {} +
# add newline betweeen commas and quotation mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\,”[A-Za-z0-9*]/\.\.\.&/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.\.\.\,”/\,\n”/g' {} +
# add newline after second headers (will be removed later if redundant)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## .*/&\n/g' {} +
# correct newline spacing
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n/;ba;}' {} +
# correct newline spacing
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n/;ba;}' {} +
# chomp off all trailing newlines
find . -type f -wholename "${reading_dir}/*.md" -exec perl -pi -e 'chomp if eof' {} +
echo -n "."

# CREATE NOTES
if [[ $primary_translation == "true" ]]; then
    # make note files empty
    find . -type f -wholename "*${notes}.md" -exec sed -i 's/alias/[alias]/g' {} +
    find . -type f -wholename "*${notes}.md" -exec sed -i 's/\-\-\-/[---]/g' {} +
    find . -type f -wholename "*${notes}.md" -exec sed -i 's/^[^#![].*//g' {} +
    find . -type f -wholename "*${notes}.md" -exec sed -i '7 s/###### 1$/- [ ] /g' {} +
    find . -type f -wholename "*${notes}.md" -exec sed -i 's/###### [0-9]*//g' {} +
    find . -type f -wholename "*${notes}.md" -exec sed -i 's/\[alias\]/alias/g' {} +
    find . -type f -wholename "*${notes}.md" -exec sed -i 's/\[\-\-\-\]/---/g' {} +
    find . -type f -wholename "*${notes}.md" -exec sed -i 's/^\[.*//g' {} +
    # remove 1 headers
    find . -type f -wholename "*${notes}.md" -exec sed -i 's/ *$//g' {} + # delete spaces after text
    find . -type f -wholename "*${notes}.md" -exec sed -i ':a;$!{N;s/## 1$\n//;ba;}' {} +
    # add space after headers
    find . -type f -wholename "*${notes}.md" -exec sed -i 's/^## .*/&\n- [ ] \n/g' {} +
    find . -type f -wholename "*.md" -exec sed -i 's/##$//g' {} +
    # remove extra bullet
    find . -type f -wholename "*${notes}.md" -exec sed -i ':a;$!{N;s/\- \[ \] n\- \[ \]/- [ ] /;ba;}' {} +
    # remove extra spacing caused by bracketed verses
    find . -type f -wholename "*${notes}.md" -exec sed -i ':a;$!{N;s/\n$//;ba;}' {} +
    # other
    find . -type f -wholename "*${notes}.md" -exec sed -i 's/^- \[ \]$/& /g' {} +
    echo -n "."
fi

# AUDIO BIBLES
if [[ $enable_audio_bible == "true" ]]; then
    # fix MP3 link
    find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\. mp3/\.mp3/g' {} +
    echo -n "."
fi

# MOVE FILES
if [[ $primary_translation == "true" ]]; then
    mv "${reading_dir}/"*notes.md "${notes_dir}/"
    echo -n "."
fi
if [[ $enable_audio_bible == "false" ]]; then
    rm "${audio_dir}" -r
    echo -n "."
fi

# PILCROW SIGNS
# add pilcrow signs to verses where a new paragraph starts
source bin/pilcrow-signs.sh
echo -n "."

if [[ $verbose == "true" ]]; then
    printf "\nIt is finished.\n"
fi
