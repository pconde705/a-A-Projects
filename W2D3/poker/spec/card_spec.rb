require "card"
require "rspec"


describe Card do
  subject(:card) {Card.new(:heart, :five)}
  describe "#intialize" do
    it "should have a face value and a suit" do
      expect(card.suit).to eq(:heart)
      expect(card.value).to eq(:five)
    end
  end
end
