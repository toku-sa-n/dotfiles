#!/bin/zsh

USING_MEMORY=`free|grep Mem|awk '{print $3}'`
FULL_MEMORY=`free|grep Mem|awk '{print $2}'`

USING_MEMORY_READABLE=`free -h|grep Mem|awk '{print $3}'`
FULL_MEMORY_READABLE=`free -h|grep Mem|awk '{print $2}'`

USE_RATE=`echo "scale=2; 100*${USING_MEMORY}/${FULL_MEMORY}"|bc -l`
BLOCK_NUM=`echo "scale=0; ${USE_RATE}/10+1"|bc`
SPACE_NUM=`echo "10-${BLOCK_NUM}"|bc`

BLOCKS=`seq ${BLOCK_NUM}|tr -d '0\n'|tr '[1-9]' '@'`
SPACES=`seq ${SPACE_NUM}|tr -d '0\n'|tr '[1-9]' ' '`
BAR="${BLOCKS}${SPACES}"

case "${BLOCKS}" in
    <1-2>  ) COLOR= "#ccccff" ;;
    <3-4>  ) COLOR= "#00ff00" ;;
    <5-6>  ) COLOR= "#ffff00" ;;
    <7-8>  ) COLOR= "#ff9900" ;;
    <->    ) COLOR= "#ff0000" ;;
esac
echo -n "\"full_text\": \"${USING_MEMORY_READABLE} / ${FULL_MEMORY_READABLE} [${BAR}]  ${USE_RATE}%\", \"color\": \"${COLOR}\""
