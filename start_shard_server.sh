#!/bin/bash

source .env

# $ mongos --configdb <shard replica set name>/<shard index host>:<available port> --port <a shard index posrt>
mongos --configdb day2day4/127.0.0.1:28010,127.0.0.1:28011,127.0.0.1:28012 --bind_ip $HOSTS  --port $(($SHARD_PORT + 0)) &
mongos --configdb day2day4/127.0.0.1:28010,127.0.0.1:28011,127.0.0.1:28012 --bind_ip $HOSTS  --port $(($SHARD_PORT + 1))
mongos --configdb day2day4/127.0.0.1:28010,127.0.0.1:28011,127.0.0.1:28012 --bind_ip $HOSTS  --port $(($SHARD_PORT + 2))


# Make sure to enable sharding on your data
# // Enable sharding on the database
# sh.enableSharding("yourDatabaseName");

# // Enable sharding on the collection
# sh.shardCollection("yourDatabaseName.Demo", { _id: 1 });

# // Verify sharding status
# sh.status();