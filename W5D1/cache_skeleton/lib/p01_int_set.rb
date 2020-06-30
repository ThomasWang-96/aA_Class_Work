class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max = max
    @store = Array.new(max)
  end

  def insert(num)
    if num >= 0 && num < @max
      store[num] = true
    else
      raise 'Out of bounds'
    end
  end

  def remove(num)
     store[num] = nil
  end

  def include?(num)
    store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet 
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if !self[num].include?(num)
        self[num] << num
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
    end    
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    pos = num % store.length
    @store[pos]
  end

  def num_buckets
    @store.length
  end
end


class ResizingIntSet
  attr_accessor :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self[num].include?(num)
      self[num] << num
      @count += 1
    end
    resize! if count == num_buckets
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    pos = num % @store.length
    @store[pos]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(num_buckets * 2) {Array.new}
    @store.each do |bucket|
      bucket.each do |element|
        pos = element % new_arr.length
        new_arr[pos] << element
      end
    end
    @store = new_arr
  end
end