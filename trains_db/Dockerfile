FROM neo4j:latest

# thx https://stackoverflow.com/a/44380188
ENV NEO4J_AUTH=neo4j/test

COPY cities.csv /var/lib/neo4j/import/
COPY setup.cypher /var/lib/neo4j/import/

CMD bin/neo4j start && sleep 20 && \
    for f in import/*.cypher; do \
      [ -f "$f" ] || continue; \
      cat "$f" | NEO4J_USERNAME=neo4j NEO4J_PASSWORD=test bin/cypher-shell --fail-fast && rm "$f"; \
    done && \
    tail -f logs/neo4j.log
