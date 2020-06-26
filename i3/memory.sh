#!/bin/zsh
# use zsh to use zsh functions.

readonly USING_MEMORY=$(free|grep Mem|awk '{print $3}')
readonly FULL_MEMORY=$(free|grep Mem|awk '{print $2}')

readonly USING_MEMORY_READABLE=$(free -h|grep Mem|awk '{print $3}')
readonly FULL_MEMORY_READABLE=$(free -h|grep Mem|awk '{print $2}')

readonly USE_RATE=$(echo "scale=2; 100*${USING_MEMORY}/${FULL_MEMORY}"|bc -l)
readonly BLOCK_NUM=$(echo "scale=0; ${USE_RATE}/10+1"|bc)
readonly SPACE_NUM=$(echo "10-${BLOCK_NUM}"|bc)

readonly BLOCKS=$(seq ${BLOCK_NUM}|tr -d '0\n'|tr '[1-9]' '@')
readonly SPACES=$(seq ${SPACE_NUM}|tr -d '0\n'|tr '[1-9]' ' ')
readonly BAR="${BLOCKS}${SPACES}"

color=""
case "${BLOCK_NUM}" in
    <1-2>  ) color="#FFFFFF" ;;
    <3-4>  ) color="#00FF00" ;;
    <5-6>  ) color="#FFFF00" ;;
    <7-8>  ) color="#FF9900" ;;
    <->    ) color="#FF0000" ;;
esac

echo "\"full_text\": \"${USING_MEMORY_READABLE} / ${FULL_MEMORY_READABLE} [${BAR}]  ${USE_RATE}%\", \"color\": \"${color}\""
