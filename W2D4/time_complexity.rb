LIST = [2, 3, -6, 7, -6, 7]


# O(n^2)
def my_min(list)
  result = list.first
  list.each do |el|
    list.each do |el2|
      result = el if el < el2 && el < result
    end
  end
  result
end

def my_min2(list)
  result = list.first
  list.each do |el|
    result = el if el < result
  end
  result
end

def largest_contiguous_subsum(list)
  array = []
  list.each_index do |i|
    list.each_index do |j|
      array << list[i..j] unless list[i..j].empty?
    end
  end
  max = list.first
  array.each do |sub_arr|
    max = sub_arr.reduce(:+) if sub_arr.reduce(:+) > max
  end
  max
end

def largest_contiguous_subsum2(list)
  largest = list.first
  current = list.first
  list[1..-1].each do |el|
    if current < 0
      current = el
    else
      current += el
      largest = current if largest < current
    end
  end
  largest
end

p largest_contiguous_subsum2(LIST)
