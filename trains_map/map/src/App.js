import React from 'react';
import Map from './Map'
import CityPicker from './CityPicker'
import './App.css';

class App extends React.Component {
  constructor(props) {
    super(props)
    this.state = {}
    this.setStart = this.setStart.bind(this);
    this.setEnd = this.setEnd.bind(this);
  }

  setStart(event) { this.setState({ startCity: event.target.value, endCity: this.state.endCity})}
  setEnd(event) { this.setState({ startCity: this.state.startCity, endCity: event.target.value})}

  render() {
    return (
      <div className="App">
        <div>
          <CityPicker label="Start" handleChange={this.setStart} />
          <CityPicker label="End" handleChange={this.setEnd}/>
        </div>
        <Map startCity={this.state.startCity} endCity={this.state.endCity} />
      </div>
    );
  }
}

export default App;
