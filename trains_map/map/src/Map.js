import map from './board_game.jpg'
import React from 'react';
import cities from './cities'
const d3 = require('d3')

class Map extends React.Component {
    constructor(props) {
        super(props)
        this.state = { startCity: props.startCity, endCity: props.endCity, paths: [] }
        this.drawPaths = this.drawPaths.bind(this);
    }

    componentWillReceiveProps(nextProps) {
        this.setState({ startCity: nextProps.startCity, endCity: nextProps.endCity });
    }

    drawPaths(pathResponse, canvas) {
        console.log(pathResponse.data.data)

        // we wrap things in data
        var paths = pathResponse.data.data

        for (var i = 0; i < paths.length; i++) {
            console.log('path: ' + i + ":" + paths[i])
            var path = paths[i];

            var points = []
            var linePoints = []
            for (var j = 0; j < path.length; j++) {
                var city = path[j]

                var coord = cities.getCoordinate(city.toLowerCase())
                points.push(coord)
                linePoints.push([coord.x, coord.y])
            }
            console.log(points)

            var colorChoice = Math.random() * 360
            canvas.append("g")
                .selectAll('circle')
                .data(points)
                .enter()
                .append('circle')
                .attr('cx', function (d) { return d.x })
                .attr('cy', function (d) { return d.y })
                .attr('r', '6')
                .style('fill', function () {
                    return "hsl(" + colorChoice + ",100%,50%)";
                });

            var lineGenerator = d3.line();
            var pathData = lineGenerator(linePoints);
            console.log(linePoints);
            console.log(pathData);

            canvas.append("path")
                .datum(linePoints)
                .attr("d", lineGenerator)
                .attr("stroke", function () {
                    return "hsl(" + colorChoice + ",100%,50%)";
                })
                .attr('fill', 'none')
                .attr('stroke-width', '5')
        }
    }

    render() {
        // clear previous state
        d3.select("#map").selectAll("*").remove();

        var svg = d3.select('#map')
            .append("svg")
            .attr("width", 1024)
            .attr("height", 683)
            .style("border", "1px solid black");

        // sets the background
        var trainMap = svg.append("g").append('image').attr('xlink:href', function (d) { return map })
        var pathCanvas = svg.append("g")

        const { startCity, endCity } = { ... this.state };
        if (startCity != null && endCity != null && startCity != endCity) {
            cities.getPaths(startCity, endCity)
                .then(response => this.drawPaths(response, pathCanvas));
            trainMap.style("opacity", 0.85)
        }

        return (
            <div className="Map" id="map">
                { /* set the initial background */}
                <img src={map} />
            </div>
        );
    }
}

export default Map;