class Array
    def uniq
        hash = {}
        self.each do |ele|
            hash[ele] = true
        end
        hash.keys
    end

    def two_sum

    end

    def my_transpose
    end
    

end

def stock_picker(arr)
    max = 0
    max_arr = []
    (0...arr.length).each do |i|
        (0...arr.length).each do |j|
             if j > i && arr[j] - arr[i] > max
                max = arr[j] - arr[i]
                max_arr = [i, j]
             end
        end
    end
      max_arr  
    
end

