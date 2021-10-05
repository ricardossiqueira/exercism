#!/usr/bin/env bash

# The following comments should help you get started:
# - Bash is flexible. You may use functions or write a "raw" script.
#
# - Complex code can be made easier to read by breaking it up
#   into functions, however this is sometimes overkill in bash.
#
# - You can find links about good style and other resources
#   for Bash in './README.md'. It came with this exercise.
#
#   Example:
#   # other functions here
#   # ...
#   # ...
#
#   main () {
#     # your main function code here
#   }
#
#   # call main with all of the positional arguments
#   main "$@"
#
# *** PLEASE REMOVE THESE COMMENTS BEFORE SUBMITTING YOUR SOLUTION ***

hamming () {
  l=$2;
  r=$1;
  d=0;

  for i in $(seq 0 ${#l}); do

    if [[ "$@" == "" ]]; then
      echo "Usage: hamming.sh <string1> <string2>";
      exit 2;
    fi;

    if [[ ${#l} != ${#r} ]]; then

      if [[ $l == "" && $r != "" ]]; then
        echo "Usage: hamming.sh <string1> <string2>";
        exit 2;
      fi;

      echo "strands must be of equal length";
      exit 2;
    fi;

    if [[ ${l[@]:$i:1} != ${r[@]:$i:1} ]]; then
      d=$(echo "$d + 1" | bc);
    fi;
  done;

  echo $d;
  exit;
}

hamming "$@"