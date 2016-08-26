#!/bin/bash -e

WAITFORPORT=$1

echo "Waiting for port: ${WAITFORPORT}"

ITERATIONS=10
PAUSESEC=3

for ((i=0;i<${ITERATIONS};i++));
do
  nc -z localhost "${WAITFORPORT}" && { echo "Success"; exit 0; }
  echo "Failed, sleeping for ${PAUSESEC} seconds"
  sleep "${PAUSESEC}"
done

echo "Timeout"
exit 1
