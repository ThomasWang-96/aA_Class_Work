
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


def arr_finder(arr) #tom thinks O(n^2), Greg thinks O(n^3) because he thinks sum is a loop
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
    largest_sum = arr[0]
    current_sum = 0
    i = 0

    temp_i = 0
    while i <= arr.length
        
        if i != arr.length
            current_sum += arr[i]
            # debugger
        else
            if current_sum > largest_sum
                largest_sum = current_sum
                current_sum = 0
            end
            temp = temp_i + 1
            i = temp_i
            temp_i = temp
        end
        i += 1
        # break
    end

    largest_sum
end

#____________________________________________________________

    # (1...arr.length - 1).each do |i|
    #     # if current_sum > largest_sum
    #     #     largest_sum = current_sum
    #     # end

    # end
    # largest_sum

#______________________________________________________________

#     longest = arr[0]
#     current = arr[0]

#     (1...arr.length).each do |i|
#         if arr[i] < 0
#             current += 0
#         else
#             current += arr[i]
#         end
#     end
# current
# end

list = [-5, -1, -3, 0, 7, 8] #----> 
p arr_finder_better(list)



# largest_sum = arr[0]
# (0...arr.length).each do |i|
#     current = 0
#     arr[i] + 
    



