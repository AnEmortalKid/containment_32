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
  * Build: `docker build trains_db -t trains_db`
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
* [cdxk](./cdxk/README.md)
  * Build: `docker build cdxk -t cdxk`
  * Run: `docker run -v ${PWD}/output:/output -v ${PWD}/cdxk/comics:/comics cdxk:latest`
* [trains_api](./trains_api/README.md)
  * Build: `docker build trains_db -t trains_db`
  * Run: `docker-compose -f trains_api/docker-compose.yml up` (see notes for interacting)
* [gostman](./gostman/README.md)
  * Build : `docker build gostman -t gostman`
  * Run: `docker run -i --rm gostman < gostman/create_post.yaml`
* [trains_map](./trains_map/README.md)
  * Build: `docker build trains_db -t trains_db`, `docker build trains_api -t trains_api`
  * Run: `docker-compose -f trains_map/docker-compose.yml up` (see notes for interacting)
* [mango_db](./mango_db/README.md)
  * Build: `docker build mango_db -t mango_db`
  * Run: `docker run --name mangodb mango_db:latest` (see notes for interacting)
* [world_clock](./world_clock/README.md)
  * Build: `docker build world_clock -t world_clock`
  * Run: `docker run -p 80:80 world_clock:latest` (see notes for interacting)
* [solr_system](./solr_system/README.md)
  * Build: `docker build solr_system -t solr_system`
  * Run: `docker run --name solr_system -p 8983:8983 solr_system` (see notes for interacting)
* [pyramid_album](./pyramid_album/README.md)
  * Build: `docker build pyramid_album -t pyramid_album`
  * Run: `docker run -p 8080:8080 pyramid_album` , visit http://localhost:8080/
* [animal_proxying](./animal_proxying/README.md)
  * Build: `docker build animal_proxying -t animal_proxying`
  * Run: `docker run -p 8080:8080 animal_proxying:latest` , visit http://localhost:8080/
* [lollersk8s](./lollersk8s/README.md)
  * Build: `docker build lollersk8s -t lollersk8s`
  * Run: `docker run -it lollersk8s` - follow prompt for interaction
* [bettas](./bettas/README.md)
  * Build: `docker build . -t bettas`
  * Run: `docker run -it bettas [type]` e.g. `docker run -it bettas crowntail`
* [emojify](./emojify/README.md)
  * Build: `docker build . -t emojify`
  * Run: `docker run -it emojify`
* [kurl](./kurl/README.md)
  * Build : `docker build kurl -t kurl`
  * Run: `docker run kurl [args]` e.g. `docker run kurl https://jsonplaceholder.typicode.com/posts`
* [gweather](./gweather/README.md)
  * Build: `export API_KEY=your_weatherstack_key ; docker build --build-arg WEATHERSTACK_KEY=$API_KEY gweather -t gweather`
  * Run: `docker run gweather`
* [taylor_swift](./taylor_swift/README.md)
  * Build: `docker build taylor_swift -t taylor_swift`
  * Run: `docker run taylor_swift`
* [dicey](./dicey/README.md)
  * Build: `docker build dicey -t dicey`
  * Run: `docker run dicey 2d4`
* [kalories](./kalories/README.md)
  * Build: `docker build kalories -t kalories`
  * Run: `docker run kalories [your search terms]`
* [mtgo](./mtgo/README.md)
  * Build: `docker build mtgo -t mtgo`
  * Run: `docker run mtgo Black Lotus`
* [gravatar](./gravatar/README.md)
  * Build: `docker build gravatar -t gravatar`
  * Run: `docker run gravatar [term]`, e.g. `docker run gravatar foo`, (see notes for extracting output)
* [grivia](./grivia/README.md)
  * Build: `docker build grivia -t grivia`
  * Run: `docker run -it grivia`
* [50_shades](./50_shades/README.md)
  * Build: `docker build 50_shades -t 50_shades`
  * Run: `docker run -v ${PWD}/out:/out 50_shades`
* [Lango](./lango/README.md)
  * Build: `export API_KEY=your_languagelayer_key ; docker build --build-arg LANGUAGELAYER_KEY=$API_KEY lango -t lango`
  * Run: `docker run lango Text to search here`
* [frank](./frank/README.md)
  * Build : `docker build frank -t frank`
  * Run: `docker run -p 4567:4567 frank` (see notes for interacting)
* [doged](./doged/README.md)
  * Build: `docker build doged -t doged`
  * Run: `docker run -it doged` (see notes for interacting)
  
## Clean

Playing around with the containers might leave exited containers, clean with:

```
docker container prune -f
```
