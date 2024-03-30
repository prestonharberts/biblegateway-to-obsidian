#!/bin/bash
# shellcheck disable=1091,1110,1112,2154
source config.sh

if [[ $verbose == "true" ]]; then
    printf "\nCleaning up markdown files..."
fi

# remove "Chapter x" at the beginning of each file
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/##### Chapter.*//g' {} +

# escape existing asterisks
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\*/\\\*/g' {} +

# remove all \*\*
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\*\*//g' {} +

# transform _Selah_ into *Selah* and add a space
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/_Selah_/ *Selah*/g' {} +

# put italic underscores before quotes and punctuation
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\!\_/<\/i>!/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\?\_/<\/i>?/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\_“/“<i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\_‘/‘<i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/”\_/<\/i>”/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/’\_/<\/i>’/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\_’/<\/i>/g' {} +

# transform underscored text into CSS italics
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\_ \_/<\/i> <i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\_[A-Za-z]/<i>...&/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<i>\.\.\._/<i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/[A-Za-z.,]\_/&...<\/i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\_\.\.\.<\/i>/<\/i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ <\/i>/<\/i>/g' {} +

# format verses into H6 headers
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/###### [0-9] /\n&\n/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/###### [0-9][0-9] /\n&\n/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/###### [0-9][0-9][0-9] /\n&\n/g' {} +

# remove spaces at the beginning of verses
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^ *//g' {} +

# correct Psalm headings for certain translations
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^Psalm [0-9][0-9][0-9]//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^Psalm [0-9][0-9]//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^Psalm [0-9]//g' {} +

# create editorial headers
if [[ $yaml_enabled == "true" ]]; then
    find . -type f -wholename "${reading_dir}/*.md" -exec sed -i '6 s/[A-Za-z0-9:].*/## &/g' {} + # make first header if it exists (YAML enabled)
else
    find . -type f -wholename "${reading_dir}/*.md" -exec sed -i '3 s/[A-Za-z0-9:].*/## &/g' {} + # make first header if it exists (YAML disabled)
fi
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/”[A-Z0-9][A-Za-z0-9: ].*$/”\n## &/g' {} + # header following quotes
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## ”/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\'’'[A-Z0-9][A-Za-z0-9: ].*$/'’'\n## &/g' {} + # header following apostrophes
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## '’'/## /g' {} +
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

find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ *$//g' {} +      # delete spaces after text
find . -wholename "${reading_dir}/*.md" -print0 | xargs -0 perl -pi -e 's/#*$//g' # delete empty headers

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

# add newline betweeen commas and quotation mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\,”[A-Za-z0-9*]/\.\.\.&/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.\.\.\,”/\,\n”/g' {} +

# add newline after second headers (will be removed later if redundant)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## .*/&\n/g' {} +

# delete Psalm book headings
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## Book One//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## Book Two//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## Book Three//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## Book Four//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## Book Five//g' {} +

# correct newline spacing
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n/;ba;}' {} +

if [[ $enable_audio_bible == "true" ]]; then
    # fix mp3 link
    find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\. mp3/\.mp3/g' {} +
fi

# fix some superscripts back to verses
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ <sup class=\"versenum mid-line\">/\n###### /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<\/sup>/\n/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<sup class=\"versenum mid-line\">/\n###### /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<\/sup>/\n/g' {} +

# remove tags
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<b class="quote">//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\*\*//g' {} +

# correct newline spacing
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n/;ba;}' {} +

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
fi

find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^# .*$/&\n/g' {} +

if [[ $primary_translation == "true" ]]; then
    find . -type f -wholename "*${notes}.md" -exec sed -i 's/^- \[ \]$/& /g' {} +
fi

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

# correct newline spacing
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n/;ba;}' {} +

find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n# /\n# /;ba;}' {} +

find . -type f -wholename "${reading_dir}/*.md" -exec sed -i -e :a -e '/^\n*$/{$d;N;};/\n$/ba' {} +

find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## AboutHelpOur NetworkSocialPreferences//g' {} + # remove CSB notes
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/By submitting your email.*Preferences//g' {} +    # remove CSB notes

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

# remove extra space before some hyphens
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ —/—/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/— /—/g' {} +

# correct newline spacing
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n##### /\n##### /;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/→\n/→/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/→##/→\n##/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/→-/→\n-/;ba;}' {} +

# remove space before asterisks followed by right bracket
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ \*\]/\*]/g' {} +

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

# correct \*Selah\* to Selah
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\\\*Selah\\\*/<i>Selah<\/i>/g' {} +

# remove <em> and </em>
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/[<]em[>]//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/[<]\/em[>]//g' {} +

# delete pairs of asterisks
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\*\*//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\\\*\\\*//g' {} +

# fix alias brackets
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i '2 s/\\\[/\[/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i '2 s/\\\]/\]/g' {} +

# chomp off all trailing newlines
find . -type f -wholename "${reading_dir}/*.md" -exec perl -pi -e 'chomp if eof' {} +

if [[ $primary_translation == "true" ]]; then
    mv "${reading_dir}/"*notes.md "${notes_dir}/"
fi
if [[ $enable_audio_bible == "false" ]]; then
    rm "${audio_dir}" -r
fi

# delete spaces after text
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ *$//g' {} +

find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n/\n/;ba;}' {} + # Remove newline that gets added before ending horizontal line

# duplicate lines
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ <\/i>/<\/i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\_“/“<i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/?<\/i>/<\/i>?/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/?<\/i>/<\/i>?/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/!<\/i>/<\/i>!/g' {} +

# fix header immediately following punctuation
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.[A-Za-z0-9*]/\.\n\.\.&/g' {} + # periods
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.\.\./\## /g' {} +              # periods
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\![A-Za-z0-9*]/\.\n\.\.&/g' {} + # periods
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\!\.\.\!/\## /g' {} +            # periods
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\?[A-Za-z0-9*]/\.\n\.\.&/g' {} + # periods
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\?\.\.\?/\## /g' {} +            # periods

# correct newline spacing for outlines
find . -type f -wholename "${outlines_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n/\n/;ba;}' {} +
find . -type f -wholename "${outlines_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${outlines_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${outlines_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${outlines_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${outlines_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${outlines_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${outlines_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n/;ba;}' {} +

source bin/pilcrow-signs.sh

if [[ $verbose == "true" ]]; then
    echo "Done."
fi
