#!/bin/bash

# bash to text
# bash2txt.bash
# MattMizusawa 2024/03/ Ver.0.01

find ./github -name '*.bash' -type f \
| perl -wnlE '/(\S+).md/ and say "$1.bash $1.txt"' \
| xargs -n2 mv
