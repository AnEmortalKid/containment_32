# gravatar

Using `groovy` and [adorable avatars](http://avatars.adorable.io/) , download a gravatar based on a term/id/etc!

## Docker

* Build: `docker build . -t gravatar`
* Run: `docker run gravatar [term]`, e.g. `docker run gravatar foo`


### Extracting Images

Images are generated to the `out/` folder in the container, there's 2 ways to fetch them.

1. Mount a volume:

```
docker run -v ${PWD}/out://home/groovy/out gravatar foo
```

2. Copy them from the container
```
docker ps -a
docker cp $ID_OF_CONTAINER:/home/groovy/out/your_term/* .
```

## Sample

![](./foo_250.png)