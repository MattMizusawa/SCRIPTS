#!/bin/bash

# Text to Markdown
# txt2md.bash
# MattMizusawa 2024/03/27 Ver.0.02

declare -r TARGET_DIR="/mnt/sd/github"

find $TARGET_DIR -name '*.txt' -type f \
| perl -wnlE '/(\S+).txt/ and say "$1.txt $1.md"' \
| xargs -n2 mv