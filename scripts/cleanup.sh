#!/bin/bash

source config.sh

if [[ $verbose == "true" ]]; then
    printf "\nCleaning up markdown files..."
fi

# Remove "Chapter x" at the beginning of each file
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/##### Chapter.*//g' {} +

# Escape existing asterisks
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\*/\\\*/g' {} +

# Remove all \*\*
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\*\*//g' {} +

# Transform _Selah_ into *Selah* and add a space
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/_Selah_/ *Selah*/g' {} +

# Put italic underscores before quotes and punctuation
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\!\_/<\/i>!/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\?\_/<\/i>?/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\_“/“<i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\_‘/‘<i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/”\_/<\/i>”/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/’\_/<\/i>’/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\_’/<\/i>/g' {} +

# Transform underscored text into CSS italics
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\_ \_/<\/i> <i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\_[A-Za-z]/<i>...&/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<i>\.\.\._/<i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/[A-Za-z.,]\_/&...<\/i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\_\.\.\.<\/i>/<\/i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ <\/i>/<\/i>/g' {} +
# No longer needed because I am using the CSS tag to italicize
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\_/\*/g' {} +

# Format verses into H6 headers
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/###### [0-9] /\n&\n/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/###### [0-9][0-9] /\n&\n/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/###### [0-9][0-9][0-9] /\n&\n/g' {} +

# Remove spaces at the beginning of verses
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^ *//g' {} +

# Correct Psalm headings for certain translations
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^Psalm [0-9][0-9][0-9]//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^Psalm [0-9][0-9]//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^Psalm [0-9]//g' {} +

# Create editorial headers
if [[ $yaml_enabled == "true" ]]; then
    find . -type f -wholename "${reading_dir}/*.md" -exec sed -i '6 s/[A-Za-z0-9:].*/## &/g' {} + # Make first header if it exists (YAML enabled)
else
    find . -type f -wholename "${reading_dir}/*.md" -exec sed -i '3 s/[A-Za-z0-9:].*/## &/g' {} + # Make first header if it exists (YAML disabled)
fi
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/”[A-Z0-9][A-Za-z0-9: ].*$/”\n## &/g' {} + # Header following quotes
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## ”/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\'’'[A-Z0-9][A-Za-z0-9: ].*$/'’'\n## &/g' {} + # Header following apostrophes
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## '’'/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/)[A-Z0-9][A-Za-z0-9: ].*$/)\n## &/g' {} + # Header following parentheses
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## )/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.[A-Z0-9][A-Za-z0-9: ].*$/.\n## &/g' {} + # Header following period
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## \./## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\,[A-Z][A-Za-z: ].*$/,\n## &/g' {} + # Header following comma
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## \,/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/![A-Z0-9][A-Za-z0-9: ].*$/!\n## &/g' {} + # Header following exclamation mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## !/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/?[A-Z0-9][A-Za-z0-9: ].*$/?\n## &/g' {} + # Header following quotation mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## ?/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\:[A-Z0-9][A-Za-z0-9: ].*$/:\n## &/g' {} + # Header following colon
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## \:/## /g' {} +

find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ *$//g' {} +      # Delete spaces after text
find . -wholename "${reading_dir}/*.md" -print0 | xargs -0 perl -pi -e 's/#*$//g' # Delete empty headers

# Add space after
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

# Add space between certain characters and right quotes
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

# Add newline betweeen commas and quotation mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\,”[A-Za-z0-9*]/\.\.\.&/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.\.\.\,”/\,\n”/g' {} +

# Add newline after second headers (will be removed later if redundant)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## .*/&\n/g' {} +

# Delete Psalm book headings
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## Book One//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## Book Two//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## Book Three//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## Book Four//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## Book Five//g' {} +

# Correct newline spacing
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n/;ba;}' {} +

if [[ $enable_audio_bible == "true" ]]; then
    # Fix mp3 link
    find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\. mp3/\.mp3/g' {} +
fi

# Fix some superscripts back to verses

find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ <sup class=\"versenum mid-line\">/\n###### /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<\/sup>/\n/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<sup class=\"versenum mid-line\">/\n###### /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<\/sup>/\n/g' {} +

# Remove tags
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<b class="quote">//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\*\*//g' {} +

# Correct newline spacing
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n/;ba;}' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n/;ba;}' {} +

if [[ $primary_translation == "true" ]]; then
    # Make note files empty
    find . -type f -wholename "*${notes}.md" -exec sed -i 's/alias/[alias]/g' {} +
    find . -type f -wholename "*${notes}.md" -exec sed -i 's/\-\-\-/[---]/g' {} +

    find . -type f -wholename "*${notes}.md" -exec sed -i 's/^[^#![].*//g' {} +
    find . -type f -wholename "*${notes}.md" -exec sed -i '7 s/###### 1$/- [ ] /g' {} +
    find . -type f -wholename "*${notes}.md" -exec sed -i 's/###### [0-9]*//g' {} +

    find . -type f -wholename "*${notes}.md" -exec sed -i 's/\[alias\]/alias/g' {} +
    find . -type f -wholename "*${notes}.md" -exec sed -i 's/\[\-\-\-\]/---/g' {} +

    find . -type f -wholename "*${notes}.md" -exec sed -i 's/^\[.*//g' {} +

    # Remove 1 headers
    find . -type f -wholename "*${notes}.md" -exec sed -i 's/ *$//g' {} + # Delete spaces after text
    find . -type f -wholename "*${notes}.md" -exec sed -i ':a;$!{N;s/## 1$\n//;ba;}' {} +

    # Add space after headers
    find . -type f -wholename "*${notes}.md" -exec sed -i 's/^## .*/&\n- [ ] \n/g' {} +
    find . -type f -wholename "*.md" -exec sed -i 's/##$//g' {} +

    # Remove extra bullet
    find . -type f -wholename "*${notes}.md" -exec sed -i ':a;$!{N;s/\- \[ \] n\- \[ \]/- [ ] /;ba;}' {} +

    # Remove extra spacing caused by bracketed verses
    find . -type f -wholename "*${notes}.md" -exec sed -i ':a;$!{N;s/\n$//;ba;}' {} +
fi

# Turn H6 into numbered list
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/###### //g' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ *$//g' {} + # Delete spaces after text
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^[0-9][0-9][0-9]$/&.temp1/g' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^[0-9][0-9]$/&.temp1/g' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^[0-9]$/&.temp1/g' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/temp1\n/ /;ba;}' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^[0-9][0-9][0-9]\./temp2&/g' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^[0-9][0-9]\./temp2&/g' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^[0-9]\./temp2&/g' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\ntemp2//;ba;}' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^## .*$/&\n/g' {} +

find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^# .*$/&\n/g' {} +

if [[ $primary_translation == "true" ]]; then
    find . -type f -wholename "*${notes}.md" -exec sed -i 's/^- \[ \]$/& /g' {} +
fi

# Convert numbered list to proper level 6 headers without spaces
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^[0-9]\{1,3\}\. /###### &temp\n&/g' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\. temp//g' {} +

# Add space before/after punctuation and remove duplicate spaces
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/;/& /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\,/& /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\!/& /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\?/& /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\:/& /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/[ ]\{2,\}/ /g' {} +

# Correct spacing for numbers over 1,000 with commas
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

# Add space between certain characters and right quotes
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

# Correct newline spacing
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

# Create editorial headers that got removed
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.”[A-Z0-9][A-Za-z0-9: ].*$/\.”\n## &/g' {} + # Header following quotes (period)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/!”[A-Z0-9][A-Za-z0-9: ].*$/!”\n## &/g' {} +   # Header following quotes (exclamation mark)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## !”/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/?”[A-Z0-9][A-Za-z0-9: ].*$/?”\n## &/g' {} + # Header following quotes (question mark)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## ?”/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.'’'[A-Z0-9][A-Za-z0-9: ].*$/\.'’'\n## &/g' {} + # Header following apostrophes (period)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## \.'’'/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/!'’'[A-Z0-9][A-Za-z0-9: ].*$/!'’'\n## &/g' {} + # Header following apostrophes (exclamation mark)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## !'’'/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/?'’'[A-Z0-9][A-Za-z0-9: ].*$/?'’'\n### &/g' {} + # Header following apostrophes (question mark)
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## ?'’'/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/)[A-Z0-9][A-Za-z0-9: ].*$/)\n## &/g' {} + # Header following parentheses
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## )/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.[A-Z0-9][A-Za-z0-9: ].*$/.\n## &/g' {} + # Header following period
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## \./## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\,[A-Z][A-Za-z: ].*$/,\n## &/g' {} + # Header following comma
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## \,/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/![A-Z0-9][A-Za-z0-9: ].*$/!\n## &/g' {} + # Header following exclamation mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## !/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/?[A-Z0-9][A-Za-z0-9: ].*$/?\n## &/g' {} + # Header following quotation mark
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## ?/## /g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\:[A-Z0-9][A-Za-z0-9: ].*$/:\n## &/g' {} + # Header following colon
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/## \:/## /g' {} +

# Remove extra space before some hyphens
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ —/—/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/— /—/g' {} +

# Correct newline spacing
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

# Correct \*Selah\* to Selah
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\\\*Selah\\\*/<i>Selah<\/i>/g' {} +

# Remove <em> and </em>
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/[<]em[>]//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/[<]\/em[>]//g' {} +

# Delete pairs of asterisks
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\*\*//g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\\\*\\\*//g' {} +

# Fix alias brackets
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i '2 s/\\\[/\[/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i '2 s/\\\]/\]/g' {} +

if [[ $primary_translation == "true" ]]; then
    mv "${reading_dir}/"*notes.md "${notes_dir}/"
fi
if [[ $enable_audio_bible == "false" ]]; then
    rm "${audio_dir}" -r
fi

# Delete spaces after text
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ *$//g' {} +

# Replace poetry newlines with <br>
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^[^#-]/<br>&/g' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<br>templine/\n<hr style="margin-top:32px">/g' {} + # Replace templine with newline and horizontal line
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/templine/<hr style="margin-top:32px">/g' {} + # Replace templine with newline and horizontal line
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^<br>alias/alias/g' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^<br>[0-9]\./...&/g' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^<br>[0-9][0-9]\./...&/g' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^<br>[0-9][0-9][0-9]\./...&/g' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.\.\.<br>//g' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n<br>/<br>/;ba;}' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/###### [0-9]<br>/&...\n/g' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/###### [0-9][0-9]<br>/&...\n/g' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/###### [0-9][0-9][0-9]<br>/&...\n/g' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<br>\.\.\.//g' {} +

find . -type f -wholename "${reading_dir}/*.md" -exec sed -i ':a;$!{N;s/\n\n/\n/;ba;}' {} + # Remove newline that gets added before ending horizontal line

## duplicate lines
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/ <\/i>/<\/i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\_“/“<i>/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/?<\/i>/<\/i>?/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/?<\/i>/<\/i>?/g' {} +
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/!<\/i>/<\/i>!/g' {} +

# fix header immediately following punctuation
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.[A-Za-z0-9*]/\.\n\.\.&/g' {} + # periods
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\.\.\./\## /g' {} + # periods
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\![A-Za-z0-9*]/\.\n\.\.&/g' {} + # periods
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\!\.\.\!/\## /g' {} + # periods
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\?[A-Za-z0-9*]/\.\n\.\.&/g' {} + # periods
find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/\?\.\.\?/\## /g' {} + # periods

# Fix verses that continue after a heading
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/^#[^<]*<br>/&...\n###### ¶\n/g' {} +
# find . -type f -wholename "${reading_dir}/*.md" -exec sed -i 's/<br>\.\.\.//g' {} +

source pilcrow-script.sh

if [[ $verbose == "true" ]]; then
    echo " Done."
fi
