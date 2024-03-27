#!/bin/bash

# Text to bash
# txt2bash.bash
# MattMizusawa 2024/03/ Ver.0.01

find ./github -name '*.txt' -type f \
| perl -wnlE '/(\S+).txt/ and say "$1.txt $1.bash"' \
| xargs -n2 mv
