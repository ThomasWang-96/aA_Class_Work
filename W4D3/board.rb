require_relative 'piece'
class Board
    
    def initialize
        @grid = Array.new(8) {Array.new(8, nil)}
    end
    
    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

   def move_piece(start_pos, end_pos)
        if self[start_pos] == nil
            raise 'There is no piece here'
        elsif self[end_pos] != nil
            raise 'There is a piece here already'
        else
            self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
        end
   end
   

   def vaild_pos?(pos)
    pos.each do |p|
        return false if p < 0 || p > 7
    end
    return true
   end


end