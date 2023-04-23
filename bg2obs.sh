#!/bin/bash

source config

if [[ $primary_translation == "true" ]]; then
  source make-outlines
  source primary
else
  source secondary
fi

source cleanup

if [[ $verbose == "true" ]]; then
  printf "Markdown files ready for Obsidian.\n"
fi
