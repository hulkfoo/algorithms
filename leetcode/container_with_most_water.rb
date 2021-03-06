# Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
#
# Note: You may not slant the container and n is at least 2.

##
# 再一次见证了窗口的力量
#
# @param {Integer[]} height
# @return {Integer}
def max_area(height)
    max = 0
    n = height.size

    i = 0
    j = n - 1
    while(i < j)
        max = [[height[i],height[j]].min * (j-i), max].max
        if height[i] <= height[j]
            i += 1
        else
            j -= 1
        end
    end

    return max
end
