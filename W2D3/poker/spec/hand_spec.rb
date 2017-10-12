require "hand"
require "rspec"

describe Hand do
  subject(:hand) {Hand.new(Deck.new)}
  describe "#initialize" do
    it "Creates a hand array of five cards" do
      expect(hand.cards.length).to eq(5)
    end
    it "Takes in a deck object" do
      expect(hand.deck).to be_an_instance_of(Deck)
    end
  end
end
