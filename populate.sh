#!/bin/bash

set -x
set -e

if [ ! -d small ]; then
    mkdir small
    for n in $(seq 1 1000); do
        dd if=/dev/urandom of=small/file$( printf %03d "$n" ).bin bs=50K count=1
    done
fi

if [ ! -d large ]; then
    mkdir large
    dd if=/dev/urandom of=large/file001.bin bs=1M count=1024
fi

aws s3 sync small/ s3://the-test-is-now/small/
aws s3 sync large/ s3://the-test-is-now/large/
touch .populate
