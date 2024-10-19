#!/bin/bash

REPLICA_SET="day2day"
START_PORT=29500
HOSTS="localhost,127.0.0.1"
DB_PATH="simple"

# Starting Replica Set 1
mongod --replSet "$REPLICA_SET$((1))" --port $((START_PORT + 1)) --bind_ip $HOSTS --dbpath "./$DB_PATH/$((1))" --oplogSize 200  &
mongod --replSet "$REPLICA_SET$((1))" --port $((START_PORT + 2)) --bind_ip $HOSTS --dbpath "./$DB_PATH/$((2))" --oplogSize 200  &
mongod --replSet "$REPLICA_SET$((1))" --port $((START_PORT + 3)) --bind_ip $HOSTS --dbpath "./$DB_PATH/$((3))" --oplogSize 200 & 

# Give MongoDB instances time to start
sleep 5

# Log in to MongoDB and initiate the replica set
mongo --port $((START_PORT + 1)) --eval "rs.initiate({
  _id: '$REPLICA_SET$((1))',
  members: [
    { _id: 0, host: 'localhost:$((START_PORT + 1))' },
    { _id: 1, host: 'localhost:$((START_PORT + 2))' },
    { _id: 2, host: 'localhost:$((START_PORT + 3))' }
  ]
})"


# rs.initiate({ _id: "day2day1", members: [ { _id: 0, host: "localhost:29001" }, { _id: 1, host: "localhost:29002" }, { _id: 2, host: "localhost:29003" } ] })