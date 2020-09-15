# containment_32

## Rules

The rules are simple:

* Executions should be container based
  * Whatever that means
  * Dockerfile may/may not be _the submission_
* Each subfolder should have further explanation and instructions

## Entries

* [moons](./moons/README.md)
  * Build: `docker build moons -t moons`
  * Run: `docker run moons:latest ARG`, e.g `docker run moons:latest mars`