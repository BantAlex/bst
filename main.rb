require_relative 'lib/node'
require_relative 'lib/tree'

arr = [1,6,6,4,3,4,5,2,3,45,6,7,8,99,9,12]
#     [1,2,3,4,5,6,7,8,9,12,45,99]
tree = Tree.new(arr)
tree.insert(-9)
p tree.pretty_print
tree.insert(5)
p tree.pretty_print
tree.insert(100) #it deletes the right of 45
p tree.pretty_print
tree.insert(101)
p tree.pretty_print
tree.insert(26)
p tree.pretty_print
tree.insert(-102)
p tree.pretty_print
