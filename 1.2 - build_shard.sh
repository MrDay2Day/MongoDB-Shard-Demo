#!/bin/bash

source .env

COUNT=0

for item in 1 2 3; do
    COUNT=$(($COUNT + 3))
    echo "Shard Server Login Port $SHARD_PORT"
    echo "Adding Set $REPLICA_SET$item to shard"
    echo "Instances:    $((START_PORT + $COUNT - 2)), $((START_PORT + $COUNT - 1)), $((START_PORT + $COUNT - 0))"
    echo ""
  
    mongo --port $SHARD_PORT --host $HOSTS --eval 'sh.addShard("'$REPLICA_SET$item'/127.0.0.1:'$((START_PORT + $COUNT - 2))',127.0.0.1:'$((START_PORT + $COUNT - 1))',127.0.0.1:'$((START_PORT + $COUNT - 0))'")'
    echo ""
done
