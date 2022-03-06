#!/bin/bash

curl -X PUT http://localhost:9200/_ingest/pipeline/json-parser \
 -H 'Content-Type: application/json'  \
 -d '{"processors": [{"json": {"field": "log","add_to_root": false,"ignore_failure": true}}]}'