import React from 'react';
class Clock extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            time: new Date()
        } }

    componentDidMount(){
        this.timerId = setInterval(() => this.tick(), 1000);
    }

    componentWillUnmount(){
        clearInterval(this.timerId)
    }

    tick(){
        this.setState({
            time: new Date()
        }) ;   
    }

    render() {
        return (
          <div>
            <h1>Clock</h1>
                <div className="clock">
                <p>
                    <span>Time: </span>
                    <span>{this.state.time.toLocaleTimeString()}</span>
                </p>

                <p>
                    <span>Date:</span>
                    <span>{this.state.time.toLocaleDateString()}</span>
                </p>
                </div>
          </div>
        );
    };

}




export default Clock;