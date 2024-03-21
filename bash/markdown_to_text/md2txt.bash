#!/bin/bash

# Markdown to Text
# md2txt.bash
# MattMizusawa 2024/03/21 Ver.0.01

find ./github -name '*.md' -type f \
| perl -wnlE '/(\S+).md/ and say "$1.md $1.txt"' \
| xargs -n2 mv