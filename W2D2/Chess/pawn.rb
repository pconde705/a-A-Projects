require_relative "piece"

MOVES = [
  [0, -1],
  [0, 1],
  [-1, 0],
  [1, 0],
  [1, 1],
  [-1, -1],
  [-1, 1],
  [1, -1]
]

class Pawn < Piece

  attr_reader :symbol

  def initialize(team, board, position)
    @symbol = "p"
    @team = team
    @position = position
  end
end
