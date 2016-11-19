#!/bin/sh

TEST_TYPE=$1
LOG=${TEST_TYPE}-read.log
WORKING_DIR=/mnt/${TEST_TYPE}

set -e
rm -rf ${WORKING_DIR} ${LOG}
for n in $(seq 1 10 ); do
    mkdir -p ${WORKING_DIR}
    echo "$n start"
    /usr/bin/time --format="%e" aws s3 sync --quiet s3://the-test-is-now/${TEST_TYPE}/ ${WORKING_DIR}/ 2>> ${LOG}
    echo "$n complete"
    rm -rf ${WORKING_DIR}
done
