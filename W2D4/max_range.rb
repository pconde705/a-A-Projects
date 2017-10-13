def windowed_max_range(array, window)
  current_max = 0
  array.each_index do |i|
    w = array[i...window + i]
    current_max = w.max - w.min if w.max - w.min > current_max
  end
  current_max
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
