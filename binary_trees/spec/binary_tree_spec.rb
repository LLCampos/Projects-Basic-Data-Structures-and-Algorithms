require 'binary_tree.rb'

describe '#depth_search' do

  before do
    @tree = build_tree([5, 8, 6, 2, 4, 1, 3, 11, 9])
  end

  it 'should find the right nodes' do
    expect(depth_search(@tree, 5)).to eql(@tree)
    expect(depth_search(@tree, 2)).to eql(@tree.left)
    expect(depth_search(@tree, 1)).to eql(@tree.left.left)
    expect(depth_search(@tree, 4)).to eql(@tree.left.right)
    expect(depth_search(@tree, 8)).to eql(@tree.right)
    expect(depth_search(@tree, 6)).to eql(@tree.right.left)
    expect(depth_search(@tree, 11)).to eql(@tree.right.right)
    expect(depth_search(@tree, 9)).to eql(@tree.right.right.left)
  end

  it "sould return nil if it don't find the element" do
    expect(depth_search(@tree, 20)).to eql(nil)
  end

end