const neo4j = require('neo4j-driver')
const host = process.env.NEO4J_HOST || 'localhost'
const driver = neo4j.driver('neo4j://' + host +':7687', neo4j.auth.basic('neo4j', 'test'))

// cerner_2^5_2020
module.exports.findPaths = async function(start,end) {
    const session = driver.session()
    try {
        // Account for our relationship not being inverted correctly, use no directionality
        const result = await session.run('MATCH (start {name: $start}), (end {name: $end}),p = allShortestPaths((start)-[*]-(end)) RETURN p', { start:start,end:end })

        const pathDeduper = new Set()
        const paths = new Set()
        for (var r = 0; r < result.records.length; r++) {
            const cities = []
            const segments = result.records[r].get(0).segments;
            cities.push(segments[0].start.properties.name)
            for (var i = 0; i < segments.length; i++) {
                cities.push(segments[i].end.properties.name)
            }
            // cheap way to avoid duplicates
            if(!pathDeduper.has(JSON.stringify(cities))) {
                pathDeduper.add(JSON.stringify(cities))
                paths.add(cities)
            }
        }
        return paths
    } finally {
        await session.close()
    }
}
