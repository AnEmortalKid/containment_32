# frank

A [`sinatra`](http://sinatrarb.com/) app for finding lyrics in Frank Sinatra's work!

## Docker

* Build : `docker build . -t frank`
* Run: `docker run -p 4567:4567 frank`

## Interact

* Visit: 
  * http://localhost:4567/search?words=love
  * http://localhost:4567/search?title=Fly%20Me

## Sample

```bash
$ curl http://localhost:4567/search?words=stars 
{"Fly Me To The Moon":["Fly me to the moon","Let me play among the stars","Let me see what spring is like","On a-Jupiter and Mars","In other words: hold my hand","In other words: baby, kiss me","Fill my heart with song","And let me sing for ever more","You are all I long for","All I worship and adore","In other words: please, be true","In other words: I love you","Fill my heart with song","Let me sing for ever more","You are all I long for","All I worship and adore","In other words: please, be true","In other words, in other words: I love you"]}
```
