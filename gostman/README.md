# gostman

![](./gostman.png)

[postman](https://www.postman.com/) features an API client for calling ReST services. Using the power of groovy and the new YAML slurper, can we abstract away the components of a ReST request and implement our own client?

## Docker

* `Build`: `docker build . -t gostman`
* `Run:` `docker run -i --rm gostman < create_post.yaml`

Use `stdin` to route any `yaml` request. Supported samples:

```yaml
url: https://jsonplaceholder.typicode.com/posts
method: GET
queryParams:
  userId:
    - 1
    - 2
    - 3
---
url: https://jsonplaceholder.typicode.com/posts
method: POST
headers:
  Content-type: "application/json; charset=UTF-8"
body:
  title: 'foo'
  body: 'bar'
  userId: 1
```

This sample makes use of [JSON PlaceHolder](https://jsonplaceholder.typicode.com/guide/) to make rest calls.
