#!/bin/zsh

RAW_TEMPERATURE=$(cat /sys/class/thermal/thermal_zone0/temp)
TEMPERATURE=$(echo "scale=0; ${RAW_TEMPERATURE}/1000"|bc -l)
declare -A MARKS;

MARKS=(
    ["empty"]=""
    ["low"]=""
    ["half"]=""
    ["high"]=""
    ["full"]=""
)

case "${TEMPERATURE}" in
    <-39>   )    ICON="$MARKS[empty]"
                 COLOR="#ffffff" ;;
    <40-49> )    ICON="$MARKS[low]"
                 COLOR="#00ff00";;
    <50-69> )    ICON="$MARKS[half]"
                 COLOR="#ffff00";;
    <60-79> )    ICON="$MARKS[high]"
                 COLOR="#ff9900";;
    <80->   )    ICON="$MARKS[full]"
                 COLOR="#ff0000";;
esac

echo -n "\"full_text\": \"${ICON}.${TEMPERATURE}℃\", \"color\": \"${COLOR}\""
