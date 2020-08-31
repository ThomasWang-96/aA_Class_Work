import React from "react";
import ReactDOM from "react-dom";
import Clock from "./clock";
import Tabs from "./tabs";
import Weather from "./weather";
import Autocomplete from "./autocomplete";

const panels = [
  { title: "one", content: "I am the first" },
  { title: "two", content: "I am the second" },
  { title: "three", content: "I am the third" }
];

function Root(){
    return(
        <div>
            <div><Clock /></div>
            <div><Weather /></div>
            <div><Tabs panels = {panels} /></div>
            <div><Autocomplete /></div>
        </div>
    )
}

document.addEventListener('DOMContentLoaded', ()=> {
    const root = document.getElementById('root')
    ReactDOM.render(< Root />, root)
})


