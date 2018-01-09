  # There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative "bst_node"

class BinarySearchTree

  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(value)
    # p @root
    # p value
    return @root = BSTNode.new(value) if @root.nil?
    step = @root
    while true
      if value > step.value
        if step.right.nil?
          step.right = BSTNode.new(value)
          step.right.parent = step
          break
        else
          step = step.right
        end
      else
        if step.left.nil?
          step.left = BSTNode.new(value)
          step.left.parent = step
          break
        else
          step = step.left
        end
      end
    end
  end

  def find(value, tree_node = @root)
    return tree_node if value == tree_node.value
    return nil if tree_node.nil?

    step = tree_node
    while true
      # p value
      # p step.value
      if value > step.value
        if step.right.nil?
          return nil
        elsif step.right.value == value
          return step.right
        else
          step = step.right
        end
      else
        if step.left.nil?
          return nil
        elsif step.left.value == value
          return step.left
        else
          step = step.left
        end
      end
    end
  end

  def delete(value)
    # p @root
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    step = tree_node
    until step.right.nil?
      if step.value < step.right.value
        step = step.right
      end
    end
    step
  end

  def depth(tree_node = @root, count = 0)
    return 0 if tree_node.nil?
    return 0 if tree_node.left.nil? && tree_node.right.nil?

    step = tree_node
    array = [step]
    temp_arr = array

    while array.length != 0
      temp_arr.each do |child|
        array = []
        if child.left != nil
          array << child.left
        end
        if child.right != nil
          array << child.right
        end
      end
      temp_arr = array
      count += 1
    end
    count
  end

  def is_balanced?(tree_node = @root)
    right_count = depth(tree_node.right)
    left_count = depth(tree_node.left)
    left_count == right_count
  end

  def in_order_traversal(tree_node = @root, arr = [])
    step = tree_node

    step = left_order(step)
    arr << step.value
    arr << step.parent.value
    step = right_order(step)

    step = left_order(step)
    arr << step.value
    arr << step.parent.value

    step = up_the_ladder(step, arr)

    arr << step.value
    step = step.right
    step = left_order(step)

    arr << step.value
    step = up_the_ladder(step, arr)
    arr << step.value

    until step.right.nil?
      arr << step.right.value
      step = step.right
    end

    arr
  end


  private
  # optional helper methods go here:
  def left_order(step)
    until step.left.nil?
      step = step.left
    end
    step
  end

  def right_order(step)
    until step.right != nil
      step = step.parent
    end
    step.right
  end

  def up_the_ladder(step, arr)
    while arr.include?(step.value)
      step = step.parent
    end
    step
  end

end
