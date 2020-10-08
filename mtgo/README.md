# mtgo

Magic the GOthering. Using `go` and the [magic the gathering api](https://docs.magicthegathering.io/#documentationgetting_started) , display information about cards by name.

## Docker 

* Build: `docker build . -t mtgo`
* Run: `docker run mtgo Black Lotus`

## Sample

```bash
$ docker run mtgo Black Lotus
Searching cards with name:  Black Lotus
9  cards exist.
Black Lotus   costs:  {0}
Description:  {T}, Sacrifice Black Lotus: Add three mana of any one color.
```