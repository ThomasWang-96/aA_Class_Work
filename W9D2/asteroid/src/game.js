const DIM_X = 800, DIM_Y = 1000, NUM_ASTEROIDS = 10;

function Game(){
    this.asteroids = [];  
    this.addAsteroids()
}


Game.prototype.addAsteroids = () => {
    while(this.asteroids.length < NUM_ASTEROIDS) {
        let pos = this.randomPosition();
        let asteroid = new Asteroid(pos);
        this.asteroids.push(asteroid);
    }
}

Game.prototype.randomPosition = () => {
    const pos_x = Math.floor(Math.random()*800)
    const pos_y = Math.floor(Math.random() * 1000)
    return [pos_x, pos_y]
}

Game.prototype.draw = (ctx) => {
    ctx.clearRect();
    this.asteroids.forEach((asteroid) => {
        asteroid.draw(ctx);
    })
}


