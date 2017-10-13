#O(n^2)

def bad_two_sum?(arr, target)
  arr.each_with_index do |el1, i|
    arr.each_with_index do |el2, j|
      unless i == j
        return true if el1 + el2 == target
      end
    end
  end
  false
end

def okay_two_sum?(arr, target)
  arr.sort!
  i = 0
  j = arr.length - 1
  until i == j
    if arr[i] + arr[j] == target
      return true
    elsif arr[i] + arr[j] > target
      j -= 1
    else
      i += 1
    end
  end
  false
end

def hash_map?(arr, target)
  hash = Hash.new(0)
  arr.each do |el|
    hash[el] += 1
  end
  arr.each do |el|
    num = target - el
    if num == el
      return true if hash[num] == 2
    else
      return true if hash[num] == 1
    end
  end
  false
end

p okay_two_sum?([2, 1, 4, 6, 7], 6)
p"-----------"
p okay_two_sum?([0, 1, 2, 5, 4, 7], 10)
#
# p hash_map?([0, 1, 4, 5, 7], 6)
# p "-------"
# p hash_map?([0, 1, 4, 5, 5, 7], 10)
