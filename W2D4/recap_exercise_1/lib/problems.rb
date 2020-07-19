# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    pair_arr = []
    vowels = ["a","e","i","o","u"]
    words.each_with_index do |word_1, i_1|
        words.each_with_index do |word_2, i_2|
            if i_2 > i_1
                pair = word_1 + " "+ word_2
                if vowels.all? {|char|pair.include?(char)}
                    pair_arr << pair 
                end
            end
        end
    end
    pair_arr
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each do |i|
        if num % i == 0
            return true
        end
    end
    false

end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    # arr = []
    # (0...str.length - 1).each do |i|
    # #    bigrams.select {|el|el == (str[i] + str[i + 1])}
    #     arr << str[i] + str[i + 1]
    # end

    bigrams.select {|el| str.include?(el)}

end


class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        prc ||= Proc.new {|k, v| k == v}
        new_hash = {}

        self.each do |k ,v|
            if prc.call(k, v)
                new_hash[k] = v
            end      
        end
        new_hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        # sub = []
        # if length == nil 
        #     self.each_char.with_index do |char_1, i_1|
        #         new_sub = char_1
        #         self.each_char.with_index do |char_2, i_2|
        #             if i_2 > i_1
        #                 new_sub += char_2
        #                 sub << new_sub
                    

        sub = []
        (0...self.length).each do |i_1|
            (i_1...self.length).each do |i_2|
                substr = self[i_1..i_2]
                if length == nil 
                    sub << substr
                elsif substr.length == length
                    sub << substr
                end
            end
        end
        sub


    end

        # sub = []
        # (0...self.length).each do |i_1|
        #     (i_1...self.length).each do |i_2|
        #         substring = self[i_1..i_2]
        #         if length = nil 
        #             sub << substring
        #         elsif substring.length == length
        #             sub << substring 
        #         end
        #     end
        # end
        # sub
        

    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alp = "abcdefghijklmnopqrstuvwxyz"
        new_str = ""
        self.each_char do |char|
            index = alp.index(char)
            shifted_index  = (index + num) % 26
            new_str += alp[shifted_index]
        end
        new_str
    end
end
