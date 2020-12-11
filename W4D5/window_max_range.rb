def windowed_max_range(arr, size)
    current_max_range = nil

    (0...arr.length).each do |i|
        break if i+size == arr.length + 1
        min = arr[i...i+size].min
        max = arr[i...i+size].max
        current_max_range = max-min if current_max_range.nil? || (max-min) > current_max_range 
    end
    current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8
