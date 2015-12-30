# 1.2 "Check Permutation: Given two strings, write a method to decide if one
# is a permutation of the other."
def is_permutation?(first_string, second_string)
  unless first_string.is_a?(String) && second_string.is_a?(String)
    class_name = first_string.is_a?(String) ? second_string.class.name : first_string.class.name
    raise "Expected two string arguments but received #{class_name}"
  end

  first_string.downcase.count(second_string.downcase) > 0
end

# Assumptions:
# - Whitespace should be ignored
# - The method should be case insensitive
# - Empty strings should return false
# - Non-string datatypes should raise an exception