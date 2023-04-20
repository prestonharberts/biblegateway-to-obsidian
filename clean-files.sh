#!/bin/bash

source config.sh

# Tidy up the markdown files

printf "\nCleaning up the Markdown files."

# Format verses into H6 headers
find . -type f -name "*.md" -exec sed -i 's/###### [0-9] /\n\n&\n\n/g' {} +
find . -type f -name "*.md" -exec sed -i 's/###### [0-9][0-9] /\n\n&\n\n/g' {} +
find . -type f -name "*.md" -exec sed -i 's/###### [0-9][0-9][0-9] /\n\n&\n\n/g' {} +

# Remove spaces at the beginning of verses
find . -type f -name "*.md" -exec sed -i 's/^ *//g' {} +

# Correct Psalm headings for certain translations
find . -type f -name "*.md" -exec sed -i 's/^Psalm [0-9][0-9][0-9]//g' {} +
find . -type f -name "*.md" -exec sed -i 's/^Psalm [0-9][0-9]//g' {} +
find . -type f -name "*.md" -exec sed -i 's/^Psalm [0-9]//g' {} +

# Create editorial headers
find . -type f -name "*[0-9].md" -exec sed -i '5 s/[A-Za-z0-9].*/\n## &/g' {} +             # Make first header if it exists
find . -type f -name "*.md" -exec sed -i 's/\.\"[A-Z0-9].*[A-Za-z0-9]$/\.\"\n\n## &/g' {} + # Header following quotes (period)
find . -type f -name "*.md" -exec sed -i 's/## \.\"/## /g' {} +
find . -type f -name "*.md" -exec sed -i 's/!\"[A-Z0-9].*[A-Za-z0-9]$/!\"\n\n## &/g' {} + # Header following quotes (exclamation mark)
find . -type f -name "*.md" -exec sed -i 's/## !\"/## /g' {} +
find . -type f -name "*.md" -exec sed -i 's/?\"[A-Z0-9].*[A-Za-z0-9]$/?\"\n\n## &/g' {} + # Header following quotes (question mark)
find . -type f -name "*.md" -exec sed -i 's/## ?\"/## /g' {} +
find . -type f -name "*.md" -exec sed -i 's/\.'\''[A-Z0-9].*[A-Za-z0-9]$/\.'\''\n\n## &/g' {} + # Header following apostrophes (period)
find . -type f -name "*.md" -exec sed -i 's/## \.'\''/## /g' {} +
find . -type f -name "*.md" -exec sed -i 's/!'\''[A-Z0-9].*[A-Za-z0-9]$/!'\''\n\n## &/g' {} + # Header following apostrophes (exclamation mark)
find . -type f -name "*.md" -exec sed -i 's/## !'\''/## /g' {} +
find . -type f -name "*.md" -exec sed -i 's/?'\''[A-Z0-9].*[A-Za-z0-9]$/?'\''\n\n### &/g' {} + # Header following apostrophes (question mark)
find . -type f -name "*.md" -exec sed -i 's/## ?'\''/## /g' {} +
find . -type f -name "*.md" -exec sed -i 's/)[A-Z0-9].*[A-Za-z0-9]$/)\n\n## &/g' {} + # Header following parentheses
find . -type f -name "*.md" -exec sed -i 's/## )/## /g' {} +
find . -type f -name "*.md" -exec sed -i 's/![A-Z0-9].*[A-Za-z0-9]$/!\n\n## &/g' {} + # Header following exclamation mark
find . -type f -name "*.md" -exec sed -i 's/## !/## /g' {} +
find . -type f -name "*.md" -exec sed -i 's/?[A-Z0-9].*[A-Za-z0-9]$/?\n\n## &/g' {} + # Header following exclamation mark
find . -type f -name "*.md" -exec sed -i 's/## ?/## /g' {} +
find . -type f -name "*.md" -exec sed -i 's/\.[A-Z0-9].*[A-Za-z0-9]$/\.\n\n## &/g' {} +
find . -type f -name "*.md" -exec sed -i 's/## \./## /g' {} +

# Delete spaces after text
find . -type f -name "*.md" -exec sed -i 's/ *$//g' {} +

# Delete empty headers
find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/#*$//g'

# Add space after
find . -type f -name "*.md" -exec sed -i 's/\.[A-Za-z0-9]/\.\.\.&/g' {} + # periods
find . -type f -name "*.md" -exec sed -i 's/\.\.\.\./\. /g' {} +
find . -type f -name "*.md" -exec sed -i 's/\.\"[A-Za-z0-9]/\.\.\.&/g' {} + # quotation (period)
find . -type f -name "*.md" -exec sed -i 's/\.\.\.\.\"/\.\" /g' {} +
find . -type f -name "*.md" -exec sed -i 's/!\"[A-Za-z0-9]/\.\.\.&/g' {} + # quotation (exclamation mark)
find . -type f -name "*.md" -exec sed -i 's/\.\.\.!\"/\!\" /g' {} +
find . -type f -name "*.md" -exec sed -i 's/?\"[A-Za-z0-9]/\.\.\.&/g' {} + # quotation (question mark)
find . -type f -name "*.md" -exec sed -i 's/\.\.\.?\"/?\" /g' {} +
find . -type f -name "*.md" -exec sed -i 's/\.'\''[A-Za-z0-9]/\.\.\.&/g' {} + # apostrophe (period)
find . -type f -name "*.md" -exec sed -i 's/\.\.\.\.'\''/\.'\'' /g' {} +
find . -type f -name "*.md" -exec sed -i 's/!'\''[A-Za-z0-9]/\.\.\.&/g' {} + # apostrophe (exclamation mark)
find . -type f -name "*.md" -exec sed -i 's/\.\.\.!'\''/!'\'' /g' {} +
find . -type f -name "*.md" -exec sed -i 's/?'\''[A-Za-z0-9]/\.\.\.&/g' {} + # apostrophe (question mark)
find . -type f -name "*.md" -exec sed -i 's/\.\.\.?'\''/?'\'' /g' {} +
find . -type f -name "*.md" -exec sed -i 's/)[A-Za-z0-9]/\.\.\.&/g' {} + # parentheses
find . -type f -name "*.md" -exec sed -i 's/\.\.\.)/) /g' {} +

# Add newline betweeen commas and quotation mark
find . -type f -name "*.md" -exec sed -i 's/\,\"[A-Za-z0-9]/\.\.\.&/g' {} +
find . -type f -name "*.md" -exec sed -i 's/\.\.\.\,\"/\,\n\"/g' {} +

# Add newline after second headers (will be removed later if redundant)
find . -type f -name "*.md" -exec sed -i 's/## .*/&\n/g' {} +

# Delete Psalm book headings
find . -type f -name "*.md" -exec sed -i 's/## Book One//g' {} +
find . -type f -name "*.md" -exec sed -i 's/## Book Two//g' {} +
find . -type f -name "*.md" -exec sed -i 's/## Book Three//g' {} +
find . -type f -name "*.md" -exec sed -i 's/## Book Four//g' {} +
find . -type f -name "*.md" -exec sed -i 's/## Book Five//g' {} +

# Turn H6 into numbered list
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/###### //g' {} +
find . -type f -name "*.md" -exec sed -i 's/ *$//g' {} + # Delete spaces after text
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/^[0-9][0-9][0-9]$/&.temp1/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/^[0-9][0-9]$/&.temp1/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/^[0-9]$/&.temp1/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/temp1\n/ /;ba;}' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/^[0-9][0-9][0-9]\./temp2&/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/^[0-9][0-9]\./temp2&/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/^[0-9]\./temp2&/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i ':a;$!{N;s/\ntemp2//;ba;}' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/^##.*$/&\n/g' {} +
find . -type f -wholename "${reading_folder}/*.md" -exec sed -i 's/mp3\]\]/&\n/g' {} +

# find . -type f -name "*.md" -exec sed -i 's/^[0-9][0-9][0-9]$/&.temp1/g' {} +
# find . -type f -name "*.md" -exec sed -i 's/^[0-9][0-9]$/&.temp1/g' {} +
# find . -type f -name "*.md" -exec sed -i 's/^[0-9]$/&.temp1/g' {} +
# find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/temp1\n\n//;ba;}' {} +
# find . -type f -name "*.md" -exec sed -i 's/^[0-9][0-9][0-9]\./temp2&/g' {} +
# find . -type f -name "*.md" -exec sed -i 's/^[0-9][0-9]\./temp2&/g' {} +
# find . -type f -name "*.md" -exec sed -i 's/^[0-9]\./temp2&/g' {} +
# find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\ntemp2//;ba;}' {} +
# find . -type f -name "*.md" -exec sed -i 's/^##.*$/&\n/g' {} +

# Correct newline spacing
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n\n\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n\n\n\n/;ba;}' {} +

# Fix mp3 link
find . -type f -name "*.md" -exec sed -i 's/\. mp3/\.mp3/g' {} +

# Fix some superscripts back to verses

find . -type f -name "*.md" -exec sed -i 's/ <sup class=\"versenum mid-line\">/\n\n###### /g' {} +
find . -type f -name "*.md" -exec sed -i 's/<\/sup>/\n\n/g' {} +
find . -type f -name "*.md" -exec sed -i 's/<sup class=\"versenum mid-line\">/\n\n###### /g' {} +
find . -type f -name "*.md" -exec sed -i 's/<\/sup>/\n\n/g' {} +

# Remove tags
find . -type f -name "*.md" -exec sed -i 's/<b class="quote">//g' {} +
find . -type f -name "*.md" -exec sed -i 's/\*\*//g' {} +

# Correct newline spacing
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n\n/;ba;}' {} +

# Make first header if it exists
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i '5 s/[A-Za-z0-9].*/\n## &/g' {} +

# Make note files empty
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i 's/^[^#![].*//g' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i 's/###### [0-9]*//g' {} +

# Remove audio bible
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i 's/.*mp3.*//g' {} +

# Add ' notes' to the title header
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i '1 s/$/ notes/g' {} +

# Remove Contents
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i 's/## Contents//g' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i 's/\[\[.*notes\]\]//g' {} +

# Change Related notes
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i 's/|Previous/-notes|Previous/g' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i 's/|Next/-notes|Next/g' {} +

# Correct newline spacing
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n\n\n\n/;ba;}' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n\n\n\n/;ba;}' {} +

# Add space after headers
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i 's/^## .*/&\n\n- [ ] /g' {} +

# Remove 1 headers
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/## 1\n\n//;ba;}' {} +

# Fix Related spacing
# find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/\n\n- [ ] \n\n\[\[/\n\n\[\[/;ba;}' {} +
find . -type f -wholename "${notes_folder}/*.md" -exec sed -i ':a;$!{N;s/## Related\n\n- \[ \] /## Related/;ba;}' {} +

printf "\nDownload complete. Markdown files ready for Obsidian import.\n"
