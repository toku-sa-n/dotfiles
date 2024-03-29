#!/bin/zsh

# use zsh to use zsh functions.
readonly RAW_TEMPERATURE=$(cat /sys/class/thermal/thermal_zone0/temp)
readonly TEMPERATURE=$(printf "%.0f\n" $(sensors -j|jq '."coretemp-isa-0000"."Package id 0"."temp1_input"'))
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
                 COLOR="#FFFFFF" ;;
    <40-49> )    ICON="$MARKS[low]"
                 COLOR="#00FF00";;
    <50-69> )    ICON="$MARKS[half]"
                 COLOR="#FFFF00";;
    <60-79> )    ICON="$MARKS[high]"
                 COLOR="#FF9900";;
    <80->   )    ICON="$MARKS[full]"
                 COLOR="#FF0000";;
esac

echo "\"full_text\": \"${ICON}.${TEMPERATURE}℃\", \"color\": \"${COLOR}\""
