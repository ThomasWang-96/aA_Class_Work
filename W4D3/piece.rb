class Piece
    attr_reader :color, :board, :pos

    def initialize(color, board, pos)
        @color = color 
        @board = Board.new
        @pos = pos
    end

    def to_s
        " #{self.symbol} "
    end

    def start_pos=(pos, name)
        row, column = pos
        @board[row][column] = name
    end

    def empty?
        false
    end

    def pos=(val)
        @board[pos] = val
    end

    def symbol
        raise 'make your symbol'
    end
    

end