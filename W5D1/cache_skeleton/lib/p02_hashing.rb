class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash 
    return 0 if self.empty?
    sum = 0
    self.each_with_index do |num,i|
      sum += num if i.even?
    end
    sum % self.length
    
  end
end

class String
  def hash
    sum = 0
    self.each_char.with_index do |char, i|
      sum += char.ord if i.odd?
    end
    sum % self.length
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    self.each do |k, v|
      sum += v.ord 
    end
    sum % (self.length + 3)
  end
end
