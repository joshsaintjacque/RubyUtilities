module CoreExtensions
  module String

    # Public: Decide if one string is a permutation of the other.
    #
    # string  - The String to be checked against self.
    #
    # Examples
    #
    #   "abc".is_permutation? "cba"
    #   # => true
    #
    # Returns a Boolean value.
    def is_permutation?(string)
      unless string.is_a?(String)
        raise "CoreExtension::String Expected string argument, received "\
        "#{string.class.name}"
      end
      downcase.count(string.downcase) > 0
    end

    # Public: check if self is any permutation of a palindrome. Ignores
    # whitespace.
    #
    # Examples
    #
    #   "carrace".palindrome_permutation?
    #   # => true
    #
    # Returns a Boolean value.
    def palindrome_permutation?
      normalized_string = downcase.gsub(/\s+/, "")
      return true if normalized_string.length <= 1

      char_frequency = Hash.new(0)
      normalized_string.each_char do |char|
        char_frequency[char] += 1
      end

      # Palindromes contain fewer than two characters with an odd count
      char_frequency.count{|k,v| v.odd?} < 2
    end

    # Public: Determine if a string is comprised of entirely unique characters.
    # Ignores spaces.
    #
    # Examples
    #
    #   "abc def ghi".is_unique?
    #   # => true
    #
    # Returns a Boolean value.
    def is_unique?
      return true if length <= 1
      uniform_string = gsub(" ", "").downcase
      sorted_string = uniform_string.chars.sort.join

      previous_char = ""
      sorted_string.each_char do |char|
        return false if char == previous_char
        previous_char = char
      end
      return true
    end

    # Public: Check if string is one or zero edits away from self.
    #
    # string  - The String to be compared to self.
    #
    # Examples
    #
    #   "ruby on rails".one_away? "ruby in rails"
    #   # => true
    #
    #   "ruby on rails".one_away? "ruby on ales"
    #   # => false
    #
    # Returns a Boolean value.
    def one_away?(b)
      a = self
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

    # Public: Check if string is a rotated version of self.
    #
    # string  - The String to be compared to self.
    #
    # Examples
    #
    #   "waterbottle".rotation? "erbottlewat"
    #   # => true
    #
    # Returns a Boolean value.
    def rotation?(string)
      (string * 2).include? self
    end

    # Public: Replace characters in self with hex-encoded values (typically
    # used in a URL).
    #
    # Examples
    #
    #   "Several of these characters should be converted to 'hex'".urlify
    #   # => "Several%20of%20these%20characters%20should%20be%20converted%20to%20%22hex%22"
    #
    # Returns a URL-friendly String value.
    def urlify
      encoded_string = split('').map do |char|
        encoded_characters[char] ? encoded_characters[char] : char
      end

      return encoded_string.join('')
    end

    # Public: Destructive version of urlify.
    def urlify!
      self.urlify
      replace urlify
    end


    private
    # Internal: A hash table of hex-encoded characters.
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

  end
end