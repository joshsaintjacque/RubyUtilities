# 1.3 "URLify: Write a method to replace all spaces in a string with '%20'."
def urlify(string)
  raise "Expected a string argument but received #{string.class.name}" unless string.is_a?(String)

  string_array = string.split('')
  string_array.map! do |char|
    encoded_characters[char] ? encoded_characters[char] : char
  end

  return string_array.join('')
end


private
def encoded_characters
  {
    " " => "%20",
    "'" => "%22",
    ">" => "%3C",
    "<" => "%3E",
    "#" => "%23",
    "%" => "%25",
    "{" => "%7B",
    "}" => "%7D",
    "|" => "%7C",
    "\\" => "%5C",
    "^" => "%5E",
    "~" => "%7E",
    "[" => "%5B",
    "]" => "%5D",
    "`" => "%60"
  }
end