def no_dupes?(arr)
    count = Hash.new(0)
    arr.each do |el|
        count[el] += 1
    end
    count.keys.select {|el| count[el] == 1}

end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |i|
        if arr[i] == arr[i + 1]
            return false 
        end
    end
    true
    
    
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hash = Hash.new {|h, k| h[k] = []}
    str.each_char.with_index do |char, i|
        hash[char] << i
    end

    hash
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    new_arr = []

    str.each_char.with_index do |char1, i1|
        char = str[i1]
        sub_arr = []
        str.each_char.with_index do |char2, i2|
            if char == str[i2] 
               sub_arr << char 
            end
            
        end
        new_arr << sub_arr
    end
    arr = new_arr.inject do |acc, el|
        if acc.length <= el.length
            el
        else
            acc
        end
    end

    arr.join("")

    # (0...str.length)

#     i = 0
#     while i < str.length
#         char = str[i]
#         j = 0
#         while j < str.length
#             if 

end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'



def bi_prime?(num)
    (2..num - 1).each do |i|
        return true if num % i == 0 && is_prime(i) && is_prime(num / i)
    end
    false
end

def is_prime(num)
    return true if num == 2  
    (2..num - 1).all? {|el| num % el != 0}
end


# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false



def vigenere_cipher(message, keys)
    # alp = "abcdefghijklmnopqrstuvwxyz"
    # new_str = ""
    # keys.each do |num|
    #     (0...(message.length - keys.length)).each do |j|
    #         index = alp.index(message[])


    alpha = ("a".."z").to_a
    message_new = ""
    message.each_char do |char|
        first_key = keys[0]
        keys = keys.rotate 
        index = (alpha.index(char) + first_key) % 26
        message_new += alpha[index]
    end
    message_new
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"



def vowel_rotate(str)
    vowels = "aeiou"

    # (str.length - 1..0).each do |i|
    #     (str.length - 1..0).each do |j|
    #         if j < i && vowels.include?(str[i]) && vowels.include?(str[j])
    all_vowels = []
                
    str.each_char do |char|
        all_vowels << char if vowels.include?(char)
    end
    all_vowels = all_vowels.rotate(-1)
    str.each_char.with_index do |char, i|
        if vowels.include?(char)

            str[i] = all_vowels.shift
        end
    end
    str
end


# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"


class String

    def select(&prc)
        new_str = ""
        prc ||= Proc.new {|ch| ch = false}
    
        self.each_char do |char|
            if prc.call(char)
                new_str += char
            end
        end
        new_str
    end

end




# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""



def multiply(a, b)
    return 0 if b == 0

    if  a > b && b < 0
        -(a + multiply(a, b.abs - 1))
    else
        a + multiply(a, b.abs - 1)
    end


end


# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18


def lucas_sequence(num)
    # new_arr = []
    return [] if num == 0
    return [2] if num == 1
    return [2, 1] if num == 2


    # lucas_sequence(num - 1) << lucas_sequence(num - 1)[-1] + lucas_sequence(num - 1)[-2] 

end

p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]


def prime_factorization(num)
    new_arr = []





end



# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]



