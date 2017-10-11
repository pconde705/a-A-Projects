require_relative "piece"
require_relative "null_piece"

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
    @grid[0..1].each do |array|
      array.map! { |e| e = Piece.new }
    end
    @grid[-2..-1].each do |array|
      array.map! { |e| e = Piece.new }
    end
    @grid[2...6].each do |array|
      array.map! { |e| e = NullPiece.new }
    end
  end

  def move_piece(start_pos, end_pos)
    begin
      raise Exception.new("That piece is null") if self[start_pos].is_a?(NullPiece)
      raise Exception.new if !valid_move?(end_pos)
    # rescue Exception

    end
  end

  def in_bounds(pos)
    return false if self[pos].nil?
    true
  end

  def valid_move?(pos)
  end
end
