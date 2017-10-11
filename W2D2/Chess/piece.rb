module SlidingPiece
DIRECTION = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0],
  down_right: [1, 1],
  up_left: [-1, -1],
  up_right: [-1, 1],
  down_left: [1, -1]
}

  def moves
    poss_moves = []

  end

end

module SteppingPiece
  def moves
    poss_moves = []
    piece_pos = self.position
    self.steps.each do |step|
      x = step[0] + piece_pos[0]
      y = step[1] + piece_pos[1]
      new_pos = [x, y]
      if @board.valid_move?(new_pos) && @board.in_bounds(new_pos)
        poss_moves << new_pos
      end
    end
    p "----------------------"
    poss_moves
  end
end


class Piece
  def initialize(team = nil)
    @team = team
    @position
    @board
  end
end

#
# board = Board.new
# p king = King.new(:team1, board, [7, 2])
# p king.moves
