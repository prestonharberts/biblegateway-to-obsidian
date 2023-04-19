#!/bin/bash

# Tidy up the Markdown files

echo "Cleaning up the Markdown files."

# Format verses into H6 headers
find . -type f -name "*.md" -exec sed -i 's/###### [0-9] /\n\n&\n\n/g' {} +
find . -type f -name "*.md" -exec sed -i 's/###### [0-9][0-9] /\n\n&\n\n/g' {} +
find . -type f -name "*.md" -exec sed -i 's/###### [0-9][0-9][0-9] /\n\n&\n\n/g' {} +

# Remove spaces at the beginning of verses
find . -type f -name "*.md" -exec sed -i 's/^ *//g' {} +

# Correct Psalm headings for certain translations
find . -type f -name "*.md" -exec sed -i 's/^Psalm [0-9][0-9][0-9]//' {} +
find . -type f -name "*.md" -exec sed -i 's/^Psalm [0-9][0-9]//' {} +
find . -type f -name "*.md" -exec sed -i 's/^Psalm [0-9]//' {} +

# Create editorial headers
find . -type f -name "*[0-9].md" -exec sed -i '5 s/[A-Za-z0-9].*/\n## &/' {} +             # Make first header if it exists
find . -type f -name "*.md" -exec sed -i 's/\.\"[A-Z0-9].*[A-Za-z0-9]$/\.\"\n\n## &/' {} + # Header following quotes (period)
find . -type f -name "*.md" -exec sed -i 's/## \.\"/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/!\"[A-Z0-9].*[A-Za-z0-9]$/!\"\n\n## &/' {} + # Header following quotes (exclamation mark)
find . -type f -name "*.md" -exec sed -i 's/## !\"/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/?\"[A-Z0-9].*[A-Za-z0-9]$/?\"\n\n## &/' {} + # Header following quotes (question mark)
find . -type f -name "*.md" -exec sed -i 's/## ?\"/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/\.'\''[A-Z0-9].*[A-Za-z0-9]$/\.'\''\n\n## &/' {} + # Header following apostrophes (period)
find . -type f -name "*.md" -exec sed -i 's/## \.'\''/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/!'\''[A-Z0-9].*[A-Za-z0-9]$/!'\''\n\n## &/' {} + # Header following apostrophes (exclamation mark)
find . -type f -name "*.md" -exec sed -i 's/## !'\''/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/?'\''[A-Z0-9].*[A-Za-z0-9]$/?'\''\n\n### &/' {} + # Header following apostrophes (question mark)
find . -type f -name "*.md" -exec sed -i 's/## ?'\''/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/)[A-Z0-9].*[A-Za-z0-9]$/)\n\n## &/' {} + # Header following parentheses
find . -type f -name "*.md" -exec sed -i 's/## )/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/![A-Z0-9].*[A-Za-z0-9]$/!\n\n## &/' {} + # Header following exclamation mark
find . -type f -name "*.md" -exec sed -i 's/## !/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/?[A-Z0-9].*[A-Za-z0-9]$/?\n\n## &/' {} + # Header following exclamation mark
find . -type f -name "*.md" -exec sed -i 's/## ?/## /' {} +
find . -type f -name "*.md" -exec sed -i 's/\.[A-Z0-9].*[A-Za-z0-9]$/\.\n\n## &/' {} +
find . -type f -name "*.md" -exec sed -i 's/## \./## /' {} +

# Delete spaces after text
find . -type f -name "*.md" -exec sed -i 's/ *$//' {} +

# Delete empty headers
find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/#*$//g'

# Add space after
find . -type f -name "*.md" -exec sed -i 's/\.[A-Za-z0-9]/\.\.\.&/' {} + # periods
find . -type f -name "*.md" -exec sed -i 's/\.\.\.\./\. /' {} +
find . -type f -name "*.md" -exec sed -i 's/\.\"[A-Za-z0-9]/\.\.\.&/' {} + # quotation (period)
find . -type f -name "*.md" -exec sed -i 's/\.\.\.\.\"/\.\" /' {} +
find . -type f -name "*.md" -exec sed -i 's/!\"[A-Za-z0-9]/\.\.\.&/' {} + # quotation (exclamation mark)
find . -type f -name "*.md" -exec sed -i 's/\.\.\.!\"/\!\" /' {} +
find . -type f -name "*.md" -exec sed -i 's/?\"[A-Za-z0-9]/\.\.\.&/' {} + # quotation (question mark)
find . -type f -name "*.md" -exec sed -i 's/\.\.\.?\"/?\" /' {} +
find . -type f -name "*.md" -exec sed -i 's/\.'\''[A-Za-z0-9]/\.\.\.&/' {} + # apostrophe (period)
find . -type f -name "*.md" -exec sed -i 's/\.\.\.\.'\''/\.'\'' /' {} +
find . -type f -name "*.md" -exec sed -i 's/!'\''[A-Za-z0-9]/\.\.\.&/' {} + # apostrophe (exclamation mark)
find . -type f -name "*.md" -exec sed -i 's/\.\.\.!'\''/!'\'' /' {} +
find . -type f -name "*.md" -exec sed -i 's/?'\''[A-Za-z0-9]/\.\.\.&/' {} + # apostrophe (question mark)
find . -type f -name "*.md" -exec sed -i 's/\.\.\.?'\''/?'\'' /' {} +
find . -type f -name "*.md" -exec sed -i 's/)[A-Za-z0-9]/\.\.\.&/' {} + # parentheses
find . -type f -name "*.md" -exec sed -i 's/\.\.\.)/) /' {} +

# Add newline betweeen commas and quotation mark
find . -type f -name "*.md" -exec sed -i 's/\,\"[A-Za-z0-9]/\.\.\.&/' {} +
find . -type f -name "*.md" -exec sed -i 's/\.\.\.\,\"/\,\n\"/' {} +

# Add newline after second headers (will be removed later if redundant)
find . -type f -name "*.md" -exec sed -i 's/## .*/&\n/' {} +

# Delete Psalm book headings
find . -type f -name "*.md" -exec sed -i 's/## Book One//' {} +
find . -type f -name "*.md" -exec sed -i 's/## Book Two//' {} +
find . -type f -name "*.md" -exec sed -i 's/## Book Three//' {} +
find . -type f -name "*.md" -exec sed -i 's/## Book Four//' {} +
find . -type f -name "*.md" -exec sed -i 's/## Book Five//' {} +

# Correct newline spacing
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n\n\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n\n\n\n/;ba;}' {} +

# Fix mp3 link
find . -type f -name "*.md" -exec sed -i 's/\. mp3/\.mp3/' {} +

# Fix some superscripts back to verses

find . -type f -name "*.md" -exec sed -i 's/ <sup class=\"versenum mid-line\">/\n\n###### /' {} +
find . -type f -name "*.md" -exec sed -i 's/<\/sup>/\n\n/' {} +
find . -type f -name "*.md" -exec sed -i 's/<sup class=\"versenum mid-line\">/\n\n###### /' {} +
find . -type f -name "*.md" -exec sed -i 's/<\/sup>/\n\n/' {} +

# Remove tags
find . -type f -name "*.md" -exec sed -i 's/<b class="quote">//' {} +
find . -type f -name "*.md" -exec sed -i 's/\*\*//' {} +

# Correct newline spacing
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n\n/;ba;}' {} +

# Make table of contents' empty links be on the same line as the "Start reading" link
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/Start reading]]\n/Start reading]]/;ba;}' {} +
find . -type f -name "*.md" -exec sed -i ':a;$!{N;s/|]]\n/|]]/;ba;}' {} +

# Make first header if it exists
find . -type f -name "*notes.md" -exec sed -i '5 s/[A-Za-z0-9].*/\n## &/' {} +

# Make note files empty
find . -type f -name "*notes.md" -exec sed -i 's/^[^#![].*//g' {} +
find . -type f -name "*notes.md" -exec sed -i 's/###### [0-9]*//g' {} +

# Remove audiobible
find . -type f -name "*notes.md" -exec sed -i 's/.*mp3.*//g' {} +

# Add ' notes' to the title header
find . -type f -name "*notes.md" -exec sed -i '1 s/$/ notes/g' {} +

# Remove Contents
find . -type f -name "*notes.md" -exec sed -i 's/## Contents//g' {} +
find . -type f -name "*notes.md" -exec sed -i 's/\[\[.*notes\]\]//g' {} +

# Change Related notes
find . -type f -name "*notes.md" -exec sed -i 's/|Previous/-notes|Previous/g' {} +
find . -type f -name "*notes.md" -exec sed -i 's/|Next/-notes|Next/g' {} +

# Correct newline spacing
find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n\n/;ba;}' {} +
find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n/\n\n\n\n/;ba;}' {} +
find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/\n\n\n\n\n\n\n/\n\n\n\n/;ba;}' {} +

# Add space after headers
find . -type f -name "*notes.md" -exec sed -i 's/^## .*/&\n\n- [ ] /g' {} +

# Remove 1 headers
find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/## 1\n\n//;ba;}' {} +

# Fix Related spacing
# find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/\n\n- [ ] \n\n\[\[/\n\n\[\[/;ba;}' {} +
find . -type f -name "*notes.md" -exec sed -i ':a;$!{N;s/## Related\n\n- \[ \] /## Related/;ba;}' {} +

echo "Download complete. Markdown files ready for Obsidian import."
