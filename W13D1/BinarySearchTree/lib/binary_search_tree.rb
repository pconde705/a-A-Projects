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
    # p value
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

  def depth(tree_node = @root)
    return 0 if tree_node.nil?
    count = 0
    
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

end
