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
