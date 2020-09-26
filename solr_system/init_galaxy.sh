# start locally so we can do our bootstrapping
start-local-solr

/opt/solr/bin/solr create -c galaxy

schemaAPI=http://localhost:8983/solr/galaxy/schema

# mark our fields as text
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"name", "type":"text_general", "multiValued":false, "stored":true, "indexed":true}}' $schemaAPI
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"imgLink", "type":"text_general", "multiValued":false, "stored":true}}' $schemaAPI
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"description", "type":"text_general", "multiValued":false, "stored":true}}' $schemaAPI
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-copy-field" : {"source":"*","dest":"_text_"}}' $schemaAPI

/opt/solr/bin/post -c galaxy /galaxy/planets.json
/opt/solr/bin/post -c galaxy /galaxy/satellites.json

stop-local-solr

# Now run Solr in the foreground, listening to all interfaces
exec solr -f