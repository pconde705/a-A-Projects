require_relative "piece"

MOVES = [
  [-2, 1],
  [-2, -1],
  [-1, 2],
  [1, 2],
  [2, 1],
  [2, -1],
  [1, -2],
  [-1, -2]
]

class Knight < Piece

  attr_reader :symbol

  def initialize(team, board, position)
    @symbol = "H"
    @team = team
    @position
  end

end
