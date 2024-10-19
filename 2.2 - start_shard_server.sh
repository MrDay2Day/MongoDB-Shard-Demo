#!/bin/bash

source .env

# $ mongos --configdb <shard replica set name>/<shard index host>:<available port> --port <a shard index port>
mongos --configdb day2day4/127.0.0.1:28010,127.0.0.1:28011,127.0.0.1:28012 --bind_ip $HOSTS  --port $(($SHARD_PORT + 0)) &
mongos --configdb day2day4/127.0.0.1:28010,127.0.0.1:28011,127.0.0.1:28012 --bind_ip $HOSTS  --port $(($SHARD_PORT + 1)) &
mongos --configdb day2day4/127.0.0.1:28010,127.0.0.1:28011,127.0.0.1:28012 --bind_ip $HOSTS  --port $(($SHARD_PORT + 2)) &

mongos --configdb day2day4/127.0.0.1:28010,127.0.0.1:28011,127.0.0.1:28012 --bind_ip $HOSTS  --port $(($SHARD_PORT + 3)) &
mongos --configdb day2day4/127.0.0.1:28010,127.0.0.1:28011,127.0.0.1:28012 --bind_ip $HOSTS  --port $(($SHARD_PORT + 4)) &
mongos --configdb day2day4/127.0.0.1:28010,127.0.0.1:28011,127.0.0.1:28012 --bind_ip $HOSTS  --port $(($SHARD_PORT + 5)) &

mongos --configdb day2day4/127.0.0.1:28010,127.0.0.1:28011,127.0.0.1:28012 --bind_ip $HOSTS  --port $(($SHARD_PORT + 6)) &
mongos --configdb day2day4/127.0.0.1:28010,127.0.0.1:28011,127.0.0.1:28012 --bind_ip $HOSTS  --port $(($SHARD_PORT + 7)) &
mongos --configdb day2day4/127.0.0.1:28010,127.0.0.1:28011,127.0.0.1:28012 --bind_ip $HOSTS  --port $(($SHARD_PORT + 8))


# Make sure to enable sharding on your data
# // Enable sharding on the database
# sh.enableSharding("yourDatabaseName");

# // Enable sharding on the collection
# sh.shardCollection("yourDatabaseName.Demo", { _id: 1 });

# // Verify sharding status
# sh.status();

# // Check Balancer status & Enabling if disabled
# sh.getBalancerState()
# sh.setBalancerState(true)