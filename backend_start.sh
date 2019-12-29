#!/bin/bash
echo "wait for database to init"
echo "migration"
while diesel migration run ; [ $? -ne 0 ];do
    echo "failed to make migrations! sleepting 1s"
    sleep 1
done
echo "running"
target/release/backend