// load all our data 
LOAD CSV WITH HEADERS FROM 'file:///cities.csv' AS line
// Create or find node
MERGE(start:City { name: line.Start})
// Create or find node
MERGE(end:City { name: line.End })
// Create or find relationship
MERGE (start)-[r:ROUTE]->(end);
