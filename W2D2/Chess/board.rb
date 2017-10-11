require_relative "piece"
require_relative "null_piece"
require_relative "rook"
require_relative "knight"
require_relative "king"
require_relative "queen"
require_relative "bishop"
require_relative "pawn"

# require "byebug"

class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    populate
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def populate
    @grid[0] = [Rook.new(:team1, @board, [0, 0]), Knight.new(:team1, @board, [0, 1]),
      Bishop.new(:team1, @board, [0, 2]), Queen.new(:team1, @board, [0, 3]),
      King.new(:team1, @board, [0, 4]), Bishop.new(:team1, @board, [0, 5]),
      Knight.new(:team1, @board, [0, 6]), Rook.new(:team1, @board, [0, 7])]

    @grid[1].each_with_index do |empt, idx|
      Pawn.new(:team1, @board, [1, idx])
    end

    @grid[6].each_with_index do |empt, idx|
      Pawn.new(:team1, @board, [6, idx])
    end

    @grid[7] = [Rook.new(:team1, @board, [7, 0]), Knight.new(:team1, @board, [7, 1]),
      Bishop.new(:team1, @board, [7, 2]), King.new(:team1, @board, [7, 3]),
      Queen.new(:team1, @board, [7, 4]), Bishop.new(:team1, @board, [7, 5]),
      Knight.new(:team1, @board, [7, 6]), Rook.new(:team1, @board, [7, 7])]

    @grid[2...6].each do |array|
      array.map! { NullPiece.new }
    end
  end

  def move_piece(start_pos, end_pos)
    begin
      raise Exception.new("That piece is null") if self[start_pos].is_a?(NullPiece)
      # raise Exception.new if !valid_move?(end_pos)
    end

    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

  def in_bounds(pos)
    return false if pos[0] > 7 || pos[0] < 0 || pos[1] > 7 || pos[1] < 0
    true
  end

  def valid_move?(pos)
    true
  end
end


board = Board.new
p king = King.new(:team1, board, [7, 2])
p king.moves
