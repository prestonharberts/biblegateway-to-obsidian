# Renaming audio Bible files
<div class="break"></div>
## ESV Hear The Word Audio Bible
<div class="break"></div>
Lowercase, hyphenated short title:
<div class="break"></div>
```
mv <i>/</i> .
rm <i>/00</i>
rm 00</i>
rm esv-hear-the-word-audio-bible-</i> -r
rename 's/[0-9]{2}-[0-9]{3} //g' </i>
rm Introduction.mp3
rename 'y/A-Z/a-z/' </i>
rename 's/ /-/g' </i>
mv obadiah.mp3 obadiah-1.mp3
mv philemon.mp3 philemon-1.mp3
mv 2-john.mp3 2-john-1.mp3
mv 3-john.mp3 3-john-1.mp3
mv jude.mp3 jude-1.mp3
rename 's/\.mp3/-esv.mp3/g' </i>
```
<div class="break"></div>
## CSB
<div class="break"></div>
Lowercase, hyphenated short title:
<div class="break"></div>
```
wip
```
<div class="break"></div>
## AudioTreasure King James Version
<div class="break"></div>
Free download: https://audiotreasure.com/AT_KJVA.htm
<div class="break"></div>
Lowercase, hyphenated short title:
<div class="break"></div>
```
mkdir audio
mv KJV_<i>/</i> audio
cd audio
rename 's/^[0-9]{2}_//g' </i>
rename 's/^1/1 /g' </i>
rename 's/^2/2 /g' </i>
rename 's/^3/3 /g' </i>
./config
rm ./bible -r
for ((book = 0; book < book_max; book++)); do
 rename "s/${short_title_arr[book]}/${short_title_arr[book]} /" </i>
done
rename 's/Psalms/psalm/g' </i>
rename 'y/A-Z/a-z/' </i>
rename 's/ /-/g' </i>
rename 's/_/-/g' </i>
rename 's/-[0]{1,2}/ /g' </i>
mv philemon.mp3 philemon-1.mp3
mv 2-john.mp3 2-john-1.mp3
mv 3-john.mp3 3-john-1.mp3
mv jude.mp3 jude-1.mp3
```
<div class="break"></div>
Run the following on the dramatized version:
<div class="break"></div>
```
rename 's/thess/thessalonians/g' </i>
rename 's/daniell/daniel/g' </i>
rename 's/cor/corinthians/g' </i>
rename 's/prov/proverbs/g' </i>
rename 's/gal/galatians/g' </i>
rename 's/\.mp3/-kjv.mp3/g' </i>
```
