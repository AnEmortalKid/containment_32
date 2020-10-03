# kurl

a [kotlin](https://kotlinlang.org/) based [curl](https://curl.haxx.se/) style library. Note, due to line limitation only `-H` headers are supported and the default method is `GET`

## Docker

* Build : `docker build . -t kurl`
* Run: `docker run kurl [args]` e.g. `docker run kurl https://jsonplaceholder.typicode.com/posts`