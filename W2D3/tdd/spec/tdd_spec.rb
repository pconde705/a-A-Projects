require 'rspec'
require 'tdd'

describe Tdd do
  subject(:array) {Tdd.new}
  describe "#my_uniq" do
    it "removes duplicates" do
      expect(array.my_uniq).to eq([1,2,5,-1, -2])
    end
  end

  describe "#two_sum" do
    it "finds elements whose positions sum to zero" do
      expect(array.two_sum).to eq([[0, 4], [1, 6], [2, 4]])
    end
  end

  describe "#my_transpose" do
    let(:array2) {Tdd.new([[0, 1, 2],[3, 4, 5],[6, 7, 8]])}
    it "transposes a two-dimensional array of elements" do
      expect(array2.my_transpose).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end
  end

  describe "#stock_picker" do
    let(:array3) {Tdd.new([45,200,73,12,16,99])}
    it "outputs the indecies for the optimal buying and selling days depending on stock price" do
      expect(array3.stock_picker).to eq([0,1])
    end
  end
end
