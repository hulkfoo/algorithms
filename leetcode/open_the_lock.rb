# You have a lock in front of you with 4 circular wheels. Each wheel has 10 slots: '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'. The wheels can rotate freely and wrap around: for example we can turn '9' to be '0', or '0' to be '9'. Each move consists of turning one wheel one slot.
#
# The lock initially starts at '0000', a string representing the state of the 4 wheels.
#
# You are given a list of deadends dead ends, meaning if the lock displays any of these codes, the wheels of the lock will stop turning and you will be unable to open it.
#
# Given a target representing the value of the wheels that will unlock the lock, return the minimum total number of turns required to open the lock, or -1 if it is impossible.
#
# Example 1:
# Input: deadends = ["0201","0101","0102","1212","2002"], target = "0202"
# Output: 6
# Explanation:
# A sequence of valid moves would be "0000" -> "1000" -> "1100" -> "1200" -> "1201" -> "1202" -> "0202".
# Note that a sequence like "0000" -> "0001" -> "0002" -> "0102" -> "0202" would be invalid,
# because the wheels of the lock become stuck after the display becomes the dead end "0102".
# Example 2:
# Input: deadends = ["8888"], target = "0009"
# Output: 1
# Explanation:
# We can turn the last wheel in reverse to move from "0000" -> "0009".
# Example 3:
# Input: deadends = ["8887","8889","8878","8898","8788","8988","7888","9888"], target = "8888"
# Output: -1
# Explanation:
# We can't reach the target without getting stuck.
# Example 4:
# Input: deadends = ["0000"], target = "8888"
# Output: -1
# Note:
# The length of deadends will be in the range [1, 500].
# target will not be in the list deadends.
# Every string in deadends and the string target will be a string of 4 digits from the 10,000 possibilities '0000' to '9999'.

##
# 解本题的关键是把问题转化成求路径问题，0000 - 9999 可以看作是 10000 个点，
# 而这些点通过对4位中的一位进行加或减建立了连接，即每个点有 8 个分叉。
# deadends 是不可到达的点。
# 变成了寻路径问题，就可以用广度优先遍历这个8叉树了。
#
# @param {String[]} deadends
# @param {String} target
# @return {Integer}
def open_lock(deadends, target)
    seen = ['0000']
    q = [['0000', 0]]

    while not q.empty?
        item = q.shift
        node = item[0]
        depth = item[1]
        return depth if node == target
        next if deadends.include? node
        for nei in neighbors(node)
            if not seen.include? nei
                seen << nei
                q << [nei, depth+1]
            end
        end
    end
    return -1
end

def neighbors(node)
   r = []
    for i in 0..3
        x = node[i].to_i
        for d in [-1, 1]
            y = (x + d) % 10
            nei = node[0...i] + y.to_s + node[i+1..-1]
            r << nei
        end
    end
    r
end

p open_lock ["0201","0101","0102","1212","2002"], "0202"
p open_lock ["8887","8889","8878","8898","8788","8988","7888","9888"], "8888"
