#!/bin/bash

# Markdown to Text
# md2txt.bash
# MattMizusawa 2024/03/27 Ver.0.02

declare -r TARGET_DIR="/mnt/sd/github"

find $TARGET_DIR -name '*.md' -type f \
| perl -wnlE '/(\S+).md/ and say "$1.md $1.txt"' \
| xargs -n2 mv