var serviceBase = process.env.pathService || 'localhost:3000'
var cities = require('./coords.json')
const axios = require('axios').default;
const client = axios.create({ baseURL: `http://${serviceBase}/` })

let coordinateMap = new Map()

// map by name
cities.forEach(c => {
    coordinateMap.set(c.name, { x: c.x, y: c.y })
})

function getCities() {
    let cityArr = []
    cities.forEach(c => {
        cityArr.push({ name: c.name, display: c.display })
    })
    return cityArr
}

function getCoordinate(city) {
    return coordinateMap.get(city)
}

async function getPaths(start, end) {
       return client.get(`/paths`, {
            params: {
                start: `"${start}"`,
                end: `"${end}"`
            }
        });
    // todo call api
    // todo get coordinates -> return
}

export default {
    getCities,
    getCoordinate,
    getPaths
}
