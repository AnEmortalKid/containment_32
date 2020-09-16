# fib_db

The [fibonacci](https://en.wikipedia.org/wiki/Fibonacci_number) sequence is a commonly solved problem for learning languages. Additional improvements include memoization. What if we used oracle as our memoization structure?

This small example uses some PL/SQL and Oracle constructs to provide a sot of memoized fibonacci function.

## Docker

* Build: `docker build . -t fib_db`
* Run: `docker run --name fibby fib_db:latest`

### Interact

```bash
docker exec -it fibby /bin/bash
# in container
$ sqlplus sys/oracle@xe as sysdba
SET SERVEROUT ON
call fibonacci(5);
select * from fib_mem;
```

### Clean

```
docker stop fibby && docker rm fibby
```