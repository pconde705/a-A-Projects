require "game"
require "rspec"


describe Game do
  subject(:game) {Game.new}
  describe "#initialize" do
    it "Initializes the players" do
      expect(game.players.all? {|el| el.is_a?Player}).to eq true
    end
    it "Initalizes the pot to 0" do
      expect(game.pot).to eq(0)
    end
  end
end
