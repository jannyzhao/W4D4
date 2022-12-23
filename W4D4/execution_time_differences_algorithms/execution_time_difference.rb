# my min

# Phase 1 = O(n ^ 2) 
def my_min(list)
    minimum = list[0] #integer
    list.each_index do |i|
        (i + 1...list.length).each do |j|
            if list[j] < list[i] && list[j] < minimum
                minimum = list[j]
            end
        end
    end
    minimum 
end

# Phase 2 = O(n) 
def my_min(list) # this method returns the lowest num in a list
    minimum = list[0]
    list.each {|ele| minimum = ele if ele < minimum}
    minimum
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

###

# largest contiguous sub-sum

# Phase 1 O(n ^ 2)

def largest_contiguous_subsum(list) # list = [5, 3, -7] for example...
    # First make an array to hold all sub-arrays. 
    subarrays = []
    # Then find the sums of each sub-array and return the max.
    list.each_index do |i|
        (i+1...list.length).each do |j|
            subarrays << list[i..j]
        end
    end
    p subarrays
    mapped_subarrays = subarrays.map {|subarray| subarray.sum }
    return mapped_subarrays.max
end

# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])






# Phase 2 time: O(n) space: O(1):

# adam
def largest_contiguous_subsum(list)
    
    largest_sum = list[0] # 5
    current_sum = 0

    idx = 0
    jdx = nil

    list.each_index do |j|
        jdx = j
        
        current_sum = list[i..j].sum

        idx += 1

        if current_sum > largest_sum
            largest_sum = current_sum
        end
    end
    largest_sum
end

# janny
def largest_contiguous_subsum(list)
    largest_sum = list[0]
    current_sum = 0
    
    list.each do |ele| # []
        current_sum = 0 if current_sum < 0 
        current_sum += ele
        largest_sum << current_sum + largest_sum
    end
end

# dilang
require 'byebug'
def largest_contiguous_subsum(list)
    largest_sum = list[0]
    current_sum = 0
    debugger
    list.each do |ele|
        current_sum = 0 if current_sum.negative # once a negative number takes the sum below 0, you know that the current sum isn't what we're looking for
        current_sum += ele #0+7 = 7, 7-6 =1, 1+7 =8
        largest_sum = current_sum if current_sum > largest_sum #7
    end
    largest_sum
end

# test cases
list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8 (from [5, 3])

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])

list = [-5, 10, -1, -3, 7]
p largest_contiguous_subsum(list) # => 13 (from [10, -1, -3, 7])
