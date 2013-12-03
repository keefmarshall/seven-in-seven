# You should be able to specify a tree like this: 

input_tree = {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 
  'uncle' => {'child 3' => {}, 'child 4' => {} } } }


class Tree
  attr_accessor :children, :node_name

  def initialize(full_tree)
    # no error checking! assumes passed-in hash conforms to spec
    # v. poor, must fix later

    # first need to get the top key - take the first one
    @node_name = full_tree.keys[0]
    
    # OK, now the value of that key is another hash, each key is a new child:
    @children = []
    full_tree[@node_name].each do |k,v|
      children.push(Tree.new(k => v))
    end    
  end
    
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

mytree = Tree.new(input_tree)

puts 'Visiting one node..'
mytree.visit {|t| puts t.node_name}
puts

puts 'Visiting all nodes..'
mytree.visit_all {|t| puts t.node_name}
