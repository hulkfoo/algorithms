
def is_lcs(a1, a2)
  puts "is a1: #{a1} sub of a2: #{a2} ?"
  n1 = a1.length
  n2 = a2.length

  i = 0
  j = 0
  last_common_j = -1

  s = []

  while i < n1
    while j < n2
      puts "i: #{i}, j: #{j}"
      if a1[i] == a2[j]
        s << a1[i]
        i = i + 1
        last_common_j = j
      end
      j = j + 1
    end
    i = i + 1
    j = last_common_j + 1
  end

  r =  s == a1 ? true : false
  puts r
  r
end

def all_subsequences(a)

end

def lcs_rough_all(a1, a2)

end

##
#
#
def lcs_dynamic(a1, a2)
  n1 = a1.length
  n2 = a2.length

  m = Array.new(n1+1) { Array.new(n2+1)}

  for i in 0..n1 do
    m[i][0] = 0
  end

  for i in 0..n2 do
    m[0][i] = 0
  end

  i = 1
  j = 1

  while i <= n1 do
    while j <= n2 do
      puts "i: #{i}, j: #{j}"
      puts "a1[#{i-1}]: #{a1[i-1]}, a2[#{j-1}]: #{a2[j-1]}"
      if a1[i-1] == a2[j-1]
        puts a1[i-1]
        m[i][j] = 1 + m[i-1][j-1]
      else
        m[i][j] = [m[i][j-1], m[i-1][j]].max
      end
      j += 1
    end
    i += 1
    j = 1
  end

  p m
  return m[n1][n2]
end

a1 = %w(g a b d e g)
a2 = %w(c a e d g)
puts "lcs: #{lcs_dynamic(a1, a2)}"

# sub = %w(a b d c )
# a = %(d a b b d c)
# puts is_lcs(sub, a)
#
# all_subsequences a
