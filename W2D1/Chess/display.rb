require_relative "board"
require_relative "cursor"
require "colorize"
# IF YOU REQUIRE_RELATIVE IN TWO FILES OF EACH OTHER
# ALL MANNER OF CRAZY STARTS HAPPENING. DON'T DO IT!!

class Display

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
  end

  def render

  end
end


board = Board.new
p Display.new(board).render
# p Display.new(board)
