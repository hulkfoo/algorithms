
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

##
# 上面的暴力解法之所以慢，是因为需要花 O(n) 是间再遍历一下后面的元素，看是否为缺的那个数。
# 而 Hash 就是为了快速查找而生的。
# 所有，研究算法，其实是在使用数据结构。
#
def two_sum(nums, target)
  h = {}
  nums.each_with_index do |v, i|
    h[v] = i
  end

  nums.each_with_index do |v, i|
    return [i, h[target-v]] if h[target-v]
  end
end

##
# 这里做了优化，只用一次遍历。
#
def two_sum_optimize(nums, target)
  h = {}

  nums.each_with_index do |v, i|
    if h[target-v]
      return [i, h[target-v]]
    else
      h[v] = i
    end
  end
end

p two_sum_optimize [2,7,11,15], 17
