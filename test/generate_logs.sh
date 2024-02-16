#!/bin/bash

while true; do
    echo "This is a log message"
    >&2 echo "This is an error message"
    sleep 5
done