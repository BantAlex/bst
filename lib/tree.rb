require_relative 'node'

class Tree
  attr_accessor :root

  def initialize(arr)
    sorted = arr.sort.uniq
    @root = build_tree(sorted,0,sorted.length - 1) #Array - first index - last idnex
  end

  def build_tree(arr,left,right)
      return nil if left > right
      root_index = (left + right)/2
      root_node = Node.new(arr[root_index]) #!This should be a local variable! Otherwise it will update itself we're
      #!going to have only one output
      root_node.left = build_tree(arr,left,root_index - 1) #We use the whole arr because the array is sorted.
      #We don't need to split it in half every recur. Now we take the last index of the left array instead of whole.
      root_node.right = build_tree(arr,root_index + 1,right)

      return root_node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert

  end

  def delete

  end

  def find

  end

  def level_order

  end

  def inorder

  end

  def preorder

  end

  def postorder

  end

  def hight

  end

  def depth

  end

  def balanced?

  end

  def rebalance

  end

end
