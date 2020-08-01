let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  var initGrid = Array.from(new Array(8), ()=> new Array(8))
    initGrid[3][3] = new Piece('white');
    initGrid[4][4] = new Piece('white');
    initGrid[3][4] = new Piece('black');
    initGrid[4][3] = new Piece("black");
  return initGrid
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/** [x, y]
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  var x = pos[0], y = pos[1];
  if (x > 7 || x < 0 || y >7 || y < 0) return false;
  // if (this.grid[x][y]) return false;
  return true
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  var x = pos[0], y = pos[1];
  if (!this.isValidPos(pos)) throw new Error("Not valid pos!");
  return this.grid[x][y]
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (this.getPiece(pos) === undefined) return null;
  return this.getPiece(pos).color === color;

};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  var x = pos[0], y = pos[1];
  if (this.grid[x][y]) return true;
  return false;
}; 

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function (pos, color, dir, piecesToFlip) {
  // if (!this.isValidPos(pos)) return [];
  
  // var nextPos = [pos[0] + dir[0], pos[1] + dir[1]];
  
  // if (!this.isOccupied(nextPos)) return piecesToFlip = [];
  // if (this.isMine(nextPos, color)) return piecesToFlip = [];
  // if (!this.isValidPos(nextPos)) return piecesToFlip = [];
  
  // var res = this._positionsToFlip(nextPos, color, dir, piecesToFlip);
  //     res.unshift(nextPos);
  // return res;

   if (!piecesToFlip) {
     piecesToFlip = [];
   } else {
     piecesToFlip.push(pos);
   }
   let nextPos = [pos[0] + dir[0], pos[1] + dir[1]];

   if (!this.isValidPos(nextPos)) {
     return [];
   } else if (!this.isOccupied(nextPos)) {
     return [];
   } else if (this.isMine(nextPos, color)) {
     return piecesToFlip.length == 0 ? [] : piecesToFlip;
   } else {
     return this._positionsToFlip(nextPos, color, dir, piecesToFlip);
   }

};


/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) return false;
  
  for (let i = 0; i < Board.DIRS.length; i++) {
    const piecesToFlip = this._positionsToFlip(pos, color, Board.DIRS[i]);
    if (piecesToFlip.length) {
      return true;
    }
  }

  return false
};



/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */

Board.prototype.placePiece = function (pos, color) {
   var x = pos[0], y = pos[1];
   if (this.validMove(pos,color)) {
     this.grid[x][y] = new Piece(color)
   } 
   else throw new Error("Invalid Move")
   
   var piecesToFlip = []
   for (let i = 0; i < Board.DIRS.length; i++) {
    piecesToFlip = piecesToFlip.concat(
      this._positionsToFlip(pos, color, Board.DIRS[i])
    ); 
   }

   piecesToFlip.forEach((flip_pos) => {
     piece = this.getPiece(flip_pos)
     piece.flip()
     this.grid[flip_pos[0]][flip_pos[1]] = piece
   })

};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};



module.exports = Board;
