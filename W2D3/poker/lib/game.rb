class Game

  attr_reader :pot, :players

  def initialize(*players)
    @pot = 0
    @players = players
  end


end
