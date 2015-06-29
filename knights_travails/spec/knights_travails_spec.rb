require 'knights_travails.rb'


describe '#possible moves' do
  it 'returns the right possible moves' do
    expect(possible_movements([1, 1]).sort).to eql([[3, 2], [2, 3]].sort)
    expect(possible_movements([4, 5]).sort).to eql([[2, 6], [2, 4], [6, 4], [6, 6], [3, 7], [5, 7], [3, 3], [5, 3]].sort)
  end
end

describe '#knight_moves' do
  it 'returns path' do
    expect(knight_moves([3, 3], [4, 3])).to eql([[3, 3], [1, 2], [2, 4], [4, 3]])
    expect(knight_moves([1, 1], [4, 4])).to eql([[1, 1], [2, 3], [4, 4]])
    expect(knight_moves([4, 4], [1, 1])).to eql([[4, 4], [2, 3], [1, 1]])
  end
end