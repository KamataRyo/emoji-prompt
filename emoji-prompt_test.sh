#!/bin/bash

set -eu
source "emoji-prompt.sh"
echo "Testing emoji-prompt.sh..."


echo "#1:It should be an error without arguments."
STDOUT=$(__emoji_pt)
STDERR=$(__emoji_pt 2>&1) # execute
if [[ "$STDERR" != "" && "$STDOUT" != "$STDERR" ]]; then
  echo "    =>success"
else
  echo "    =>failure"
  exit 1
fi

echo "#2:It should be an error with single argument."
STDOUT=$(__emoji_pt arg)
STDERR=$(__emoji_pt arg 2>&1) # execute
if [[ "$STDERR" != "" && "$STDOUT" != "$STDERR" ]]; then
  echo "    =>success"
else
  echo "    =>failure"
  exit 1
fi


echo "#3:It should make emoji stdout with 2 arguments."
STDOUT=$(__emoji_pt arg1 arg2)
if [[ ${#STDOUT} == 1 ]]; then
  echo "    =>success"
else
  echo "    =>failure"
  exit 1
fi

echo "#4:It should make emoji offset with 3rd argument."
STDOUT1=$(__emoji_pt arg1 arg2)
for (( i = 1; i < 300; i++ )); do
  echo "    trial-$i"
  STDOUT2=$(__emoji_pt arg1 arg2 $i)
  if [[ ${#STDOUT1} == 1 && ${#STDOUT2} == 1 && "$STDOUT1" != "$STDOUT2" ]]; then
    echo "        =>success"
  else
    echo "        =>failure"
    exit 1
  fi
done

# exit test
exit 0
