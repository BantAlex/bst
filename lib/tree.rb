require_relative 'node'

class Tree

 def initialize(array)
    @root = build_tree(array)
 end

 def build_tree(array)
   sorted_arr = array.sort.uniq
   p sorted_arr
 end

end
