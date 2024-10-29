# BibleGateway-to-Obsidian

## Disclaimers

This script is set to download the [NKJV Bible](https://www.biblegateway.com/versions/New-King-James-Version-NKJV-Bible/), but it can be changed. Before using this script, please make sure you own some sort of copy of the NKJV. Even if this program does not make actual use of it, it is right to legally own it before making a copy of it using jgclark's script.

Do not distribute your files once generated because they are subject to the [NKJV's copyright standards](https://www.thomasnelson.com/about-us/permissions/). **All files are only intended for personal use.** This is not affiliated or approved by BibleGateway.com or Crossway. I make no guarantee regarding the usage of the script, it is at your own discretion.

## About

This script adapts [jgclark's BibleGateway-to-Markdown](https://github.com/jgclark/BibleGateway-to-Markdown) script and is forked from [selfire1's BibleGateway-to-Obsidian](https://github.com/selfire1/BibleGateway-to-Obsidian) to export the NKJV for use in [Obsidian](https://obsidian.md/). It accompanies the [NKJV Voice Only Audio Bible Audiobook](https://www.christianbook.com/apps/product?item_no=DA25011-CP&event=ESRCG) that can be listened to from Obsidian when downloaded.

Other translations along with their MP3 audio bibles may work, but I have not tested very many.

The script fetches text from [Bible Gateway](https://www.biblegateway.com/) and saves it as a markdown file. Each chapter is saved as two files, one for reading and another without text so that you can take notes in. A navigation bar is located at the bottom of each file for navigating files and is automatically created. All the chapter reading and table of contents are saved to a folder named `bible`, and all note-taking files are saved to another folder named `bible-notes`.

This script is intended to be very simple to run, and is customizable from the `config` file. To adapt it to your taste, you can modify `bg2ob` or fork this script.

## Installation

This script is intended to be run in Linux, but it is able to be run on macOS and Windows with some setup that I am unable to provide as I do not use either.

Download my fork of [jgclark's BibleGateway-to-Markdown](https://github.com/prestonharberts/biblegateway-to-markdown) and copy `bg2md.rb` to this program's folder. Next, install RubyGems and the necessary gems with the following line (change the installation line to use your correct package manager; I use Fedora so I use `dnf`):

```
sudo dnf install rubygems && sudo gem install colorize optparse clipboard
```

Next, give execution rights to both scripts using the following command:

```
chmod u+x bg2md.rb bg2ob
```

## Usage

Once you are in the directory containing the script, run `./bg2ob`. This will run the bash script. Do not copy anything while the program is running. See Troubleshooting, below.

### Manual changes

Certain manual changes must be made to the Bible files that cannot be done otherwise (make sure to check the note files for these chapters too):

- Delete extra text in Mark 16:8, and fix headings.
- Delete extra headings in John 7:52-53 and 8:1. Remove the newline in John 8:11.
- If wanted, add Psalm introductions and introductions present in other books.
- If wanted, add the Hebrew letters to Psalms and other Scriptures that use them as headings (add them as level 4).
- If wanted, indent poetry by putting a '>' at the beginning of each line to indent (same as toggling blockquotes). Make sure to add a space below blockquote if the next line is a continuation of the same verse, or else it will be shown as a blockquote in preview mode, too.
- If wanted, bold OT references in the NT.
- If wanted, add editorial footnotes and cross-references.

#### NKJV specific changes

- A line in `bg2md` needs to be to correctly capitalize Lord to LORD when needed. Change line 371 to `passage.gsub!(%r{<span style="font-variant: small-caps" class="small-caps divine-name">Lord</span>}, 'LORD')`
- The first header for 1 Sam. 28, 2 Chron. 5, 2 Cor. 7, 2 Kings 7, 2 Sam. 19, Dan. 11, Eccles. 8, and Zeph. 1 need to be removed in all Scripture and Note files.

#### CSB specific changes

- Song of Songs editorial headings do not get added for some reason
- Ezra 2 skips verses 3-35 for some reason.
- Neh 7 Skips verses 40-42 for some reason.
- Ensure there are no underscores in Matthew 27:46. Replace any with an asterisk, and make sure the italics do not enclose any punctuation.

#### LSB specific changes

- Remove '<div class ="left-1">' in Ezra 6.
- In Psalm 112, the line before verse 1 should be cut and paste to the end of Psalm 111 and corrected. If wanted (this part is optional), create two level 2 headings at before the first heading: Sin and Tav. Now, separate the first half (the half before and including the semicolon) of the existing faulty heading to be under Sin, and the other half (the half after the semicolon) to be under Tav.
- In Psalm 113, the line before verse 1 should be cut and paste to the end of Psalm 112 and corrected. If wanted (this part is optional), create two level 2 headings at before the first heading: Shin (make sure it is Shin and not Sin like the previous change we made) and Tav. Now, separate the first half (the half before and including the semicolon) of the existing faulty heading to be under Shin, and the other half (the half after the semicolon) to be under Tav.
- Remove newline in Nehemiah 12:42.
- Psalm 111:10 is messing over half the text.
- Replace all occurences of 'E' with 'Ē' in Daniel 5 verses 25, 26, 27, and 28.

## Troubleshooting

Below are some issues that may happen when using the script. Create an [issue](https://github.com/prestonharberts/biblegateway-to-obsidian/issues) on GitHub if any other issues are found.

### Text inside file is duplicated

I am unsure what causes this, but it is fixed when run again. Only make sure that you do not highlight text (on Linux, this copies to a clipboard to be pasted with a middle-mouse click) or copy text. jgclark's script makes use of the system's clipboard when fetching text from BibleGateway. When the program is running, I leave my computer alone and find something else to do in the meantime.

## Credits

Thank you [selfire](https://github.com/selfire1) and [jgclark](https://github.com/jgclark) for your work putting these scripts together. This fork could not have been possible without you two. selfire1's patreon can be found at joschua if you feel inclined to support him.
