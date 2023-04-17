# BibleGateway-to-Obsidian

## Disclaimers

This script is set to download the [ESV Bible](https://www.esv.org/translation/). Before using this script, please make sure you own a copy of the ESV. Although this program does not make use of it, it is right to legally own it before making a copy of it using jgclark's script.

Do not distribute your files once generated because they are subject to the [ESV's copyright standards](https://www.crossway.org/permissions/). **All files are only intended for personal use.** This is not affiliated to, or approved by, BibleGateway.com or Crossway. I make no guarantee regarding the usage of the script, it is at your own discretion.

## About

This script adapts [jgclark's BibleGateway-to-Markdown](https://github.com/jgclark/BibleGateway-to-Markdown) script and is forked from [selfire1's BibleGateway-to-Obsidian](https://github.com/selfire1/BibleGateway-to-Obsidian) to export the ESV for use in [Obsidian](https://obsidian.md/). It accompanies the [ESV Hear the Word Audio Bible](https://www.crossway.org/bibles/esv-hear-the-word-audio-bible-610-dl/) that can be listened to from Obsidian when downloaded.

I have not tested this script with other translations, as I have thouroughly tested regular expressions to be used only on the ESV.

What the script does is fetch the text from [Bible Gateway](https://www.biblegateway.com/) and save it as a formatted markdown file. Each chapter is saved as two files (one for reading and another without text for taking notes in). Navigation between files is located at the bottom and is automatically created. All the chapter reading and table of contents are saved to a folder named `bible`, and all note-taking files are saved to another folder named `bible-notes`.

This script is intended to be very simple to run, but it comes at the cost of customizability. To adapt it to your taste, you may have to modify `bg2obs.sh` or fork this script.

## Installation

This script is intended to be run in Linux, but it is able to be run on macOS and Windows with some setup that I am unable to provide as I do not use either.

Download [jgclark's BibleGateway-to-Markdown](https://github.com/jgclark/BibleGateway-to-Markdown) and copy `bg2md.rb` to `biblegateway-to-obsidian`. Next, install RubyGems and the necessary gems with the following line (change the installation line to use your correct package manager; I use Fedora so I use `dnf`):

```
sudo dnf install rubygems && sudo gem install colorize optparse clipboard
```

Next, give execution rights to both scripts using the following command:

```
chmod u+x bg2md.rh
chmod u+x bg2obs.sh
```

## Usage

Once you are in the directory containing the script, run `./bg2obs.sh`. This will run the bash script. Do not copy anything while the program is running. See Troubleshooting, below.

## Troubleshooting

Below are some issues that may happen when using the script. Create an [issue](https://github.com/prestonharberts/biblegateway-to-obsidian/issues) on GitHub if any other issues are found.

### Text inside file is duplicated

I am unsure what causes this, but it is fixed when run again. Only make sure that you do not highlight text (on Linux, this copies to a clipboard to be pasted with a middle-mouse click) or copy text. jgclark's script makes use of the system's clipboard when fetching text from BibleGateway. When the program is running, I leave my computer alone and find something else to do in the meantime.

## Credits

Thank you [selfire](https://github.com/selfire1) and [jgclark](https://github.com/jgclark) for your work putting these scripts together. This fork could not have been possible without you two. selfire1's patreon can be found at joschua if you feel inclined to support him.
