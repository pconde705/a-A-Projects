require "rspec"
require "player"

describe Player do
  subject(:player1) {Player.new(Deck.new, 10000)}
  describe "#initialize" do
    it "starts a player off with a hand and a pot" do
      expect(player1.hand).to be_an_instance_of(Hand)
      expect(player1.pot).to be_an_instance_of(Fixnum)
    end
  end

  
end
