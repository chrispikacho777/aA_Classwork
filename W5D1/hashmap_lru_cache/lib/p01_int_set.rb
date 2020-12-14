class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket = num % 20
    @store[bucket] << num
  end

  def remove(num)
    bucket = num % 20
    @store[bucket].delete(num)
  end

  def include?(num)
    bucket = num % 20
    @store[bucket].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    bucket = num % @store.length
    unless include?(num)
      @store[bucket] << num 
      @count += 1
    end
    resize! if @count > num_buckets
  end

  def remove(num)
    bucket = num % @store.length
    if include?(num)
      @store[bucket].delete(num) 
      @count -= 1
    end
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    # return unless @count > @store.length
    previous_array = @store
    @store = Array.new(num_buckets*2) { Array.new }
    @count = 0
    previous_array.flatten.each {|el| insert(el) }
  end
end
