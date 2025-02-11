require_relative 'node'

class Tree
  attr_accessor :root_node

 def initialize(array)
   sorted_arr = array.sort.uniq
   @root_node = build_tree(sorted_arr,0,sorted_arr.length - 1)
 end

 def build_tree(array, left, right)
   return nil if left > right
   p left
   p right

   root_index = (left + right) / 2
   @root_node = Node.new(array[root_index])

   @root_node.left = array[0...root_index]
   @root_node.right = array[root_index + 1..array.length - 1]

   p  @root_node.left
   p  @root_node
   p  @root_node.right

  #  left = build_tree(@root_node.left,left,root_index - 1)
  #  right = build_tree(@root_node.right,root_index + 1,right)

   @root_node.left = build_tree(array,left,root_index - 1)
   @root_node.right = build_tree(array,root_index + 1,right)
 end

end
