class Board

    def initialize(size)
        @size = size
        @grid = Array.new(size){Array.new(size)}
    end

    def size
        @size
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end
    

    def []=(pos, mark)
        @grid[pos[0]][pos[1]] = mark
    end


    def complete_row?(mark)
        @grid.any?{|row| row.all?{|ele| ele == mark}}
    end


    def complete_col?(mark)
        @grid.transpose.any? {|col| col.all?{|ele| ele == mark}}
    end 

    def complete_diag?(mark)
        arr = Array.new(2){Array.new}
        (0...@size).each do |i|
            arr[0] << @grid[i][i]
            arr[1] << @grid[i][-(i + 1)]
        end
        arr.any? {|row| row.all?{|ele| ele == mark}}
            
    end


    def winner?(mark)
        if complete_col?(mark) || complete_row?(mark) || complete_diag?(mark)
            return true 
        end
        return false
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end


    
end
