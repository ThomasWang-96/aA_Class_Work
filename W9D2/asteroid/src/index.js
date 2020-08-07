const MovingObject = require('./moving_object.js')
window.MovingObject = MovingObject;

const Asteroid = require('./asteroid.js')
window.Asteroid = Asteroid;

document.addEventListener("DOMContentLoaded", function() {
    const canvas = document.getElementById('game-canvas');
    canvas.height = 800;
    canvas.width = 1000;
    const ctx = canvas.getContext("2d");
    
});
