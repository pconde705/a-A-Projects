require "towersofhanoi"
require "rspec"

describe Towers do
  subject(:tower) {Towers.new([[1,2,3], [], []])}
  describe "#initialize" do
    it "initializes two empty arrays and an array of towers" do
      expect(tower.array).to eq([[1,2,3], [], []])
    end
  end

  # describe "#prompt" do
  #   it "should call the prompt method and receive input" do
  #     expect(tower.prompt)
  #   end
  # end

  describe "#move_tower" do
    it "should shift element at 'from' array, and unshift it to 'to' array" do
      expect(tower.move_tower(0, 2)).to eq ([[2,3], [], [1]])
      # expect(tower.move_tower(0, 1)).to eq ([[2,3], [1], []])
    end
  end

  describe "#valid_move?" do
    let(:tower2) {Towers.new([[2,3], [1], []])}
    it "from tower block needs to be smaller than to tower block" do
      expect(tower2.valid_move?(0, 2)).to be true
      expect(tower2.valid_move?(1, 2)).to be true
      expect(tower2.valid_move?(1, 0)).to be true
      expect(tower2.valid_move?(0, 1)).to be false
      expect(tower2.valid_move?(2, 1)).to be false
      expect(tower2.valid_move?(2, 0)).to be false
      expect(tower2.valid_move?(3, 4)).to be false
    end
  end

  describe "#won?" do
    let(:tower3) {Towers.new([[], [], [1,2,3]])}
    let(:tower4) {Towers.new([[], [1,2,3], []])}
    it "Tells the player if they have won" do
      expect(tower3.array).to eq([[], [], [1,2,3]])
    end
    it "Tells the player if they have won" do
      expect(tower4.array).to eq([[], [1,2,3], []])
    end
  end


end
