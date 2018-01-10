# There are N network nodes, labelled 1 to N.
#
# Given times, a list of travel times as directed edges times[i] = (u, v, w), where u is the source node, v is the target node, and w is the time it takes for a signal to travel from source to target.
#
# Now, we send a signal from a certain node K. How long will it take for all nodes to receive the signal? If it is impossible, return -1.
#
# Note:
# N will be in the range [1, 100].
# K will be in the range [1, N].
# The length of times will be in the range [1, 6000].
# All edges times[i] = (u, v, w) will have 1 <= u, v <= N and 1 <= w <= 100.

# @param {Integer[][]} times
# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def network_delay_time(times, n, k)
    # 记录从一个点发出消息能到达的所有点和时间的数组
    graph = {}
    times.each do |t|
        graph[t[0]] ||= []
        graph[t[0]] << [t[2], t[1]]
    end

    # 记录收到 k 的时间
    dist = {}
    for i in 1..n
        dist[i] = 101 * n
    end

    dfs(k, 0, dist, graph)

    max = dist.values.max
    max > 100 * n ? -1 : max
end


# 到达 node 需用时 time，根据这个条件进行深度优先的遍历
def dfs(node, time, dist, graph)
    # 时间比之前的事件还长，说明这个路径就不用考虑了
    return if time >= dist[node]
    dist[node] = time
    if graph[node]
        # 对从当前 node 发出的消息根据时间先进行排序，这样可以减少重复计算
        graph[node].sort.each do |item|
           dfs(item[1], time+item[0], dist, graph)
        end
    end
end

p network_delay_time [[2,1,1],[2,3,1],[3,4,1]], 4, 2
