def first_anagram?(str, str_2) #O(n!)
    chars = str.split('')
    anagrams = chars.permutation.to_a
    anagrams.map! do |sub_arr|
        sub_arr.join('')
    end
    anagrams.include?(str_2)
end

def second_anagram?(word_1, word_2) #O(n^2)
    return false if word_1.length != word_2.length

    (0...word_1.length).each do |i|
        j = word_2.index(word_1[i])
        if j
            word_2 = word_2[0...j] + word_2[j+1..-1]
        else
            return false
        end
    end
    true
end

# p second_anagram?('qwerty', 'ytrewq')


def third_anagram?(word_1, word_2) # O(nlogn)
    sorted_1 = merge_sort(word_1)
    sorted_2 = merge_sort(word_2)
    return true if sorted_1 == sorted_2
    false
end

def merge_sort(str,alphabet = nil)
    alphabet ||= ("a".."z").to_a
    return str if str.length < 2
    mid = (str.length - 1) / 2
    left = merge_sort(str[0..mid], alphabet)
    right = merge_sort(str[mid+1..-1], alphabet)
    merge(left, right, alphabet)
end

def merge(left, right, alphabet = nil)
    alphabet ||= ("a".."z").to_a
    return left if right.empty?
    return right if left.empty?

    if alphabet.index(left[0]) < alphabet.index(right[0])
        left[0] + merge(left[1..-1], right, alphabet)
    else
        right[0] + merge(left, right[1..-1], alphabet)
    end
end


# # p merge_sort("ebcda")
# p third_anagram?("ebcda", "dcbea")
# p third_anagram?("ebcda", "dcgea")

# with 2 hashes
def fourth_anagram?(word_1, word_2) #  O(n)
    hash_1 = Hash.new(0)
    hash_2 = Hash.new(0)

    word_1.each_char {|char| hash_1[char] += 1}
    word_2.each_char {|char| hash_2[char] += 1}

    hash_1 == hash_2
end

# with one hash
def fourth_anagram?(word_1, word_2) #  O(n)
    hash = Hash.new(0)

    word_1.each_char {|char| hash[char] += 1}
    word_2.each_char {|char| hash[char] -= 1}
    hash.values.all? {|val| val == 0}
end


p fourth_anagram?("ebcda", "dcbea")
p fourth_anagram?("ebcda", "dcgea")
