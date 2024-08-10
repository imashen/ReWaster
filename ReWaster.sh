#!/bin/bash

REFERER=${REFERER}
URL=${URL}
THREAD=${THREAD:-20} # 默认设置为20个线程

request() {
    while true
    do
        curl -s -o /dev/null -H "Referer: $REFERER" "$URL"
    done
}

for i in $(seq 1 $THREAD)
do
    (request &)
done

wait