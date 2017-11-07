const MovingObject = require('./moving_object');

class Game extends MovingObject{
  constructor() {
    const DIM_X = 2000;
    const DIM_Y = 1000;
    const NUM_ASTEROIDS = 20;

    this.addAsteroids();
  }
}

Game.prototype.addAsteroids = function () {
  let asteroids = [];
  const ast = new MovingObject;
  ast.pos = [Math.floor(Math.random() * this.DIM_X),
    Math.floor(Math.random() * this.DIM_Y)];
  asteroids.push(ast);
};

// Game.prototype.randomPosition = function () {
//
// };

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
};

Game.prototype.movingObjects = function () {
  for (var i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].move;
  }
};
