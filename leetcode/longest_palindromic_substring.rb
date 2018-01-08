#
# Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
#
# Example:
#
# Input: "babad"
#
# Output: "bab"
#
# Note: "aba" is also a valid answer.
# Example:
#
# Input: "cbbd"
#
# Output: "bb"

# @param {String} s
# @return {String}
def longest_palindrome_rough(s)
  n = s.size
  i = 0
  r = ""
  while i < n
    j = i
    while j < n
      t = s[i..j]
      if is_palindrome(t)
        r = t if t.size > r.size
        puts "now is #{r}"
      end
      j += 1
    end
    i += 1
  end

  return r
end

def is_palindrome(s)
  n = s.size
  i = 0
  while i < n/2
    return false if s[i] != s[n-i-1]
    i += 1
  end
  return true
end

def is_palindrome_dynamic(s, r, i, j)
  # puts "is_palindrome_dynamic: #{i}, #{j}"
  return r[i][j] if r[i][j]

  r[i][j] = false
  if s[i] == s[j]
    if i + 1 == j
      r[i][j] = true
    else
      if is_palindrome_dynamic(s, r, i+1, j-1)
        r[i][j] = true
      end
    end
  end

  return r[i][j]
end

def longest_palindrome_dynamic(s)
  n = s.size
  r = Array.new(n) { Array.new(n, nil)}
  i = 0
  m = ""
  while i < n
    r[i][i] = true
    i += 1
  end

  i = 0
  while i < n
    j = i
    while j < n
      # puts "i: #{i}, j: #{j}"
      t = s[i..j]
      # puts "cur substring: #{t}"
      if is_palindrome_dynamic s,r,i,j
        m = t if t.size > m.size
      end

      # puts "is palindromic #{r[i][j]}"
      j += 1
    end
    i += 1
  end

  puts m
  return m
end

t1 = "rgczcpratwyqxaszbuwwcadruayhasynuxnakpmsyhxzlnxmdtsqqlmwnbxvmgvllafrpmlfuqpbhjddmhmbcgmlyeypkfpreddyencsdmgxysctpubvgeedhurvizgqxclhpfrvxggrowaynrtuwvvvwnqlowdihtrdzjffrgoeqivnprdnpvfjuhycpfydjcpfcnkpyujljiesmuxhtizzvwhvpqylvcirwqsmpptyhcqybstsfgjadicwzycswwmpluvzqdvnhkcofptqrzgjqtbvbdxylrylinspncrkxclykccbwridpqckstxdjawvziucrswpsfmisqiozworibeycuarcidbljslwbalcemgymnsxfziattdylrulwrybzztoxhevsdnvvljfzzrgcmagshucoalfiuapgzpqgjjgqsmcvtdsvehewrvtkeqwgmatqdpwlayjcxcavjmgpdyklrjcqvxjqbjucfubgmgpkfdxznkhcejscymuildfnuxwmuklntnyycdcscioimenaeohgpbcpogyifcsatfxeslstkjclauqmywacizyapxlgtcchlxkvygzeucwalhvhbwkvbceqajstxzzppcxoanhyfkgwaelsfdeeviqogjpresnoacegfeejyychabkhszcokdxpaqrprwfdahjqkfptwpeykgumyemgkccynxuvbdpjlrbgqtcqulxodurugofuwzudnhgxdrbbxtrvdnlodyhsifvyspejenpdckevzqrexplpcqtwtxlimfrsjumiygqeemhihcxyngsemcolrnlyhqlbqbcestadoxtrdvcgucntjnfavylip"

t2 = "iopsajhffgvrnyitusobwcxgwlwniqchfnssqttdrnqqcsrigjsxkzcmuoiyxzerakhmexuyeuhjfobrmkoqdljrlojjjysfdslyvckxhuleagmxnzvikfitmkfhevfesnwltekstsueefbrddxrmxokpaxsenwlgytdaexgfwtneurhxvjvpsliepgvspdchmhggybwupiqaqlhjjrildjuewkdxbcpsbjtsevkppvgilrlspejqvzpfeorjmrbdppovvpzxcytscycgwsbnmspihzldjdgilnrlmhaswqaqbecmaocesnpqaotamwofyyfsbmxidowusogmylhlhxftnrmhtnnljjhhcfvywsqimqxqobfsageysonuoagmmviozeouutsiecitrmkypwknorjjiaasxfhsftypspwhvqovmwkjuehujofiabznpipidhfxpoustquzyfurkcgmioxacleqdxgrxbldcuxzgbcazgfismcgmgtjuwchymkzoiqhzaqrtiykdkydgvuaqkllbsactntexcybbjaxlfhyvbxieelstduqzfkoceqzgncvexklahxjnvtyqcjtbfanzgpdmucjlqpiolklmjxnscjcyiybdkgitxnuvtmoypcdldrvalxcxalpwumfx"
longest_palindrome_rough t2
longest_palindrome_dynamic t2
