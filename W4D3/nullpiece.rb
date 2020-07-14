require_relative 'piece.rb'

class Nullpiece < Piece
    include Singleton

    def initialize

    end

    def symbol
        " "
    end

    def color
        
    end


    def empty?
        true
    end
end
