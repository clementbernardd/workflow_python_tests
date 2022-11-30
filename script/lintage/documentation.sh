#!/bin/bash

output=$($PYTHON pylint --disable=all --enable=C0111 ${PATH_TO_CODE})
echo "DOCUMENTATION : $output"
sleep 10
score=$( $PYTHON pylint --disable=all --enable=C0111 ${PATH_TO_CODE} | tail -n2 | head -n1 | cut -f7 -d " " | cut -f1 -d/)
echo "documentation_score=$score" >> $GITHUB_OUTPUT
echo "SCORE PYLINT : ${score} | ACCEPTABLE SCORE : ${DOCUMENTATION_SCORE}"
condition=`echo "$score>=$DOCUMENTATION_SCORE" | bc -l`
if [[ $condition == "1" ]]; then
  echo "PYLINT SCORE ACCEPTABLE"
  exit 0
else
  echo "PYLINT SCORE NOT ACCEPTABLE"
  exit 1
fi