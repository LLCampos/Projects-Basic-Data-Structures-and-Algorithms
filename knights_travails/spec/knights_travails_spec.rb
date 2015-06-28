require 'knights_travails.rb'

describe 'Knight Class' do

  before do
    @knight1 = Knight.new([1, 1])
    @knight2 = Knight.new([4, 5])
  end

  context 'when parameters given are not valid' do
    it 'returns an error' do
      expect { Knight.new([9, 1]) }.to raise_error(ArgumentError)
    end
  end

  describe 'current_position' do
    it 'returns the correct current position' do
      expect(@knight1.current_position).to eql([1, 1])
      expect(@knight2.current_position).to eql([4, 5])
    end
  end



end

describe '#possible moves' do
  it 'returns the right possible moves' do
    expect(possible_movements([1, 1]).sort).to eql([[3, 2], [2, 3]].sort)
    expect(possible_movements([4, 5]).sort).to eql([[2, 6], [2, 4], [6, 4], [6, 6], [3, 7], [5, 7], [3, 3], [5, 3]].sort)
  end
end

describe '#knight_moves' do
  it 'returns track' do
    expect(knight_moves([3, 3], [4, 3])).to eql([[3, 3], [4, 5], [2, 4], [4, 3]])
  end
end