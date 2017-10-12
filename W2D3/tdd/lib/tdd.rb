class Tdd
  attr_reader :array

  def initialize(array = [1,2,1,5,-1,5, -2])
    @array = array
  end

  def my_uniq
   self.array.uniq
  end

  def two_sum
    result = []
    i = 0
    while i < self.array.length
      j = i
      while j < self.array.length
        result << [i, j] if self.array[i] + self.array[j] == 0
        j += 1
      end
      i += 1
    end
    result
  end

  def my_transpose
    self.array.transpose
  end

  def stock_picker
    result = []
    diff = 0
    (0...self.array.length - 1).each do |idx1|
      (idx1 + 1...self.array.length).each do |idx2|
        compare = self.array[idx2] - self.array[idx1]
        if compare > diff
          diff = compare
          result = [idx1, idx2]
        end
      end
    end
    result
  end

end
