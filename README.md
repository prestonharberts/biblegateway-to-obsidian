# BibleGateway-to-Obsidian

## Disclaimers

This script is set to download the [ESV Bible](https://www.esv.org/translation/), but it can be changed. Before using this script, please make sure you own a copy of the ESV, even if this program does not use it, it is right to legally own it before making a copy of it using jgclark's script.

Do not distribute your files once generated because they are subject to the [ESV's copyright standards](https://www.crossway.org/permissions/). **All files are only intended for personal use.** This is not affiliated or approved by BibleGateway.com or Crossway. I make no guarantee regarding the usage of the script, it is at your own discretion.

## About

This script adapts [jgclark's BibleGateway-to-Markdown](https://github.com/jgclark/BibleGateway-to-Markdown) script and is forked from [selfire1's BibleGateway-to-Obsidian](https://github.com/selfire1/BibleGateway-to-Obsidian) to export the ESV for use in [Obsidian](https://obsidian.md/). It accompanies the [ESV Hear the Word Audio Bible](https://www.crossway.org/bibles/esv-hear-the-word-audio-bible-610-dl/) that can be listened to from Obsidian when downloaded.

Other translations along with their MP3 audio bibles may work, but I have not tested very many.

The script fetches text from [Bible Gateway](https://www.biblegateway.com/) and saves it as a markdown file. Each chapter is saved as two files, one for reading and another without text so that you can take notes in. A navigation bar is located at the bottom of each file for navigating files and is automatically created. All the chapter reading and table of contents are saved to a folder named `bible`, and all note-taking files are saved to another folder named `bible-notes`.

This script is intended to be very simple to run, and is customizable from the `config` file. To adapt it to your taste, you can modify `bg2obs.sh` or fork this script.

## Installation

This script is intended to be run in Linux, but it is able to be run on macOS and Windows with some setup that I am unable to provide as I do not use either.

Download my fork of [jgclark's BibleGateway-to-Markdown](https://github.com/prestonharberts/biblegateway-to-markdown) and copy `bg2md.rb` to `biblegateway-to-obsidian/bin`. Next, install RubyGems and the necessary gems with the following line (change the installation line to use your correct package manager; I use Fedora so I use `dnf`):

```
sudo dnf install rubygems && sudo gem install colorize optparse clipboard
```

Next, give execution rights to both scripts using the following command:

```
chmod u+x bg2md.rb bg2obs.sh
```

## Usage

Once you are in the directory containing the script, run `./bg2obs.sh`. This will run the bash script. Do not copy anything while the program is running. See Troubleshooting, below.

### Manual changes

Certain manual changes must be made to the Bible files that cannot be done otherwise:

- In Mark 16, there is an editorial note that results in headers being misplaced, so remove the note, create the header on the same line, correct Mark 16:9, and remove the brackets from Mark 16:20. Do the same for the notes file
- In John chapters 7-8, there is an editorial note that results in headers being misplaced, so remove the note, correct John 7:53, fix the header, correct John 8:1, remove the brackets from John 8:11, and create the header in that verse as well by giving it a new line and placing two pound symbols before it and a space like this: "## ". Do the same for the notes file and also create the same header that was made in the reading file in the notes file

## Troubleshooting

Below are some issues that may happen when using the script. Create an [issue](https://github.com/prestonharberts/biblegateway-to-obsidian/issues) on GitHub if any other issues are found.

### Text inside file is duplicated

I am unsure what causes this, but it is fixed when run again. Only make sure that you do not highlight text (on Linux, this copies to a clipboard to be pasted with a middle-mouse click) or copy text. jgclark's script makes use of the system's clipboard when fetching text from BibleGateway. When the program is running, I leave my computer alone and find something else to do in the meantime.

## Credits

Thank you [selfire](https://github.com/selfire1) and [jgclark](https://github.com/jgclark) for your work putting these scripts together. This fork could not have been possible without you two. selfire1's patreon can be found at joschua if you feel inclined to support him.
