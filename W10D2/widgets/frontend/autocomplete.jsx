import React from 'react'
export default class Autocomplete extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            inputVal: ""
        }
        this.handleClick = this.handleClick.bind(this)
        this.handleChange = this.handleChange.bind(this)
    }
    handleClick(name){
        this.setState({inputVal: name})
    }

    handleChange(event){
        this.setState({inputVal: event.target.value})
    }

    render() {
        let results  = [];
        const propNames = this.props.names
        if (this.state.inputVal){ 
            propNames.forEach((name) => {
                if (name.toLowerCase().indexOf(this.state.inputVal.toLowerCase()) === 0) {
                    results.push(name)
                } 
            })
            
            if(results.length === 0) {
                results = ['No matches']
            }

        } else {
            results = this.props.names
        }

        const displayNames = results.map((result, index) => {
            return (
                <li key={index}
                    onClick={() => this.handleClick(result)}>
                    {result}
                </li>
            )
        })

        return (
            <div>
                <h1>Autocomplete</h1>
                <div className='autocomplete'>
                    <input type="text" value={this.state.inputVal} onChange= {this.handleChange}/>
                    <ul>
                        {displayNames}
                    </ul>
                </div>
            </div>
        )
    }
}