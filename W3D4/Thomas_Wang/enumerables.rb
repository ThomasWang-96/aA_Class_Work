class Array
    
    def my_each(&prc)
    
        i = 0 
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        # j = 0
        # while j < self.length
        #     prc.call(self[j])
        #     j += 1
        # end

    end


    def my_select(&prc)
        arr = []
        self.my_each do |i|
            arr << i if prc.call(i)
        end
        arr
    end


    def my_reject(&prc)
        
        arr = []
        self.my_each do |i|
            arr << i if !prc.call(i)
        end
        arr


    end

    def my_any?(&prc)
        self.my_each do |i|
            return true if prc.call(i)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |i|
            return false if !prc.call(i)
        end
        true
    end


    def my_flatten
        return [self] if !self.is_a?(Array)

        new_arr = []
        self.my_each do |el|
            if el.is_a?(Array)
                new_arr += el.my_flatten
            else
                new_arr << el
            end
        end
        new_arr  
    end

    def my_zip(*arr)

        new_arr = Array.new(self.length) {Array.new(arr.length + 1)}
        p new_arr

        (0...self.length).each do |i|
            new_arr[i][0] = self[i]
        end
            (0...arr.length).each do |i|
                (0...arr[0].length).each do |j|
                    if j < self.length
                    
                    new_arr[j][i + 1] = arr[i][j]
                    end
                
            end
            end
        new_arr
    end


    def my_rotate(shifted = 1)
        if shifted > 0
            shifted.times do
                first_el = self.shift
                self << first_el
            end

        else 
            shifted.abs.times do
                last_el = self.pop
                self.unshift(last_el)
            end
        end

        self 
  

    end

# hey thomas you can type it cause its cutting off 
    def my_join(separator = "")
        new_str = ""
        self.each_with_index do |char, idx| 
            if idx < self.length - 1
                new_str += (char + separator)
            else
                 new_str += char
            end 
        end
            new_str
    end

    # i think im done, can you check Thomas


    def my_reverse
        new_arr = []
        duped = self.dup
        until new_arr.length == self.length
            last_el = duped.pop
            new_arr << last_el        
        end
        new_arr     
    end



end

#return_value = [1, 2, 3].my_each {|num| p num}