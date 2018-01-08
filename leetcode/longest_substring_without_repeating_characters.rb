# Given a string, find the length of the longest substring without repeating characters.
#
# Examples:
#
# Given "abcabcbb", the answer is "abc", which the length is 3.
#
# Given "bbbbb", the answer is "b", with the length of 1.
#
# Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
#


# @param {String} s
# @return {Integer}
def length_of_longest_substring_rough(s)
    return 0 if s.empty?
    s = s.split ""
    n = s.size
    flag = 0
    r = Array.new(n, 1)
    max = 0
    i = 1
    while i < n do
        v = s[i]
        puts "#{i}: is #{v} in #{s[flag..i-1]} ? #{s[flag..i-1].include? v}"
        index = s[flag..i-1].index v
        if not index
            r[i] += r[i-1]
            i += 1
        else
            max = [max, r.max].max
            r = Array.new(n, 1)
            flag += index + 1
            i = flag + 1
            puts "flag now is #{flag}"
        end
        p r
    end

    max = [max, r.max].max
    puts "!! #{s}'s max: #{max}"
    return max
end

##
# 这里用了窗口，这是解决子字符串问题常用的方法。
# 用 set 的原因是为了在 O(1) 时间内查找下一个字符是否在窗口内出现过。
# 如果出现过，则一直找到这个出现的位置为止，并定义为窗口新的左开边界，然后右边的边界才可以继续推进。这个思路是解题的关键。
#
# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  s = s.split ""
  return 0 if s.empty?

  n = s.size
  require 'set'
  st = Set.new
  i = 0
  j = 0
  r = 0

  while(i < n && j < n) do
    if not st.include? s[j]
      st << s[j]
      j += 1
      r = [r, j-i].max
    else
      st.delete s[i]
      i += 1
    end
  end

  return r
end


# length_of_longest_substring "abcabcbb"
# length_of_longest_substring "vsvd"
puts length_of_longest_substring "cadaanpsnfzwchsgtqlhikorgijylbjpbmrd"
