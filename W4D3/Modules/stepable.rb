module Stepable
    def moves
        possible_movs = []
        move_diffs.each do |diffs|
            row = diffs[0] + self.pos[0]
            col = diffs[1] + self.pos[1]
            if self.valid_pos([row,col])
                possible_movs << [row, col]
            end
        end
        possible_movs
    end

   
end