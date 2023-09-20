#!/bin/bash

source config.sh

if [[ $primary_translation == "true" ]]; then

  source bin/make-primary-reading-outlines.sh

  if [[ $enable_audio_bible == "true" ]]; then
    source bin/make-audio-outlines.sh
  fi

  source bin/primary.sh

else

  source bin/make-secondary-reading-outlines.sh

  if [[ $enable_audio_bible == "true" ]]; then
    source bin/make-audio-outlines.sh
  fi

  source bin/secondary.sh
fi

source bin/cleanup.sh

if [[ $verbose == "true" ]]; then
  printf "Markdown files ready for Obsidian.\n"
fi
