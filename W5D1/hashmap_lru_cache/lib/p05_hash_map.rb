require_relative 'p04_linked_list'
require_relative 'p02_hashing'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def [](key)
    return @store[key.hash % num_buckets].get(key)
    nil
  end

  def include?(key)

  end

  def set(key, val)
    list = @store[key.hash % num_buckets]
    if list.include?(key)
      list.update(key, val)
    else
      list.append(key, val)
    end
  end

  def get(key)
  end

  def delete(key)
  end

  def each
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
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
