# containment_32

## Rules

The rules are simple:

* Executions should involve a container somehow
  * Whatever that means
  * Dockerfile may/may not be _the submission_
* Each subfolder should have further explanation and instructions

## Why Docker?

* Explore the power of images and get away from having to install compilers/interpreters for languages

## Entries

* [moons](./moons/README.md)
  * Build: `docker build moons -t moons`
  * Run: `docker run moons:latest ARG`, e.g `docker run moons:latest mars`
* [poke_vacation](./poke_vacation/README.md)
  * Build: `docker build poke_vacation -t poke_vacation`
  * Run: `docker run poke_vacation:latest` (see notes for extracting output)
* [fib_db](./fib_db/README.md)
  * Build: `docker build fib_db -t fib_db`
  * Run: `docker run --name fibby fib_db:latest` (see notes for interacting)
* [telephones](./telephones/README.md)
  * Build: `docker build telephones -t whisperer`
  * Run: `docker-compose -f telephones/docker-compose.yml up` (see notes for interacting)
* [goombas](./goombas/README.md)
  * Build: `docker build goombas -t goombas`
  * Run: `docker run -v ${PWD}/results:/results goombas:latest` (see notes for interacting)
* [trains_db](./trains_db/README.md)
  * Build: `docker build . -t trains_db`
  * Run:
  ```bash
  docker run \
    --name trains_db \
    -p7474:7474 -p7687:7687 \
    -v $HOME/neo4j/data:/data \
    -v $HOME/neo4j/logs:/logs \
    -v $HOME/neo4j/plugins:/plugins \
    trains_db:latest
  ```

## Clean

Playing around with the containers might leave exited containers, clean with:

```
docker container prune -f
```