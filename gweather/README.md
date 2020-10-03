# gweather

Using the power of `groovy` and [weatherstack](https://weatherstack.com/quickstart), get weather forecasts in your command line!

## Prereqs

* Requires a Weatherstack API KEY

## Docker

* Prereq: `export API_KEY=YOUR_WEATHERSTACK_KEY`
* Build: `docker build --build-arg WEATHERSTACK_KEY=$API_KEY . -t gweather`
* Run: `docker run gweather`

## Sample

```bash
$ docker run gweather
📝 Weather for Suppesville,Kansas

  🌞 🌤
  Partly Cloudy

  🌡  Temperature
    It is 16 but it feels like 16

  🎐 Wind Conditions
    Wind blowing at 19 360° towards N

```