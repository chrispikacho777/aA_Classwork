
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
