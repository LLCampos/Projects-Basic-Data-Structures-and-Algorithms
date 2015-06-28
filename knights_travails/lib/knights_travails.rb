
class Knight
  attr_accessor :current_position, :possible_moves

  def initialize(current_position)
    raise ArgumentError, 'Argument is not valid' unless all_possible_positions.include?(current_position)
    @current_position = current_position
    @possible_moves = possible_movements(@current_position)
  end

end

# returns ana array with all the possivle positions
def all_possible_positions
  result = []
  (1..8).each do |x|
    (1..8).each do |y|
      result << [x, y]
    end
  end
  result
end

# returns an array with the possible positions the knight could move to
def possible_movements(current_position)
  result = []
  [-2, -1, 1, 2].each do |x|
    [-2, -1, 1, 2].delete_if { |n| n.abs == x.abs }.each do |y|
      v = current_position[0] + x
      h = current_position[1] + y
      result << [v, h] if (1..8).include?(v) && (1..8).include?(h)
    end
  end
  result
end

def knight_moves(position, final, queue = [], track = [])
  track << position
  if position == final
    track
  else
    a = possible_movements(position).find do |move|
      move == final
    end
    if a
      track << a
      track
    else
      possible_movements(position).each do |move|
        queue << move
      end
      next_ = queue.delete_at(0)
      knight_moves(next_, final, queue, track)
    end
  end
end