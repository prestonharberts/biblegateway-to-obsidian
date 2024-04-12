#!/bin/bash
source config.sh

if [[ $main_translation == "true" ]]; then
  source bin/main-outlines.sh
  if [[ $enable_audio_bible == "true" ]]; then
    source bin/audio-outlines.sh
  fi
  source bin/main-reading.sh
elif [[ $main_translation == "false" ]]; then
  source bin/other-outlines.sh
  if [[ $enable_audio_bible == "true" ]]; then
    source bin/audio-outlines.sh
  fi
  source bin/other-reading.sh
fi

source bin/cleanup.sh
