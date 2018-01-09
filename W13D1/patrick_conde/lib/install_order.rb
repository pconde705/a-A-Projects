# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to
require_relative 'graph'
require_relative 'topological_sort'



def install_order(arr)
  p arr

  package_ids = []
  arr.each do |sub_arr|
    package_ids << sub_arr[0]
  end
  max_id = package_ids.sort[-1]

  new_arr = []

  (1..max_id).each do |ind|
    new_arr << Vertex.new(ind)
  end

  # edges = []
  # arr.each do |sub_arr|
  #   edges << Edge.new(sub_arr[1], sub_arr[0])
  # end

  topological_sort(new_arr).map do |vertex|
    vertex.value
  end
end
