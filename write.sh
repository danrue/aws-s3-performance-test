#!/bin/sh

set -e

TEST_TYPE=$1
LOG=${TEST_TYPE}-write.log
WORKING_DIR=/mnt/${TEST_TYPE}

rm -rf ${LOG} ${WORKING_DIR}
mkdir -p ${WORKING_DIR}
if [ "${TEST_TYPE}" = "small" ]; then
    for n in $(seq 1 1000); do
        dd if=/dev/urandom of=${WORKING_DIR}/file$( printf %03d "$n" ).bin bs=50K count=1
    done
elif [ "${TEST_TYPE}" = "large" ]; then
    dd if=/dev/urandom of=${WORKING_DIR}/file001.bin bs=1M count=1024
else
    echo "Usage: $0 (small|large)"
fi

rm -rf ${TEST_TYPE}.log
for n in $(seq 1 10 ); do
    aws s3 rm --recursive --quiet s3://the-test-is-now/${TEST_TYPE}/
    echo "$n start"
    /usr/bin/time --format="%e" aws s3 sync --quiet ${WORKING_DIR}/ s3://the-test-is-now/${TEST_TYPE}/ 2>> ${LOG}
    echo "$n complete"
done
