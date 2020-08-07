const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');


function Asteroid (options){
    options = options || {}
    options.pos = options.pos;
    options.color = DEFAULTS.COLOR;
    options.radius = DEFAULTS.RADIUS;
    options.vel = options.vel || Util.randomVec(DEFAULTS.SPEED);
    
    MovingObject.call(this, options)
}

const DEFAULTS = {
    COLOR: "#505050",
    RADIUS: 25,
    SPEED: 4
}

Util.inherits(Asteroid, MovingObject);

module.exports = 'Asteroid'



// function Animal(name) {
//     this.name = name;
// }
// function Dog(name) {
//     Animal.call(this, name);
// }
// Dog.prototype = Object.create(Animal.prototype); 
// Dog.prototype.constructor = Dog;


// class Animal {
//     constructor(name) {
//         this.name = name;
//     }
// }
// class Dog extends
//     Animal {
//     constructor(name) {
//         super(name);
//     }
// }