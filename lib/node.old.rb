class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = 0
    @right = 0
    #?Comparable module-compare nodes using their data attribute ?
  end

end
