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