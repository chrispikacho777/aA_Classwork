// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  const grid = [];
  for (let i = 0; i < 8; i++) {
    let arr = new Array(8);
    grid.push(arr);
  }

  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");

  return grid;
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

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  return (pos[0] >= 0 && pos[0] <= 7) && (pos[1] >= 0 && pos[1] <= 7);
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  let x = pos[0];
  let y = pos[1];
  if (this.isValidPos(pos)) {
    return this.grid[x][y];
  }

  throw new Error('Not valid pos!');
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let x = pos[0];
  let y = pos[1];
  if (this.isValidPos(pos)) {
    return this.grid[x][y] !== undefined && this.grid[x][y].color === color;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  let x = pos[0];
  let y = pos[1];
  if (this.isValidPos(pos)) {
    return this.grid[x][y] !== undefined;
  }

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
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip){
  if (!piecesToFlip) {
    piecesToFlip = [];
  } else {
    piecesToFlip.push(pos);
  }

  let x = pos[0];
  let y = pos[1];
  
  let newPos = [x+dir[0], y+dir[1]];
  if (!this.isValidPos(newPos)) {
    return [];
  } else if (!this.isOccupied(newPos)) {
    return [];
  } else if (this.isMine(newPos, color)) {
    return (piecesToFlip.length === 0) ? [] : piecesToFlip;
  } else {
    return this._positionsToFlip(newPos, color, dir, piecesToFlip);
  }

  



};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  // check valid pos
  // check if occupied
  // check _positionsToFlip for all dirs

  if (!this.isValidPos(pos) || this.isOccupied(pos)) {
    return false;
  }

  for (let i = 0; i < Board.DIRS.length; i++) {
    let flipArr = this._positionsToFlip(pos, color, Board.DIRS[i]);
    if (flipArr.length) {
      return true;
    }
  }
  return false;

};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)){
    throw new Error ("Invalid move!");
  }

  let x = pos[0];
  let y = pos[1];


  for (let i = 0; i < Board.DIRS.length; i++){
    let flipArr = this._positionsToFlip(pos, color, Board.DIRS[i]);
    if (flipArr.length){
      for (let j = 0; j < flipArr.length; j++){
        this.getPiece(flipArr[j]).flip();
      }
    }
  }
  this.grid[x][y] = new Piece(color);

};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let result = [];
  for(let i=0; i < this.grid.length; i++){
    for(let j=0; j < this.grid[i].length; j++){
      if (this.validMove([i,j], color)){
        result.push([i,j]);
      }
    }
  }
  return result;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length > 0;
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return !this.hasMove("white") && !this.hasMove("black");
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  for (let i = 0; i < this.grid.length; i++) {
    let string = "|";

    for (let j = 0; j < this.grid[i].length; j++) {
      if (this.getPiece([i, j])) {
        string += this.getPiece([i, j]).toString() + "|";
      } else {
        string += " |";
      }
    }
    console.log(string);
  }


};


// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  module.exports = Board;
}
// DON'T TOUCH THIS CODE