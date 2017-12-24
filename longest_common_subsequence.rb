
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

  if a1[0] == a2[0]
    lcs_dynamic(a1[1..-1], a2[1..-1])
  else
    lcs_dynamic(a1, a2[1..-1])
  end
end

a1 = %w(g a b d e f g)
a2 = %w(c a d f g)


sub = %w(a b d c )
a = %(d a b b d c)
puts is_lcs(sub, a)

all_subsequences a
