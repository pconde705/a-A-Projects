require_relative "board"
require_relative "cursor"
require "colorize"
# IF YOU REQUIRE_RELATIVE IN TWO FILES OF EACH OTHER
# ALL MANNER OF CRAZY STARTS HAPPENING. DON'T DO IT!!

class Display

  def initialize(board = Board.new)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    system("clear")
    while true
      x = @cursor.cursor_pos[0]
      y = @cursor.cursor_pos[1]
      puts "---------------------------------"
      @board.grid.each_with_index do |row, idx|
        row.each_with_index do |el, ind|
          if idx == x && ind == y && !el.is_a?(NullPiece)
            print "|"
            print " P ".colorize(:color => :white, :background => :light_blue)
          elsif idx == x && ind == y && el.is_a?(NullPiece)
            print "|"
            print "   ".colorize(:background => :light_blue)
          elsif el.is_a?(NullPiece)
            print "|   "
          else
            print "|"
            print " P "
          end
        end
        print "|"
        puts "\n---------------------------------"
      end
      key_entry = @cursor.get_input
      @cursor.cursor_pos = key_entry
      system("clear")
    end
    # @board.move_piece(start, ending)

  end
end


board = Board.new
Display.new(board).render
# p Display.new(board)
