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