# Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.
#
# Note: You can only move either down or right at any point in time.
#
# Example 1:
# [[1,3,1],
#  [1,5,1],
#  [4,2,1]]
# Given the above grid map, return 7. Because the path 1→3→1→1→1 minimizes the sum.

# 这是一个典型的动态规划问题。
# 当前的解，需要上一步的值对比后得到。
# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
    n = grid.size
    m = grid[0].size

    dp = Array.new(n) { Array.new(m) }
    dp[0][0] = grid[0][0]

    i = 1
    while i < n
        dp[i][0] = dp[i-1][0] + grid[i][0]
        i += 1
    end

    i = 1
    while i < m
        dp[0][i] = dp[0][i-1] + grid[0][i]
        i += 1
    end

    i = 1
    while i < n
        j = 1
        while j<m
            dp[i][j] = [dp[i-1][j], dp[i][j-1]].min + grid[i][j]
            j += 1
        end
        i += 1
    end

    return dp[n-1][m-1]
end
