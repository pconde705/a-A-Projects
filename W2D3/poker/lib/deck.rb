require_relative "card"

module SuitsAndSymbols

  SUITS = {
    hearts: "\u2665",
    clubs: "\u2663",
    spades: "\u2660",
    diamond: "\u2666"
  }

  VALUES = {
    two: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9,
    ten: 10,
    jack: 11,
    queen: 12,
    king: 13,
    ace: 14
  }

  def get_suits
    SUITS
  end

  def get_values
    VALUES
  end

end

class Deck
  include SuitsAndSymbols
  attr_accessor :sets

  def initialize
    @sets = populate
    shuffle_deck
  end

  def shuffle_deck
    @sets.shuffle!
  end

  private
  def populate
    result = []
    get_suits.keys.each do |suit|
      get_values.keys.each do |value|
        result << Card.new(suit, value)
      end
    end
    result
  end


end
