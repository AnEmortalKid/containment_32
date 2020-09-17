# telephones

[Broken Telephone](https://en.wikipedia.org/wiki/Chinese_whispers) is a game I learned and played as a child, its objective is simple:

* Within a list of participants, relay a message through all the participants (via whispering), and compare the output.

A whisperer isn't unique, so we can reuse the same service with a little bit of rules:

* If a whisperer is the last participant, return the phrase
* Otherwise, relay the message to the next whisperer

## Docker

* Build: `docker build . -t whisperer` - should take a couple of mins cause maven
* Run: `docker-compose up` - wait for the participants to be up and ready

## Interact

Via curl:
```bash
curl -X POST "http://localhost:8080/relay?phrase=the%20quick%20brown%20fox%20jumps%20over%20the%20lazy%20dog"
```

Via java using jdk11:

```bash
javac Call.java
java Call
```

Observe how the communication breaks down between participants:

```bash
alice    | Says, I heard: "the quick brown fox jumps over the lazy dog"
alice    | 192.168.96.1 - - [17/Sep/2020:23:04:40 +0000] "POST /relay?phrase=the%20quick%20brown%20fox%20jumps%20over%20the%20lazy%20dog HTTP/1.1" 204 0 "-" "curl/7.54.0" 6
bob      | Says, I heard: "brown quick the jumps over dog the"
bob      | 192.168.96.3 - - [17/Sep/2020:23:04:40 +0000] "POST /relay?phrase=brown+quick+the+jumps+over+dog+the HTTP/1.1" 204 0 "-" "Java-http-client/11.0.4" 8
carl     | Says, I heard: "over quick the dog the"
carl     | 192.168.96.2 - - [17/Sep/2020:23:04:40 +0000] "POST /relay?phrase=over+quick+the+dog+the HTTP/1.1" 200 22 "-" "Java-http-client/11.0.4" 12
```

## Clean

```bash
docker-compose down
```