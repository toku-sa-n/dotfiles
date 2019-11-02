#!/bin/zsh

RECORD_FILE=$HOME/.competitive_programming_record

past_date=$(sed '1!d' $RECORD_FILE)
count_problem=$(sed '2!d' $RECORD_FILE)

diff_date=$(( ($(date +'%s') - $past_date)/86400))

count_problem=$(( $count_problem+4*$diff_date ))

shuf competitive_programming_problem.txt|grep -v "\A#"|head -n1|xargs firefox &

if [[ $count_problem -gt 0 ]];
then
    ((count_problem--))
fi

echo "残り${count_problem}問"

if [[ $diff_date -gt 0 ]]; then
    date +'%s' > $RECORD_FILE
else
    echo $past_date > $RECORD_FILE
fi
echo $count_problem >> $RECORD_FILE
