#!/bin/bash

source .env

COUNT=0

for item in 1 2 3 4; do
    COUNT=$(($COUNT + 3))
    echo "Replica Set:  $REPLICA_SET$item"
    echo "Login Port:   $(($START_PORT + $COUNT))"
    echo "Instances:    $((START_PORT + $COUNT - 2)), $((START_PORT + $COUNT - 1)), $((START_PORT + $COUNT - 0))"
    echo ""
  
    mongo --port $(($START_PORT + $COUNT)) --host $HOSTS --eval 'rs.initiate({
        _id : "'$REPLICA_SET$item'",
            members: [
                { _id: 0, host: "127.0.0.1:'$((START_PORT + $COUNT - 2))'" },
                { _id: 1, host: "127.0.0.1:'$((START_PORT + $COUNT - 1))'" },
                { _id: 2, host: "127.0.0.1:'$((START_PORT + $COUNT - 0))'" }
            ]
        })'
    echo ""
done
