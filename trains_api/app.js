const express = require('express')
var cors = require('cors');
const app = express()
app.use(cors());
console.log('Enabling cors')

const port = 3000
const pathFinder = require('./pathfinder')

app.get('/paths', async (req, res, next) => {
    try {
        const start = JSON.parse(req.query.start.toUpperCase())
        const end = JSON.parse(req.query.end.toUpperCase())
        const paths = await pathFinder.findPaths(start, end)
        res.json({ data: Array.from(paths) })
    } catch (error) {
        // Passes errors into the error handler
        return next(error)
    }
})

app.listen(port, () => {
    console.log(`trains_api running on http://localhost:${port}`)
})