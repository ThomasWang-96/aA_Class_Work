const Util = require('./utils.js')

function MovingObject(options) {
        this.pos = options.pos;
        this.vel = options.vel;
        this.radius = options.radius;
        this.color = options.color;
}

MovingObject.prototype.draw = function draw(ctx){
    ctx.fillStyle = this.color
    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
    ctx.fill()
}

MovingObject.prototype.move = () => {
    this.pos = [this.vel[0] + this.pos[0], this.vel[1]+this.pos[1]];
}


module.exports = MovingObject;

