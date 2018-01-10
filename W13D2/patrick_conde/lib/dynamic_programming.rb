class DynamicProgramming

  def initialize
    @blair_cache = {}
  end

  def blair_nums(n)
    return n if n <= 2
    arr = [1, 2]
    find_odd = k - 1
    odd = (1..find_odd*2).to_a.select { |e| e.odd? }[find_odd]
    arr << odd
    k = arr[-3..-1].reduce(:+)
    return blair_nums()
  end

  def frog_hops_bottom_up(n)

  end

  def frog_cache_builder(n)

  end

  def frog_hops_top_down(n)

  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
