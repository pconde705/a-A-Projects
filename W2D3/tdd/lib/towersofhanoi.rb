class Towers
  attr_reader :array
  def initialize(array)
    @array = array
  end

  def prompt
    until won?
      puts "From which tower?"
      answer = gets.chomp.to_i
      puts "To which tower?"
      answer2 = gets.chomp.to_i
      move_tower(answer, answer2)
      puts @array
    end
  end

  def move_tower(from, to)
    if valid_move?(from, to)
      block = @array[from].shift
      @array[to].unshift(block)
    end
    @array
  end

  def valid_move?(from, to)
    return false if from > 2 || to > 2
    if self.array[to][0].nil? && self.array[from][0].nil?
      return false
    elsif self.array[to][0].nil? && !self.array[from][0].nil?
      return true
    elsif !self.array[to][0].nil? && self.array[from][0].nil?
      return false
    elsif self.array[from][0] < self.array[to][0]
      return true
    else
      false
    end
  end

  def won?
    return true if @array == [[], [], [1,2,3]] || @array == [[], [1,2,3], []]
    false
  end

end
