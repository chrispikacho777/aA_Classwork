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

