#
# We are given a list schedule of employees, which represents the working time for each employee.
#
# Each employee has a list of non-overlapping Intervals, and these intervals are in sorted order.
#
# Return the list of finite intervals representing common, positive-length free time for all employees, also in sorted order.
#
# Example 1:
# Input: schedule = [[[1,2],[5,6]],[[1,3]],[[4,10]]]
# Output: [[3,4]]
# Explanation:
# There are a total of three employees, and all common
# free time intervals would be [-inf, 1], [3, 4], [10, inf].
# We discard any intervals that contain inf as they aren't finite.
# Example 2:
# Input: schedule = [[[1,3],[6,7]],[[2,4]],[[2,5],[9,12]]]
# Output: [[5,6],[7,9]]
# (Even though we are representing Intervals in the form [x, y], the objects inside are Intervals, not lists or arrays. For example, schedule[0][0].start = 1, schedule[0][0].end = 2, and schedule[0][0][0] is not defined.)
#
# Also, we wouldn't include intervals like [5, 5] in our answer, as they have zero length.
#
# Note:
#
# schedule and schedule[i] are lists with lengths in range [1, 50].
# 0 <= schedule[i].start < schedule[i].end <= 10^8.

# Definition for an interval.
# class Interval
#     attr_accessor :start, :end
#     def initialize(s=0, e=0)
#         @start = s
#         @end = e
#     end
# end

# 解本题的关键在于将输入数据转换成 events 序列，排序后通过 balance 这个变量进行撮合，得到空闲的结果。
# 其实这道题看上去是挺简单的：不就是找出缺口吗？可代码实现时，就要把简单的判断写成代码。
# @param {Interval[][]} schedule
# @return {Interval[]}
def employee_free_time(schedule)
    events = []
    schedule.flatten.each do |i|
        events << [i.start, 0]
        events << [i.end, 1]
    end

    events = events.sort
    bal = 0
    pre = nil
    ans = []

    events.each do |e|
        t = e[0]
        cmd = e[1]

        if bal == 0 && pre != nil
            ans << [pre, t]
        end

        if cmd == 0
            bal += 1
        else
            bal -= 1
        end

        pre = t
    end

    return ans
end
