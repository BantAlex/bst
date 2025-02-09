class Node
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
    @left = 0
    @right = data.length - 1
    #?Comparable module-compare nodes using their data attribute ?
  end

end
