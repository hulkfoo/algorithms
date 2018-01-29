# On a staircase, the i-th step has some non-negative cost cost[i] assigned (0 indexed).
#
# Once you pay the cost, you can either climb one or two steps. You need to find minimum cost to reach the top of the floor, and you can either start from the step with index 0, or the step with index 1.
#
# Example 1:
# Input: cost = [10, 15, 20]
# Output: 15
# Explanation: Cheapest is start on cost[1], pay that cost and go to the top.
# Example 2:
# Input: cost = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
# Output: 6
# Explanation: Cheapest is start on cost[0], and only step on 1s, skipping cost[3].
# Note:
# cost will have a length in the range [2, 1000].
# Every cost[i] will be an integer in the range [0, 999].

# 解此题的关键是得到代价函数 f(i) 的定义：经过 i 层 到达 n-1 层的代价
# 那么，f(i) = cost[i] + [f(i+1), f(i+2)].min
# 应为必须经过第 i 层，同时从第 i 层要么走一步，要么两步，
# 所需要的代价最小，那么就是上一步的也最小，否则有另一条最小代价的路径。
# 此题关键在思路，编程确实很简单，值得琢磨。
# @param {Integer[]} cost
# @return {Integer}
def min_cost_climbing_stairs(cost)
    n = cost.size
    i = n-1
    f1 = 0
    f2 = 0

    while i>=0
        f0 = cost[i] + [f1, f2].min
        f2 = f1
        f1 = f0
        i -= 1
    end

    return [f1, f2].min
end

p min_cost_climbing_stairs [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
