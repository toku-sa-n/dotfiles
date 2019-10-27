#!/bin/zsh

past_date=$(sed '1!d' ./records.txt)
count_problem=$(sed '2!d' ./records.txt)

diff_date=$(( ($(date +'%s') - $past_date)/86400))

count_problem=$(( $count_problem+4*$diff_date ))

echo "残り${count_problem}問"
shuf competitive_programming_problem.txt|head -n1|xargs firefox &

if [[ $count_problem -gt 0 ]];
then
    ((count_problem--))
fi

if [[ $diff_date -gt 0 ]]; then
    date +'%s' > records.txt
else
    echo $past_date > records.txt
fi
echo $count_problem >> records.txt
