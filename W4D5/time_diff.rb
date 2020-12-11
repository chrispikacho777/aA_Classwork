def my_min_1(list) #time complexity is O(N^2)
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
# list_1 = [1, 10, -3, 8, 100, -100, 0]
# p my_min_1(list) 
# p my_min_1(list_1) 


def sub_sum_1(list) # time complexity is O(n^3)
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
            #current_sum is smaller than largest_sum
            #we need to reset current_sum based on if it is negative or positive
            #if negative we will reset to 0
            #if positive, keep the current_sum as is
            if current_sum < 0
                current_sum = 0
            end
        end
    end
    largest_sum
end





# list = [5, 3, -7]
# # p sub_sum_1(list)
# p sub_sum(list)


