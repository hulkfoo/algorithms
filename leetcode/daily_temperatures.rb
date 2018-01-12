# Given a list of daily temperatures, produce a list that, for each day in the input, tells you how many days you would have to wait until a warmer temperature. If there is no future day for which this is possible, put 0 instead.
#
# For example, given the list temperatures = [73, 74, 75, 71, 69, 72, 76, 73], your output should be [1, 1, 4, 2, 1, 1, 0, 0].
#
# Note: The length of temperatures will be in the range [1, 30000]. Each temperature will be an integer in the range [30, 100].

# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures_rough(temperatures)
    n = temperatures.size
    i = 0
    r = []
    while i<n
        t = temperatures[i]
        j = i+1
        k = 0
        while j < n
            if temperatures[j] > t
                k = j-i
                break
            end

            j += 1
        end
        r << k
        i += 1
    end

    return r
end

##
# 程序之所以快，是因为只计算有用的信息。而提取有用的信息就要充分利用条件：
# 未来最近升温的一天：不用计算所有，只最近的那天就行。
# 本解的巧妙在于用数组来存储未来最近的温度，并倒序迭代对这个状态进行更新。因为不用保存所有的，只是最近的就行，如果需要所有的话就存数组。
#  对基本数据结构的妙用是算法的乐趣。
#
def daily_temperatures(temperatures)
  nex = Array.new(100-30+1)

  r = []
  n = temperatures.size
  i = n-1

  while(i>=0)

    t = temperatures[i]
    t -= 30
    p "i:#{i}, t:#{t}"
    p nex
    warmer_days = []
    nex.each_with_index do |v, j|
      warmer_days << v if v && j > t
    end
    p warmer_days
    min = warmer_days.min

    warmer_day = min.nil? ? 0 : min-i
    r.unshift warmer_day

    nex[t] = i
    i -= 1
  end

  return r
end


p daily_temperatures [73, 74, 75, 71, 69, 72, 76, 73]
p daily_temperatures_rough [73, 74, 75, 71, 69, 72, 76, 73]
