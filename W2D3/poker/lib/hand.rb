require_relative "deck"

class Hand

  # RANKS
  attr_reader :deck, :cards
  def initialize(deck)
    @deck = deck
    @cards = @deck.sets.shift(5)

  end

  def find_hand
    # best_hand = []
    # case @cards
    # when @cards.suit.all? {|a| }
    #
    # end

  end


end
