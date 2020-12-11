def bad_two_sum?(arr, target) # O(n^2)
    pairs = []
    (0...arr.length - 1).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target
        end
    end
    false
end

def okay_two_sum?(arr, target) #(nlogn)
    sorted = arr.sort 
    (0...arr.length).each do |i|
        difference = target - arr[i]
        return true if bsearch(arr[i+1..-1], difference) 
    end
    false
end

def bsearch(arr, target)
    return nil if arr.empty?

    mid = arr.length/2
    return arr[mid] if arr[mid] == target

    left = arr[0...mid]
    right = arr[mid+1..-1]

    if target < arr[mid]
        return bsearch(left, target)
    else
        right_check = bsearch(right, target)
        return right_check + mid + 1 unless right_check.nil?
    end
    nil
end


# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) 
# p okay_two_sum?(arr, 10)

def two_sum?(arr, target) # O(n)
    hash = Hash.new(0)
    arr.each { |num| hash[num] += 1}
    arr.each do |num|
        diff = target - num
        hash[num] -= 1
        return true if hash[diff] > 0
    end

end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) 
p okay_two_sum?(arr, 10)