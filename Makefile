.PHONY: config
config:
	rm -rf clickhouse01 clickhouse02 clickhouse03 clickhouse04 clickhouse05 clickhouse06
	mkdir -p clickhouse01 clickhouse02 clickhouse03 clickhouse04 clickhouse05 clickhouse06
	REPLICA=01 SHARD=01 envsubst < config.xml > clickhouse01/config.xml
	REPLICA=02 SHARD=01 envsubst < config.xml > clickhouse02/config.xml
	REPLICA=03 SHARD=02 envsubst < config.xml > clickhouse03/config.xml
	REPLICA=04 SHARD=02 envsubst < config.xml > clickhouse04/config.xml
	REPLICA=05 SHARD=03 envsubst < config.xml > clickhouse05/config.xml
	REPLICA=06 SHARD=03 envsubst < config.xml > clickhouse06/config.xml
	cp users.xml clickhouse01/users.xml
	cp users.xml clickhouse02/users.xml
	cp users.xml clickhouse03/users.xml
	cp users.xml clickhouse04/users.xml
	cp users.xml clickhouse05/users.xml
	cp users.xml clickhouse06/users.xml

.PHONY: up
up:
	docker-compose up -d

.PHONY: start
start:
	docker-compose start

.PHONY: down
down:
	docker-compose down
