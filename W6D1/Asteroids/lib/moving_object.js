class MovingObject {
  constructor(objects_hash) {
    this.pos = objects_hash[this.pos];
    this.vel = objects_hash[this.vel];
    this.radius = objects_hash[this.radius];
    this.color = objects_hash[this.color];
  }
}
//
// const mo = new MovingObject(
//   { pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00"}
// );
//

MovingObject.prototype.draw = function (ctx) {
  ctx.beginPath();
  ctx.arc(this.pos, this.pos, this.radius, 0, this.vel * Math.PI, false);
  ctx.fillStyle = this.color;
  ctx.stroke();
  ctx.fill();
};

MovingObject.prototype.move = function (ctx) {
  ctx.arc(this.pos+=10, this.pos+10, this.radius, 0, this.vel+=10 * Math.PI, false);
};

module.exports = MovingObject;
