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

# returns the fastest path a knight can do from 'position' to 'final'
def knight_moves(position, final)
  position == final ? result = [final] : result = 0
  position = [position]
  queue = []
  while result == 0
    pm = possible_movements(position.last)
    if pm.include?(final)
      result = position << final
    else
      pm.each do |move|
        queue << (position + [move])
      end
      position = queue.delete_at(0)
    end
  end
  pretty_result(result)
end

# puts a user-friendly result
def pretty_result(result)
  puts "You made it in #{result.length - 1} moves! Here is your path:"
  result.each { |position| puts position.to_s }
end