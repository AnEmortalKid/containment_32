# mango_db

![](./msngoDB.png)

Using `mongo`, let's build a database of some [mangos](https://en.wikipedia.org/wiki/List_of_mango_cultivars) and their origins!

## Docker

* Build: `docker build . -t mango_db`
* Run: `docker run --name mangodb mango_db:latest`

Interact:

```bash
docker exec -it mangodb mongo --username "admin-user" --password "admin-password" --authenticationDatabase "admin"
$ in container
use admin
db.mangos.find()
db.mangos.find({name: "Kent"})
# all mangos originating from Mexico and anywhere else
db.mangos.find({origin:"Mexico"})
# only originating from the united states
db.mangos.find({origin:["United States"]})
# names of mangos originating from the united states by excluding other fields
db.mangos.find({origin:"United States"}, { origin: 0, _id: 0 })
```
