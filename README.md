# Alerting Demo

Run `docker-compose up -d`

## Login to Hume

```
admin@hume.ga / password
```

Check the ecosystem variables

```bash
docker-compose exec postgres psql -U hume -c 'SELECT key, value FROM ecosystem_variable'
```

## Running with EFK

An additional compose file brings the EFK (Elastic, Fluentd, Kibana) stack into the mix.

You can enable the EFK stack in two ways : 

1. Comment the `COMPOSE_FILE` line and uncomment the `COMPOSE_FILE_EFK` line in the `.env` file.
2. Pass both compose files to every docker-compose command -> `docker-compose -f docker-compose.yml -f docker-compose-efk.yml up -d`

The option number 1 is the most straightforward

Once Elasticsearch is up and running, run the `setup-elastic` script for configuring the ingest pipeline

```bash
./scripts/setup-elastic.sh
```

- Elasticsearch is available at http://localhost:9200
- Kibana is available at http://localhost:5601

