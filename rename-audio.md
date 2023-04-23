# Renaming audio Bible files

## ESV Hear The Word Audio Bible

Lowercase, hyphenated short title:

```
mv */* .
rm */00*
rm 00*
rm esv-hear-the-word-audio-bible-* -r
rename 's/[0-9]{2}-[0-9]{3} //g' *
rm Introduction.mp3
rename 'y/A-Z/a-z/' *
rename 's/ /-/g' *
mv obadiah.mp3 obadiah-1.mp3
mv philemon.mp3 philemon-1.mp3
mv 2-john.mp3 2-john-1.mp3
mv 3-john.mp3 3-john-1.mp3
mv jude.mp3 jude-1.mp3
rename 's/\.mp3/-esv.mp3/g' *
```

## AudioTreasure King James Version

Free download: https://audiotreasure.com/AT_KJVA.htm

Lowercase, hyphenated short title:

```
mkdir audio
mv KJV_*/* audio
cd audio
rename 's/^[0-9]{2}_//g' *
rename 's/^1/1 /g' *
rename 's/^2/2 /g' *
rename 's/^3/3 /g' *
./config
rm ./bible -r
for ((book = 0; book < book_max; book++)); do
    rename "s/${short_title_arr[book]}/${short_title_arr[book]} /" *
done
rename 's/Psalms/psalm/g' *
rename 'y/A-Z/a-z/' *
rename 's/ /-/g' *
rename 's/_/-/g' *
rename 's/-[0]{1,2}/ /g' *
mv philemon.mp3 philemon-1.mp3
mv 2-john.mp3 2-john-1.mp3
mv 3-john.mp3 3-john-1.mp3
mv jude.mp3 jude-1.mp3
```

Run the following on the dramatized version:

```
rename 's/thess/thessalonians/g' *
rename 's/daniell/daniel/g' *
rename 's/cor/corinthians/g' *
rename 's/prov/proverbs/g' *
rename 's/gal/galatians/g' *
```
