def windowed_max_range(arr, size) # O(n^2)
    current_max_range = nil

    (0...arr.length).each do |i|
        break if i+size == arr.length + 1
        min = arr[i...i+size].min
        max = arr[i...i+size].max
        current_max_range = max-min if current_max_range.nil? || (max-min) > current_max_range 
    end
    current_max_range
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8


class MyQueue
    def initialize
      @store = []
    end
    
    def peek
        @store[0]
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end
    
    def enqueue(input)
        @store << input
    end

    def dequeue
        @store.shift
    end
end


class MyStack
    def initialize
      @store = []
    end

    def peek
        @store.last
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def pop
        @store.pop
    end

    def push(input)
        @store.push(input)
    end
end


class StackQueue

    def initialize
        @stack_1 = MyStack.new
        @stack_2 = MyStack.new
    end

    def size
        @stack_2.length + @stack_1.length
    end

    def empty?
        @stack_2.empty? && @stack_1.empty?
    end

    def enqueue(input)
        @stack_1.push(input)
    end

    def dequeue(input)
        if @stack_2.empty?
            @stack_2.push(@stack_1.pop) until @stack_1.empty?
        end
        @stack_2.pop
    end

end




