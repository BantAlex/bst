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
      root_node = Node.new(arr[root_index]) #*This should be a local variable! Otherwise it will update itself and we're
      #*going to have only one output

      root_node.left = build_tree(arr,left,root_index - 1) #*We use the whole arr because the array is sorted.
      #*We don't need to split it in half every recur. Now we take the last index of the left array instead of whole.

      root_node.right = build_tree(arr,root_index + 1,right)
      return root_node
  end

  def insert(node = @root,value)
    return "Wrong input!" if value.class != Integer

   if value == node.data
    p "#{value} exists!"
    return node #this probably won't work with #find

   elsif value > node.data
    if !node.right #?there's probably a better way to deal with that instead of nesting if statements
      node.right = Node.new(value)
    else
      node.right = insert(node.right,value)
    end

   else
    if !node.left #?there's probably a better way to deal with that instead of nesting if statements
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
  #
  def get_successor(current) #It works when the right child is not empty(thats what we want for #delete)
    current = current.right
    while current && current.left
      current = current.left
    end
    return current
  end

  def delete(node = @root,value)
    return "Wrong input!" if value.class != Integer
    return "#{value} is not found in the tree" if !find(value)
    #we should maybe use #find here to put out a message if the value does not exist in the tree
    return node if !node
    if node.data > value
      node.left = delete(node.left,value)
    elsif node.data < value
      node.right = delete(node.right,value)
    else #if node matches the given key-thats what we want
      return node.right if !node.left
      return node.left if !node.right
      successor = get_successor(node)
      node.data = successor.data
      node.right = delete(node.right,node.data)
    end
    return node
  end

  def find(node = @root, value)
    #?Maybe while making insert, make it return the node if it already exists and use it here
   if !node
     p "#{value} is not found in the tree"
     return false
   end
    if value > node.data
      node = find(node.right,value)
    elsif value < node.data
      node = find(node.left,value)
    else
      p node
     return node
    end
  end

  def level_order_it
    return "Tree is empty" if !@root

    queue = [@root]
    values = []

    until queue.empty? #*Loop until the queue is empty
      #*So that means, that the loop will stop when all the available nodes are visited
      current = queue.shift #*Dequeue the first element and make it the current node
      #*This puts the first element of the queue array into the current var AND removes it from the array

      yield current.data if block_given?
      values << current.data

      queue.push(current.left) if current.left #*Enque the children of current
      queue.push(current.right) if current.right #*Enque the children of current
    end
    values unless block_given?
  end

  def level_order_rec(queue = [@root], values = [])
    return "Tree is empty" if !@root
    return values if queue.empty?

    current = queue.shift

    yield current.data if block_given?
    values << current.data

    queue.push(current.left) if current.left
    queue.push(current.right) if current.right

    level_order_rec(queue,values)
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
    do_smth if !balanced?
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end
