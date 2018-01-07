
# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
#
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
#
# Example:
# Given nums = [2, 7, 11, 15], target = 9,
#
# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1].

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum_rough(nums, target)
    n = nums.size
    i = 0

    while(i<n) do
        j = i + 1
        while(j<n) do
            return [i,j] if nums[i] + nums[j] == target
            j += 1
        end
        i += 1
    end
end
