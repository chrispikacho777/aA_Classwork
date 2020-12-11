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