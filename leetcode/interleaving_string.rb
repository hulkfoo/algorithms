# Given s1, s2, s3, find whether s3 is formed by the interleaving of s1 and s2.
#
# For example,
# Given:
# s1 = "aabcc",
# s2 = "dbbca",
#
# When s3 = "aadbbcbcac", return true.
# When s3 = "aadbbbaccc", return false.

##
# 即使是暴力算法，也很妙。递归看上去很简单，可却要设计好递归函数的参数
#
# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Boolean}
def is_interleave(s1, s2, s3)
    is_sub_interleave(s1, 0, s2, 0, "", s3)
end

def is_sub_interleave(s1, i, s2, j, res, s3)
    puts "i: #{i}, j: #{j}, res: #{res}"
    return true if res == s3 && s3.size == s1.size + s2.size
    r = false
    r ||= is_sub_interleave(s1,i+1,s2,j,res+s1[i],s3) if i<s1.size
    r ||= is_sub_interleave(s1,i,s2,j+1,res+s2[j],s3) if j<s2.size

    return r
end

p is_interleave "ab", "cb", "acbb"
# p is_interleave "cabbcaaacacbac", "acabaabacabcca", "cacabaabacaabccbabcaaacacbac"
