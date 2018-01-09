# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to



def install_order(arr)
  p arr

  flatten_arr = arr.flatten
  max_id = flatten_arr.sort[-1]
  new_arr = []
  (1..max_id).each do |ind|
    new_arr = []
  end
end
