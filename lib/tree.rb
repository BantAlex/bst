require_relative 'node'

class Tree
  attr_reader :left, :right, :root_node

 def initialize(array)
    @root = build_tree(array)
 end

 def build_tree(array, left = nil , right = nil)
   sorted_arr = array.sort.uniq
   node = Node.new(sorted_arr)
   return if node.left > node.right
   p sorted_arr

  #  root_index = (node.left + node.right) / 2 #*This is just array.length / 2...
   root_index = sorted_arr.length / 2
   @root_node = sorted_arr[root_index]

   @left = sorted_arr[0...root_index]
   @right = sorted_arr[root_index + 1..sorted_arr.length - 1] #!I'm afraid to test this@
 end

end
