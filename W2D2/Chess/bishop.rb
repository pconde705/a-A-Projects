require_relative "piece"

class Bishop < Piece
include SlidingPiece

  attr_reader :symbol

  def initialize(team, board, position)
    @symbol = "B"
    @team = team
    @position = position
  end

end
