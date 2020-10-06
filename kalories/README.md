# kalories

A `kotlin` based client that uses [Open Food Facts](https://world.openfoodfacts.org/data) to find the caloric content of food!

## Docker

* Build: `docker build . -t kalories`
* Run: `docker run kalories [your search terms]`

## Sample

```bash
$ docker run kalories Pumpkin Spice Latte
Chai pumpkin spice latte black tea concentrate, pumpkin spice latte has 67 kcal
Pumpkin spice latte iced espresso beverage, pumpkin spice latte has 65 kcal
Elmer chocolate, chocolate, pumpkin spice latte creme & caramel has 444 kcal
Latte, Cafe Style Beverage Mix, Pumpkin Spice has 400 kcal
Pumpkin Spice Latte has 62 kcal
```