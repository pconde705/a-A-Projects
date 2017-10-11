require_relative "piece"

class Rook < Piece
include SlidingPiece
  attr_reader :symbol

  def initialize(team, board, position)
    @symbol = "R"
    @team = team
    @position = position
  end

end
