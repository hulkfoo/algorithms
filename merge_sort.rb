
def merge_sort(a, p, r)
  puts "merge_sort: p:#{p}, r:#{r}, #{a[p..r]}"
  if p < r
    q = (p+r)/2
    merge_sort(a, p, q)
    merge_sort(a, q+1, r)
    merge(a, p, q, r)
  end

end


def merge(a, p, q, r)
  puts "merge a:#{a} p:#{p}, q:#{q}, r:#{r}: #{a[p..r]}"
  n1 = q - p + 1
  n2 = r - q

  left = Array.new(n1+1)
  right = Array.new(n2+1)

  for i in 0..n1-1
    left[i] = a[p+i]
  end
  left[n1] = 999999

  for i in 0..n2-1
    right[i] = a[q+i+1]
  end
  right[n2] = 999999

  puts "left: #{left}"
  puts "right: #{right}"

  i = 0
  j = 0

  for k in (p..r)
    puts "merge step #{k}, left[#{i}]: #{left[i]}, right[#{j}]: #{right[j]}"
    if left[i] < right[j]
      a[k] = left[i]
      i = i + 1
    else
      a[k] = right[j]
      j = j + 1
    end
  end

  puts "get: #{a[p..r]}"
end


# a1 = [3,5,7,1,2,4,9]
#
# puts a1
#
# merge a1, 0, 2, 6
#
# puts "after merge:"
#
# puts a1

a2 = [3,7,9,1,4,5,2]

puts a2

merge_sort a2, 0, 6

puts "after merge_sort:"

puts a2
