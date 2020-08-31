import React from 'react'
export default class Weather extends React.Component {
    constructor(props){
        super(props)
        this.state = {
            weather: null
        }
        this.getWeather = this.getWeather.bind(this)
    }

    componentDidMount() {
        navigator.geolocation.getCurrentPosition(this.getWeather)
    }

    getWeather(location) {
        const lon = location.coords.longitude
        const lat = location.coords.latitude

        const request = new XMLHttpRequest();

        request.onreadystatechange = () => {
            if(request.status === 200 && request.readyState === XMLHttpRequest.DONE) {
                const data = JSON.parse(request.responseText)
                this.setState({weather: data})
                
            }
        }

        request.open("GET", `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=2fc4f830a2255082140e60975a66a7bd`, true)
        request.send();
    
    }
    
    render() {
        let content;
        if (this.state.weather) {
            content =   
            <div className='weather'>
                <li>
                    <span>City:</span>
                    <span>{this.state.weather.name}</span>
                </li>
                <li>
                    <span>Temperature:</span>
                    <span>{((this.state.weather.main.temp - 273.15) * 1.8 + 32).toFixed(1)}F</span>
                </li>
            </div>
        } else {
            content = <div className='weather'>loading weather</div>
        }
        return (
            <div>
                <h1>Weather</h1>
                {content}
            </div>
        )
    }
}