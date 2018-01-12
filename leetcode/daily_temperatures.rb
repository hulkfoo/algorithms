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

p daily_temperatures [73, 74, 75, 71, 69, 72, 76, 73]
