import React from "react";

class Headers extends React.Component {
  render(){
    const selected = this.props.selectedPane;
    const headers = this.props.panels.map((panel, index) => {
      const title = panel.title
      const klass = index === selected ? 'active' : 'inactive'
      return( 
        <li key={index}
            className={klass}            
            onClick={()=> this.props.onTabChosen(index)}>
            {title}
        </li>
      )
    })
  
    return(
      <ul className='tab-header'>
        {headers}
      </ul>
    )
  }
  
}
 
export default class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedPanel: 0,
    };
    // this.selectTab = this.selectTab.bind(this)
  }

  // selectTab(index) {
  //   this.setState({selectedPanel: index})
  // }


  render() {
    const panel = this.props.panels[this.state.selectedPanel]

    return (
      <div>
        <h1>Tabs</h1>
        <div className='tabs'>
          <Headers selectedPane={this.state.selectedPanel}
                  //  onTabChosen={this.selectTab}
                  onTabChosen={(index)=> {this.setState({selectedPanel:index})}}
                  panels={this.props.panels}>
          </Headers>
       

        <div className= 'tab-content'> 
          <article>{panel.content}</article>
        </div>
        </div>
      </div>
    );
  }
  

}

