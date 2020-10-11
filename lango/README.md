# lango

Using the power of `lua` and [languagelayer](https://languagelayer.com/), detect the languages of any set of text. Lango is inspired by [Linguo](https://simpsons.fandom.com/wiki/Linguo) the language correction robot.

![](./lango.png)

## Prereqs

* Requires a [languagelayer](https://languagelayer.com/) API KEY

## Docker

* Prereq: `export API_KEY=LANGUAGELAYER_KEY`
* Build: `docker build --build-arg LANGUAGELAYER_KEY=$API_KEY . -t lango`
* Run: `docker run lango Text to search here`

## Sample

```bash
$ docker run lango 並そフほび主座ひゆ物口関べあけ場速8闘しo
Language is Japanese
  Confidence 100% with identification 1.5021194922677 and match confidence false

$ docker run lango A veces no se que pasa
Language is Galician
  Confidence 100% with identification 16.491851096599 and match confidence true
Language is Catalan
  Confidence 92.749488004084% with identification 15.296107454491 and match confidence false
```