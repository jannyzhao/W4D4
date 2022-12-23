#Brute Force
def two_sum?(arr, target_sum)
    arr.each_with_index do |num1, i|
        arr.each_with_index do |num2, j|
            if num1 + num2 == target_sum && j > i
                return true
            end
        end
    end
    false
end


# Sorting
require 'byebug'
def okay_two_sum?(arr, target_sum) # arr = [0, 1, 6, 9], target_sum = 7
    sorted_arr = arr.sort #

    i = 0
    j = -1
    found = false
    until found
        found = true
        i_ele = sorted_arr[i]
        j_ele = sorted_arr[j]
        return false if i_ele == nil || j_ele == nil
        sum = i_ele + j_ele
        if sum < target_sum
            i += 1
            found = false
        elsif sum > target_sum
            j -= 1
            found = false
        else # if sum equals target sum
            return found
        end
    end
end

# arr = [3, 14, 5, 8, 9, 10]

# p okay_two_sum?(arr, 32) # => should be false

# arr = [0, 1, 6, 9]
# p okay_two_sum?(arr, 6) # => should be true


# Hash Map
def two_sum?(arr, target_sum)
    hash = {}
    arr.each do |ele|
        if hash[target_sum - ele]
            return true
        else
            hash[ele] = "ups-man"
        end
    end
    false
end

arr = [0, 1, 6, 9]
p okay_two_sum?(arr, 6) # => should be true

arr = [3, 14, 5, 8, 9, 10]
p okay_two_sum?(arr, 32) # => should be false
# by Janny




