require_relative 'lib/node'
require_relative 'lib/tree'

arr = [1,6,6,4,3,4,5,2,3,45,6,7,8,99,9,12]
tree = Tree.new(arr)
p tree.left
p tree.root_node
p tree.right
