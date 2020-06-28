
require 'byebug'

def my_min(array)
    min = array[0]
    array.each do |el|
        if min > el
            min = el 
        end
    end
    min
end

#this my_min is O(n) because we itirate only once n times n being the length



# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

def my_min_nest(arr) # n^2
    (0...arr.length).each do |i|
        if arr[i] < my_min(arr[i + 1..-1])
           return arr[i] 
        end
    end
end


# p my_min_nest(list)

# def my_another_min


def arr_finder(arr) 
    new_arr = []
    (0...arr.length).each do |i|
        new_arr << arr[i]
        (0...arr.length).each do |j|
            new_arr << arr[i..j].sum if j > i
        end
    end
    new_arr.max
end

# list = [5, 3, -7]
# p arr_finder(list)

def arr_finder_better(arr)
    return 0 if arr.length == 0
    opt = [arr.first]

    (1...arr.length).each do |i|
        opt[i] = [opt[i - 1], 0].max + arr[i]
    end
    opt.max
end


list = [-5, -3, -1]
p arr_finder_better(list)




