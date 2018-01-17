#
# A string S of lowercase letters is given. We want to partition this string into as many parts as possible so that each letter appears in at most one part, and return a list of integers representing the size of these parts.
#
# Example 1:
# Input: S = "ababcbacadefegdehijhklij"
# Output: [9,7,8]
# Explanation:
# The partition is "ababcbaca", "defegde", "hijhklij".
# This is a partition so that each letter appears in at most one part.
# A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits S into less parts.
# Note:
#
# 1. S will have length in range [1, 500].
# 2. S will consist of lowercase letters ('a' to 'z') only.

# 解出此题的关键在于用 hash 存每个字符最后出现的位置。
# 然后在遍历字符串的时候，比较当前区域末尾字符是否是当前块里最长的那个。
# 这是一个贪心算法。贪心算法有一个特点，即求 as many as，越怎么样越好
# @param {String} s
# @return {Integer[]}
def partition_labels(s)
    s = s.split('')
    last = {}
    s.each_with_index do |c, i|
        last[c] = i
    end

    ans = []
    anchor,j = 0,0

    s.each_with_index do |c, i|
        j = [j, last[c]].max
        if i == j
            ans << i - anchor + 1
            anchor = i + 1
        end
    end

    return ans
end
