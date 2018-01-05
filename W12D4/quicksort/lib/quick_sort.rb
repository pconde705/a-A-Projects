class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return if array.length < 2
    pivot = array.first
    left = array[1..-1].select { |e| e <= pivot }
    right = array[1..-1].select {|e| e > pivot}
    QuickSort.sort1(left) + [pivot] + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return if array.length < 2
    pivot = partition(array, start, length, &prc)
    left = pivot - start
    right = length - 1 - left
    sort2!(array, start, left, &prc)
    sort2!(array, pivot+1, right, &prc)
    array
  end

  def self.partition(array, start, length, &prc)
    # p array
    # p start
    # p length
    # p prc
    temp = start
    pivot = array[start]

    (start+1..(start+length)-1).each do |ind|
      if array[ind] <= pivot
        array[ind], array[temp+1] = array[temp+1], array[ind]
        temp += 1
      end
    end
    array[start], array[temp] = array[temp], array[start]
    temp
  end
end
