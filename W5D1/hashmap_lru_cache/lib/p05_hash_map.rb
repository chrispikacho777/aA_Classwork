require_relative 'p04_linked_list'
require_relative 'p02_hashing'

class HashMap
  include Enumerable

  attr_accessor :count
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    list = @store[key.hash % num_buckets]
    return true if list.include?(key)
    false
  end

  def set(key, val)
    list = @store[key.hash % num_buckets]
    if list.include?(key)
      list.update(key, val)
    else
      list.append(key, val)
      @count += 1
    end
    resize! if @count > num_buckets
  end

  def get(key)
    return @store[key.hash % num_buckets].get(key)
    nil
  end

  def delete(key)
    list = @store[key.hash % num_buckets]
    list.remove(key)
    @count -= 1
  end

  def each(&prc)
    @store.each do |list|
      list.each { |ele| prc.call(ele.key, ele.val) }
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    previous_array = @store
    @store = Array.new(num_buckets*2) { LinkedList.new }
    @count = 0
    previous_array.each do |list|
      list.each { |node| self[node.key] = node.val }
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
