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

## Clean

Playing around with the containers might leave exited containers, clean with:

```
docker container prune -f
```