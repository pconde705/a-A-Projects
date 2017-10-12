class Player

    attr_reader :hand, :pot, :deck
    def initialize(deck, pot)
      @hand = Hand.new(deck)
      @pot = pot
    end


end
