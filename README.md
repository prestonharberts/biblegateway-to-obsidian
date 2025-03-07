# BibleGateway-to-Obsidian

This script downloads the Bible in Markdown files along with empty note-taking files, all to be imported into [Obsidian](https://obsidian.md/). By default, it downloads the [NET translation](https://www.biblegateway.com/versions/New-English-Translation-NET-Bible/), and certain other translations are also supported. This script adapts [jgclark's BibleGateway-to-Markdown](https://github.com/jgclark/BibleGateway-to-Markdown) script and is forked from [selfire1's BibleGateway-to-Obsidian](https://github.com/selfire1/BibleGateway-to-Obsidian) to export the Bible for use in Obsidian.

> 🌟 **Included to download in this repo is the NET translation** 🌟 with my recommended configuration, ready to be imported into an Obsidian vault. This is made possible by the [NET translation team's generous copyright](https://netbible.com/copyright/) which allows me to redistribute it for free to you all.

The script fetches text from [Bible Gateway](https://www.biblegateway.com/) and saves it as a markdown file. Each chapter is saved as two files (one for reading and another without text so that you can take notes). A navigation bar is located at the top and bottom of each file for navigating chapters. All Bible chapters are saved to a folder named `Scripture`, note-taking files are saved to another folder named `Notes`, and outline files are stored in `Outlines`.

This script is intended to be very simple to run, and is customizable from the `config` file. To adapt it even more to your liking, you can modify `bg2ob` or fork this script.

## Copyright

By default, this program downloads the NET Bible translation, but it can be changed. Depending on the translation's copyright, once generated, rights to distribute vary because they are subject to the translation's copyright standards. This is not affiliated or approved by BibleGateway.com or any publisher. I make no guarantee regarding the usage of the script, it is at your own discretion.

## Installation

This script is intended to be run in Linux, but it is able to be run on macOS and Windows with some setup that I am unable to provide as I do not currently use either.

[Download my fork of jgclark's BibleGateway-to-Markdown](https://github.com/prestonharberts/biblegateway-to-markdown) and copy `bg2md` to this program's folder. Next, install RubyGems and the necessary gems with the following line (change the package manager to work with your Linux distribution; I use Fedora so I use `dnf`):

```
sudo dnf install rubygems
sudo gem install colorize optparse clipboard
```

Next, give execution rights to both scripts using the following command:

```
chmod u+x bg2md bg2ob
```

## Usage

Once you are in the directory containing the script, run `./bg2ob`. This will run the bash script. Do not copy anything while the program is running. See the Troubleshooting, further below.

### Manual changes

Certain manual changes must be made to the Bible files that cannot be done automatically (make sure to check the note files for these chapters too):

- If wanted, add Psalm introductions and introductions present in other books.
- If wanted, add the Hebrew letters to Psalms and other Scriptures that use them as headings (add them as level 4).
- If wanted, bold OT references in the NT.
- If wanted, add editorial footnotes and cross-references.

#### NKJV specific changes

- The first header for 1 Sam. 28, 2 Chron. 5, 2 Cor. 7, 2 Kings 7, 2 Sam. 19, Dan. 11, Eccles. 8, and Zeph. 1 need to be removed in all Scripture and Note files.
- Dan. 4, Ezra 5, and Jer. 29 have a level 2 heading that has junk HTML in it. Delete this line manually in each file from another text editor because my CSS hides H6. Make sure to also insert this line (and the blank line too) where each header is if a new paragraph starts or a poetry verse ends:

```
<div class=paragraph-break></div>

```

- Remove the above HTML in Rev. 19 where it should say `KING OF KINGS AND\nLORD OF LORDS`
- 2 Chron. 36:22 has some junk HTML

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

I am unsure what causes this, but it is fixed when the Bible folder is deleted and the program is run again. Only make sure that you do not copy text or highlight text on Linux (this copies to a clipboard to be pasted with a middle-mouse click). jgclark's script makes use of the system's clipboard when fetching text from BibleGateway. When the program is running, I leave my computer alone and find something else to do in the meantime.

## Credits

Thank you [selfire](https://github.com/selfire1) and [jgclark](https://github.com/jgclark) for your work putting these scripts together. This fork could not have been possible without you two. selfire1's patreon can be found at joschua if you feel inclined to support him.
