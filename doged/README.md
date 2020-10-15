# doged

A [dogescript](https://dogescript.io/) image. It seemed fitting to make a container potentially capable of running my 2017 entries.

## Docker

* Build: `docker build . -t doged`
* Run: `docker run -it doged`

## Interact

### REPL

* `docker run -it doged`

### Run Scripts

* Mount the samples directory and use `script --run`:
  * `docker run -v ${PWD}/samples:/samples doged /samples/fizzbuzz.djs --run`