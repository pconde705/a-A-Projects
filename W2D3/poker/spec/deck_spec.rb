require "deck"
require "rspec"

describe Deck do
  subject(:deck) {Deck.new}
  describe "#initialize" do
    it "creates an array" do
      expect(deck.sets).to be_an_instance_of(Array)
    end
    it "contains 52 card objects" do
      expect(deck.sets.all? {|el| el.is_a?(Card)}).to eq true
    end
  end

  describe "#shuffle_deck" do
    let(:deck2) {Deck.new}
    it "shuffles the deck" do
      deck2.shuffle_deck
      expect(deck2.sets).not_to eq(deck.sets)
    end
  end

end
