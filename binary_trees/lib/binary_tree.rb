class Node
  attr_accessor :value, :parent, :right, :left

  def initialize(value = nil, parent = nil, left = nil, right = nil)
    @value = value
    @parent = parent
    @right = right
    @left = left
  end

  def add(n)
    if n >= value
      @right.nil? ? @right = Node.new(n, self) : @right.add(n)
    else
      @left.nil? ? @left = Node.new(n, self) : @left.add(n)
    end
  end
end

# builds a binary search tree from an array
def build_tree(arr)
  arr.each do |n|
    if defined? @tree
      @tree.add(n)
    else
      @tree = Node.new(n)
      puts @tree.value
    end
  end
  @tree
end

# searchs all the nodes but the root
def breadth_search_(node, n, queue)
  if !node.left.nil? && node.left.value == n
    node.left
  elsif !node.right.nil? && node.right.value == n
    node.right
  else
    queue << node.left unless node.left.nil?
    queue << node.right unless node.right.nil?
    if queue == []
      nil
    else
      nextx = queue.delete_at(0)
      breadth_search_(nextx, n, queue)
    end
  end
end

# starts breadth search by looking at the root of the tree
def breadth_search(root, n, queue = [])
  if root.value == n
    root
  else
    breadth_search_(root, n, queue)
  end
end


def depth_search(tree, n)
  @stack = [tree]
  @visited = [tree]
  @result = 0
  while @result == 0
    node = @stack.last
    if node.nil? || node.value == n
      @result = node
    elsif !@visited.include?(node.left) && !node.left.nil?
      @stack << node.left
      @visited << node.left
    elsif !@visited.include?(node.right) && !node.right.nil?
      @stack << node.right
      @visited << node.right
    else
      @stack.pop
    end
  end
  @result
end
