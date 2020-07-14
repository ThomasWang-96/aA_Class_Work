module Slideable 
  
    HORIZONTAL_DIRS = [ [1,0] ,[0,1], [-1,0], [0,-1] ]
    DIAGONAL_DIRS = [ [1,1], [-1,-1], [-1,1], [1,-1] ]
    
    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
#collect array of possible moves. iterate through rook move dirs(horizontal_dirs)
#for each one, past in to grow_unblocked
        all_possible_moves = []
        move_dirs.each do |move|
          all_possible_moves += grow_unblocked_moves_in_dir(move[0], move[1])
        end
        all_possible_moves
    end



    def grow_unblocked_moves_in_dir(dx,dy)
    #return an array of all possible positions for one direction
        poss_moves = []
        first = self.pos[0]
        last  = self.pos[1]
        loop do 
            first += dx
            last += dy
            break if @board.valid_pos?([first, last]) == false
            if @board[first,last] != nil?
                poss_move << [first, last]
            end
        end
        poss_moves
    end
end


