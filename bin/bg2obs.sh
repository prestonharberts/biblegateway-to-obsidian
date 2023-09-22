#!/bin/bash

source config.sh

if [[ $primary_translation == "true" ]]; then

  source make-primary-reading-outlines.sh

  if [[ $enable_audio_bible == "true" ]]; then
    source make-audio-outlines.sh
  fi

  source primary.sh

else

  source make-secondary-reading-outlines.sh

  if [[ $enable_audio_bible == "true" ]]; then
    source make-audio-outlines.sh
  fi

  source secondary.sh
fi

source cleanup.sh

if [[ $verbose == "true" ]]; then
  printf "Markdown files ready for Obsidian.\n"
fi
