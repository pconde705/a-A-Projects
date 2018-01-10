class DynamicProgramming

  def initialize
    @blair_cache = {}
  end

  def blair_nums(n, arr = [1, 2])
    return n if n <= 2
    until arr.length == n
      find_odd = arr.length
      odds = (1..find_odd*3).to_a.select { |e| e.odd? }
      k = arr[-2..-1].reduce(:+) + odds[find_odd - 1]
      arr << k
      blair_nums(n, arr)
    end
    arr[n - 1]
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
