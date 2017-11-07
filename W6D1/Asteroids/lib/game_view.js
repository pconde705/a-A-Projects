const game = require('./game');

class GameView extends game {
  constructor() {

  }
}

GameView.prototype.start = function () {
  setInterval(game.movingObjects(), 20);
  setInterval(game.draw(), 20);
};
