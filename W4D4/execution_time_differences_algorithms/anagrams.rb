# Phase 1 O(n!)
# returns if the second string is in the first string's permutations
def first_anagram?(first_str, second_str) # if str = "cat": "c", "a", "t", "ca", etc, etc
    # return the permutations of the first string
    permutation_first = first_str.chars.permutation.to_a.map(&:join) # O(n!) # memoization
    permutation_first.include?(second_str) #O(n)
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

# Phase 2
def second_anagram?(first_str, second_str)

    return false unless first_str.length == second_str.length

    first_str.each_char do |first_str_char|
        # find the index of that letter in the second string (hint: use Array#find_index)
        return false unless second_str.include?(first_str_char)
        second_str_idx = second_str.index(first_str_char) # 0
        # delete the char in second_str, at that index
        second_str[second_str_idx] = ""
    end
    second_str.empty?
    # return if every f_char was found in second_str AND if second string is empty
end

# p second_anagram?("sally", "caddy")    # false
# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

# Phase 3 
def third_anagram?(first_str, second_str)
    # sorting both strings alphabetically
    sorted_first = first_str.chars.sort.join
    sorted_second = second_str.chars.sort.join

    # then check if the alphabetized strings are equal
    return sorted_first == sorted_second
end

# p third_anagram?('aqewrjkljfhq', 'daqjksghdlq')
# p third_anagram?('hello', 'hello')


# Phase 4 O(n)
def fourth_anagram?(first_str, second_str)
    hash_1 = Hash.new(0)
    hash_2 = Hash.new(0)

    first_str.each_char do |f_char|
        hash_1[f_char] += 1
    end

    second_str.each_char do |s_char|
        hash_2[s_char] += 1
    end

    hash_1 == hash_2
end

# bonus
def fourth_anagram?(first_str, second_str)
    hash_1 = Hash.new(0)

    first_str.each_char do |f_char|
        hash_1[f_char] += 1
    end

    second_str.each_char do |s_char|
        hash_1[s_char] -= 1
    end

    hash_1.values.all?{|ele| ele == 0}
# end
# p fourth_anagram?('aqewrjkljfhq', 'daqjksghdlq')
# p fourth_anagram?('hello', 'helol')

