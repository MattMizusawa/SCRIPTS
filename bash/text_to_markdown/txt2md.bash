#!/bin/bash

# Text to Markdown
# txt2md.bash
# MattMizusawa 2024/03/21 Ver.0.01

find ./github -name '*.txt' -type f \
| perl -wnlE '/(\S+).txt/ and say "$1.txt $1.md"' \
| xargs -n2 mv