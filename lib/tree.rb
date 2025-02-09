require_relative 'node'

class Tree

 def initialize(array)
    @root = build_tree(array)
 end

 def build_tree(array)
   sorted_arr = array.sort.uniq
   node = Node.new(sorted_arr)

   root_index = (node.left + node.right) / 2
   root_node = sorted_arr[root_index]
 end

end
