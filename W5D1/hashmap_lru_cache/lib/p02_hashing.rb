class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return nil.hash if self.empty?
    hash_num = 0
    self.each_with_index { |ele, idx| hash_num += (ele * idx).hash }
    hash_num
  end
end

class String
  def hash
    return nil.hash if self.empty?
    alphabet = ("a".."z").to_a
    hash_sum = 0
    self.each_char.with_index { |char, i| hash_sum += (alphabet.index(char.downcase) * i).hash }
    hash_sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    keys = self.keys.map{|el| el.to_s}.sort
    values = self.values.sort
    total = keys + values
    total.hash
  end
end
