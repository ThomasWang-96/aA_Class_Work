require_relative 'piece.rb'
require_relative 'slideable.rb'

class Rook < Piece 
    include Slideable

    def symbol
        color == "white" ? "♖" : "♜"
    end

    def move_dirs
        horizontal_dirs
    end

end