# 1.4 "Palindrome Permutation: Given a string, write a function to check if it
# is a permutation of a palindrome[...] The palindrome does not need to be
# limited to just dictionary words."
def palindrome_permutation?(string)
  normalized_string = string.downcase.gsub(/\s+/, "")
  return true if normalized_string.length <= 1

  char_frequency = Hash.new(0)
  normalized_string.each_char do |char|
    char_frequency[char] += 1
  end

  # Palindromes contain fewer than two characters with an odd count
  char_frequency.count{|k,v| v.odd?} < 2
end

# Assumptions:
# - Whitespace should be ignored
# - The method should be case insensitive
# - Empty and single character strings should return true
# - Non-string datatypes should raise an exception