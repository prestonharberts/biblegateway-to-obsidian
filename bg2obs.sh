#!/bin/bash

source config

if [[ $primary_translation == "true" ]]; then

  source make-reading-outlines

  if [[ $enable_audio_bible == "true" ]]; then
    source make-audio-outlines
  fi

  source primary

else

  if [[ $enable_audio_bible == "true" ]]; then
    source make-audio-outlines
  fi

  source secondary
fi

source cleanup

if [[ $verbose == "true" ]]; then
  printf "Markdown files ready for Obsidian.\n"
fi
