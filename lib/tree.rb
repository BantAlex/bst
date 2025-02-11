class Tree
  attr_accessor :root

  def initialize(arr)
    sorted = arr.sort.uniq
    @root = build_tree(sorted,left,right)
  end

  def build_tree(arr,left,right)
      return @root
  end

  def insert

  end

  def delete

  end

  def find

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
