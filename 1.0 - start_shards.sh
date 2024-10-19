#!/bin/bash

REPLICA_SET="day2day"
START_PORT=28000
HOSTS="localhost,127.0.0.1"
DB_PATH="shard_"

mkdir shard_0 & mkdir shard_0/a & mkdir shard_0/b & mkdir shard_0/c
mkdir shard_1 & mkdir shard_1/1 & mkdir shard_1/2 & mkdir shard_1/2
mkdir shard_2 & mkdir shard_2/4 & mkdir shard_2/5 & mkdir shard_2/6
mkdir shard_3 & mkdir shard_3/7 & mkdir shard_3/8 & mkdir shard_3/9

# Starting Replica Set 1
mongod --replSet "$REPLICA_SET$((1))" --shardsvr --port $((START_PORT + 1)) --bind_ip $HOSTS --dbpath "./$DB_PATH$((1))/$((1))" --oplogSize 200  &
mongod --replSet "$REPLICA_SET$((1))" --shardsvr --port $((START_PORT + 2)) --bind_ip $HOSTS --dbpath "./$DB_PATH$((1))/$((2))" --oplogSize 200  &
mongod --replSet "$REPLICA_SET$((1))" --shardsvr --port $((START_PORT + 3)) --bind_ip $HOSTS --dbpath "./$DB_PATH$((1))/$((3))" --oplogSize 200  &

# Starting Replica Set 2
mongod --replSet "$REPLICA_SET$((2))" --shardsvr --port $((START_PORT + 4)) --bind_ip $HOSTS --dbpath "./$DB_PATH$((2))/$((4))" --oplogSize 200  &
mongod --replSet "$REPLICA_SET$((2))" --shardsvr --port $((START_PORT + 5)) --bind_ip $HOSTS --dbpath "./$DB_PATH$((2))/$((5))" --oplogSize 200  &
mongod --replSet "$REPLICA_SET$((2))" --shardsvr --port $((START_PORT + 6)) --bind_ip $HOSTS --dbpath "./$DB_PATH$((2))/$((6))" --oplogSize 200  &

# Starting Replica Set 3
mongod --replSet "$REPLICA_SET$((3))" --shardsvr --port $((START_PORT + 7)) --bind_ip $HOSTS --dbpath "./$DB_PATH$((3))/$((7))" --oplogSize 200  &
mongod --replSet "$REPLICA_SET$((3))" --shardsvr --port $((START_PORT + 8)) --bind_ip $HOSTS --dbpath "./$DB_PATH$((3))/$((8))" --oplogSize 200  &
mongod --replSet "$REPLICA_SET$((3))" --shardsvr --port $((START_PORT + 9)) --bind_ip $HOSTS --dbpath "./$DB_PATH$((3))/$((9))" --oplogSize 200  &

# Shard Server
mongod --configsvr --replSet "$REPLICA_SET$((4))" --port $((START_PORT + 10)) --bind_ip $HOSTS --dbpath "./$DB_PATH$((0))/a" --oplogSize 200   &
mongod --configsvr --replSet "$REPLICA_SET$((4))" --port $((START_PORT + 11)) --bind_ip $HOSTS --dbpath "./$DB_PATH$((0))/b" --oplogSize 200   &
mongod --configsvr --replSet "$REPLICA_SET$((4))" --port $((START_PORT + 12)) --bind_ip $HOSTS --dbpath "./$DB_PATH$((0))/c" --oplogSize 200   

#  --tlsMode requireTLS --tlsCertificateKeyFile "./certs/fileName.pem" --tlsCAFile ./"certs/fileName.pem" 

echo ""
echo "Sharded Replica Set Shutdown"