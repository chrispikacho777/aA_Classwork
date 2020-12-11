
class Array

    def my_uniq
        uniq_arr = []
        self.each {|el| uniq_arr << el if !uniq_arr.include?(el)}
        uniq_arr
    end

    def two_sum
        pairs_arr = []
        self.each_with_index do |el1, idx1|
            self.each_with_index do |el2, idx2|
                if idx1 < idx2 && el1 + el2 == 0
                    pairs_arr << [idx1, idx2]
                end
            end
        end
        pairs_arr
    end

end


def my_transpose(array)
    trans_arr = []
    (0...array.length).each do |idx1|
        temp_arr = []
        (0...array.length).each do |idx2|
            temp_arr << array[idx2][idx1]
        end
        trans_arr << temp_arr
    end
    trans_arr
end

def stock_picker(array)
    profit = 0
    max_profit = []
    (0...array.length - 1).each do |buy|
        ((buy + 1)...array.length).each do |sell|
            if (array[sell] - array[buy]) > profit 
                max_profit = [array[buy], array[sell]]
                profit = array[sell] - array[buy]
            end
        end
    end
    raise StandardError if array.index(max_profit[0]) > array.index(max_profit[1])
    max_profit
end

class TowerOfHanoi
    
    attr_accessor :t1, :t2, :t3

    def initialize
        @t1 = [1,2,3,4,5]
        @t2 = []
        @t3 = []
    end

    def play
        until won?
            render
            puts 'Input starting tower (t1, t2, t3)'
            start_p = gets.chomp
            puts "Input ending tower (t1, t2, t3)"
            end_p = gets.chomp
            hash = {'t1' => @t1, 't2' => @t2, 't3' => @t3}
            move(hash[start_p], hash[end_p])
        end
        render
        puts 'You won!'
    end

    def move(start_t, end_t)
        raise StandardError.new('Starting Tower Empty') if start_t.empty?
        raise StandardError.new('Can not place bigger ring on smaller ring') if !end_t.empty? && start_t[0] > end_t[0]
        end_t.unshift(start_t.shift)
        
    end

    def won?
        return false if @t3.length != 5
        true
    end

    def render
        p 't1: ' + @t1.join(' ')
        p 't2: ' + @t2.join(' ')
        p 't3: ' + @t3.join(' ')
    end

end

# tower = TowerOfHanoi.new
# tower.play