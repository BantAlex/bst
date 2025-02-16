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
      root_node = Node.new(arr[root_index]) #*This should be a local variable! Otherwise it will update itself we're
      #!going to have only one output
      root_node.left = build_tree(arr,left,root_index - 1) #*We use the whole arr because the array is sorted.
      #*We don't need to split it in half every recur. Now we take the last index of the left array instead of whole.
      root_node.right = build_tree(arr,root_index + 1,right)
      return root_node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(node = @root,value)
    return "Wrong input!" if value.class != Integer

   if value == node.data
    p "This node already exists"
    return node
   end

   if value > node.data
    if !node.right #?there's probably a better way to deal wit that instead of nesting if statements
      node.right = Node.new(value)
    else
      node.right = insert(node.right,value)
    end
   end

   if value < node.data
      if !node.left #?there's probably a better way to deal wit that instead of nesting if statements
        node.left = Node.new(value)
      else
        node.left = insert(node.left,value)
      end
   end
   return node
  end

  # def insert_non_rec(value) #not working yet
  #   return "Wrong input!" if value.class != Integer
  #   current_node = @root
  #   new_node = Node.new(value)

  #   until !current_node.left && !current_node.right
  #     current_node = current_node.left if value < current_node.data
  #     current_node = current_node.right if value > current_node.data
  #   end

  #   p "This value already exists" if current_node.data == value

  #   current_node.left = new_node if value < current_node.data
  #   current_node.right = new_node if value > current_node.data

  # end

  def delete(value)

  end

  def find(value)
    #?Maybe while making insert, make it return the node if it already exists and use it here
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
