# moons

* Get moons for a planet
* Find what planet the moon belongs to

[lua](https://www.lua.org/about.html) means moon in portuguese, so it felt like it would be fitting to do something moon based. Additionally, this should showcase lua's `table` construct and usages/caveats of it.

## Docker

Within this folder:
```
docker build . -t moons:latest
docker run moons:latest mars
docker run moons:latest io
```
