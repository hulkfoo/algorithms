
# Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.
#
# Example 1
#
# Input: [3,0,1]
# Output: 2
# Example 2
#
# Input: [9,6,4,2,3,5,7,0,1]
# Output: 8

# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
    n = nums.size
    a = Array.new(n+1)

    nums.each do |i|
        a[i] = true
    end

    a.each_with_index do |v, i|
        return i if not v
    end
end

p missing_number [0,1,3]
