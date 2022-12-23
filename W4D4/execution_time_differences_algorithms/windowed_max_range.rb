require "byebug"

def windowed_max_range(array, window_size)
    differences = []
    #Iterate over the array and consider each window of size w. For each window:
    array.each_index do |idx|
        window = array[idx...(idx + window_size)] 

        min = window.min
        max = window.max
        # Calculate max - min and compare it to current_max_range. Reset the value of current_max_range if necessary.
        difference = max - min
        differences << difference
    end
    return differences.max
end

# debugger
p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

def windowed_max_range(array, window_size)
    
end