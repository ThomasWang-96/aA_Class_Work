import React from "react";

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      index: 0,
    };
  }

  render() {
    return (
      <div>
        <h1>Tabs</h1>
        <div className='tabs'>
          <ul>
            <h1>{this.props.panels[this.state.index].title}</h1>
            <article>{this.props.panels[this.state.index].content}</article>
          </ul>
        </div>
      </div>
    );
  }
  
  handler(event) {
    event.preventDafult();
    this.setState({
    })
  }

}

export default Tabs;
