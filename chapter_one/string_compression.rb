# 1.6 "String Compression: Implement a method to perform basic string
# compression using the counts of repeated characters."
def compress(str)
  str_arr = str.split('')
  comp_str_arr = []
  count = 1
  last_char = ''

  str_arr.each do |char|
    if char == last_char
      count += 1
    else
      unless last_char.empty?
        comp_str_arr.push(last_char)
        comp_str_arr.push(count.to_s)
        count = 1
      end
    end
    last_char = char
  end
  comp_str_arr.push(str_arr.last)
  comp_str_arr.push(count.to_s)

  comp_str = comp_str_arr.join('')
  return shortest_string(comp_str, str)
end

private
def shortest_string(a, b)
  if a.length < b.length
    return a
  else
    return b
  end
end

# Assumptions:
# - Comparison should be case sensitive