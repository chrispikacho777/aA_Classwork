def my_min_1(list) #time complexity is O(N^2)
    # min = list[0]
    (0...list.length - 1).each do |i|
        count = 0
        (i+1...list.length).each do |j|
            if list[i] > list[j]
                break
            else
                count += 1
            end
        end
        return list[i] if count == list[i+1...list.length].length
    end
end

def my_min(list) #time complexity for this is O(N)
    min = list[0]
    list.each {|num| min = num if num < min}
    min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_1(list) 


def sub_sum_1(list) # time complexity is O(n^2)
    sub_arr = []
    (0...list.length - 1).each do |i|
        (i...list.length).each do |j|
            sub_arr << list[i..j]
        end
    end
    sub_arr.inject { |arr1, arr2| arr2.sum > arr1.sum ? arr1 = arr2 : arr1 }.sum
end

def sub_sum(list) # time complexity is O(n)
    largest_sum = 0
    current_sum = 0

    list.each do |num|
        current_sum += num
        if current_sum >= largest_sum
            largest_sum = current_sum
        else
            current_sum = num
        end
    end
    largest_sum
end





list = [5, 3, -7]
# p sub_sum_1(list)
p sub_sum(list)
