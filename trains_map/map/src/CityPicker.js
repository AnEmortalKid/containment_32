import 'react-widgets/dist/css/react-widgets.css';
import React from 'react';
import cities from './cities'

class CityPicker extends React.Component {
    constructor(props) {
        super(props)
        this.choices = cities.getCities()
        this.label = props.label
        this.onChange = props.handleChange
    }

    createSelectItems() {
        let items = [];
        for (let i = 0; i < this.choices.length; i++) {
            let name = this.choices[i].name
            items.push(<option key={name} value={name}>{this.choices[i].display}</option>)
        }
        return items;
    }

    render() {
        return (<div><label for="cars">{this.label}:</label>
            <select name="cities" id={this.label + "_cities"} onChange={this.onChange}>
                <option disabled hidden selected value>Select City</option>
                {this.createSelectItems()}
            </select>
        </div>);
    }
}

export default CityPicker;