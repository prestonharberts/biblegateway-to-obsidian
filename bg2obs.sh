#!/bin/bash
source config.sh

if [[ $primary_translation == "true" ]]; then
  source bin/primary-outlines.sh
  if [[ $enable_audio_bible == "true" ]]; then
    source bin/audio-outlines.sh
  fi
  source bin/primary-reading.sh
else
  source bin/secondary-outlines.sh
  if [[ $enable_audio_bible == "true" ]]; then
    source bin/audio-outlines.sh
  fi
  source bin/secondary-reading.sh
fi

source bin/cleanup.sh
