const View = require('./ttt-view')
const Game = require('./game')

  $(() => {
    // Your code here
    const rootEl = $('.ttt');
    const game = new Game();
    new View(game, rootEl);
  });
