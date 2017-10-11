require_relative "piece"
# require_relative "board"


class King < Piece
  include SteppingPiece

  attr_reader :symbol, :position, :steps

  def initialize(team, board, position)
    @board = board
    @symbol = "K"
    @team = team
    @position = position
    @steps = [
      [0, -1],
      [0, 1],
      [-1, 0],
      [1, 0],
      [1, 1],
      [-1, -1],
      [-1, 1],
      [1, -1]
    ]
  end

end
