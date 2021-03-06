# Hume Docker Setup

## First steps

- Make a copy of `.env.local` to `.env` , the `.env` file is ignored from git.

- Copy your licence b64 string into the created `.env` file

Run `docker-compose up -d`

## Services deployed

- Hume     -> localhost:8001
- Neo4j    -> localhost:7474
- Kafdrop  -> localhost:9100

## Login to Hume

```
admin@hume.ga / password
```

## Running with EFK

An additional compose file brings the EFK (Elastic, Fluentd, Kibana) stack into the mix.

You can enable the EFK stack by changing the .env file : 

Comment the `COMPOSE_FILE` line having one compose and uncomment the `COMPOSE_FILE` line having the -efk compose in the `.env` file.

Start the EFK stack

The EFK stack needs to be running before containers can move logs to them, start first the stack : 

```bash
docker-compose --profile efk up -d
```

The above command will start up the EFK stack and all the containers that will not send logs to EFK ( everything but hume core containers)

Once Elasticsearch is up and running, run the `setup-elastic` script for configuring the ingest pipeline

```bash
./scripts/setup-elastic.sh
```

- Elasticsearch is available at http://localhost:9200
- Kibana is available at http://localhost:5601

Start now Hume core

```bash
docker-compose --profile hume up -d
```

## Tear down

Attention, next command remove all volumes and data

```bash
docker-compose down --volumes --remove-orphans
```

## Checking Ecosystem variables encryption

Check the ecosystem variables

```bash
docker-compose exec postgres psql -U hume -c 'SELECT key, value FROM ecosystem_variable'
```

