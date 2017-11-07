const MovingObject = require ('./moving_object');

var COLOR = 'blue';
var RADIUS = 10;
class Asteroid extends MovingObject {
  constructor(color, radius, vel) {
    super(color, radius);
    this.vel = vel;

  }

  randomVec (length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  }
  // Scale the length of a vector by the given amount.
  scale (vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
}

document.addEventListener("DOMContentLoaded", function(){

  var canvas = document.getElementById('game-canvas');
  var ctx = canvas.getContext('2d');
  ctx.fillStyle = "black";

});

module.exports = Asteroid;
// const gameview = new GameView;
