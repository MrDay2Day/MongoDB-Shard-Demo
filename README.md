# MongoDB Sharded Server Demo

This is just a simple demo on how to create a `MongoDB` Sharded Replica Set.

- 1 Shard Server
- 3 Sharded Replica Set Servers
- 9 Mongos Servers

This is an example of how MongoDB can be scaled horizontally across multiple servers.

<br />

## 1.x Build & Initialization

### 1.0

- Starts main shard server.
- Starts the replica shard servers

### 1.1

- Initializes all `replicaset`

### 1.2

- Adds `replicaset` servers to shard server.

<br />

## 2.x Mongo Servers

### 2.0

- Start 9 instances of a `mongos` server

<br />

## 3.x Simple MongoDB

- Start a simple `mongodb` `replicaset` server
- Initiate this replica set

<br />

After **build and initialization** of Shard Server you can run `./start.sh` to start the `shard` server.
