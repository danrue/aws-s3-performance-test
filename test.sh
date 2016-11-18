#!/bin/sh

TEST_TYPE=$1

set -e
rm -rf /mnt/${TEST_TYPE} ${TEST_TYPE}.log
for n in $(seq 1 10 ); do
    mkdir -p /mnt/${TEST_TYPE}
    echo "$n start"
    /usr/bin/time --format="%e" aws s3 sync --quiet s3://the-test-is-now/${TEST_TYPE}/ /mnt/${TEST_TYPE}/ 2>> ${TEST_TYPE}.log
    echo "$n complete"
    rm -rf /mnt/${TEST_TYPE}
done
