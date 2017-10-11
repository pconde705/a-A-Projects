require_relative "piece"

class Queen < Piece
  include SlidingPiece

  attr_reader :symbol

  def initialize(team, board, position)
    @symbol = "Q"
    @team = team
    @position = position
  end

end
