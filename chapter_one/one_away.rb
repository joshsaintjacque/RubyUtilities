# 1.5 "One Away:[...] Given two strings, write a function to check if they are
# one edit (or zero edits) away."
def one_away?(a, b)
  return false if (a.length - b.length).abs > 1
  return true if a == b

  delta_count = 0
  if a.length > b.length
    a = a[0..(b.length - 1)]
    delta_count += 1
  elsif b.length > a.length
    b = b[0..(a.length - 1)]
    delta_count += 1
  end

  a.split('').each_with_index do |a_char, i|
    b_char = b[i]
    delta_count += 1 if a_char != b_char
    return false if delta_count > 1
  end

  return true
end

# Assumptions:
# - Comparison should be case insensitive