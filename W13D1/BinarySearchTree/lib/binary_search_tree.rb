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
    if @root.nil?
      @root = BSTNode.new(value)
    elsif @root.left.nil? && @root.right.nil? && @root > value
      @root.left = BSTNode.new(value)
    elsif @root.left.nil? && @root.right.nil? && @root < value
      @root.right = BSTNode.new(value)
    end
  end

  def find(value, tree_node = @root)
  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

end
