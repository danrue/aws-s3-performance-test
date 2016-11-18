#!/bin/bash

set -x
set -e

if [ ! -d small ]; then
    mkdir small
    for n in {1..1000}; do
        dd if=/dev/urandom of=small/file$( printf %03d "$n" ).bin bs=1k count=1
    done
fi

if [ ! -d large ]; then
    mkdir large
    dd if=/dev/urandom of=large/file001.bin bs=1m count=1024
fi
