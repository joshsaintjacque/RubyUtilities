# 1.1 "Is Unique: Implement an algorithm to determine if a string has all
# unique characters. What if you cannot use additional datatypes?"
def is_unique?(string)
  unless string.is_a?(String)
    raise "Expected string and received #{string.class.name}"
  end
  return true if string.length <= 1
  uniform_string = string.gsub(" ", "").downcase
  sorted_string = uniform_string.chars.sort.join

  previous_char = ""
  sorted_string.each_char do |char|
    return false if char == previous_char
    previous_char = char
  end
  return true
end

# Assumptions:
# - Whitespace should be ignored
# - The method should be case insensitive
# - Empty and single character strings should return true
# - Non-string datatypes should raise an exception