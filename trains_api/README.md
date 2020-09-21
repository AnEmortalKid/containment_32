 # trains_api

 A continuation of our work on `trains_db`, can we create a service that gives us the shortest paths between two cities?

 ## Prerequisites

 1. The `trains_db` image must be built

## Docker

* Build: `docker-compose up`

## Interact

Wait for the neo4j database to be up and started prior to interacting

```
curl "http://localhost:3000/paths?start=%22Kansas%20City%22&end=%22Vancouver%22"
```