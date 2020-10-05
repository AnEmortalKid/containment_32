# dicey

Using the [d language](https://dlang.org/) , build a dice roller we can use when playing [DnD](https://dnd.wizards.com/)

## Docker

* Build: `docker build . -t dicey`
* Run: `docker run dicey 2d4`

Format : `XdY` rolls X dice of Y. X is optional.

## Sample

```bash
$ docker run dicey 10d8
Total: 49, rolls: [2, 4, 2, 7, 3, 8, 7, 1, 8, 7]
$ docker run dicey d10
Total: 4, rolls: [4]
```