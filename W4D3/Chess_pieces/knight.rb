require_relative 'piece.rb'
require_relative 'stepable.rb'

class Knight < Piece
    include Stepable

    def symbol
        color == "white" ? "♘" : "♞"
    end
    
    def move_diff
        [[2, 1], [2, -1], [1,2], [1,-2], [-2, 1], [-2, -1], [-1, -2], [-1, 2]]
    end
    
end
