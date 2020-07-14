require_relative 'piece.rb'
require_relative 'Stepable.rb'

class Pawn < Piece
    include Stepable

    def move_diffs
        [ [1,0], [1,1], [1,-1], [2,0] ]
    end

end



