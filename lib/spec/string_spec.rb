require_relative '../core_extensions/string/string.rb'
String.include CoreExtensions::String

describe "is_permutation?" do
  it "returns true when provided a string containing the same characters" do
    expect("abc".is_permutation? "cba").to be true
  end

  it "returns false when provided a string that is not a permutation" do
    expect("abc".is_permutation? "def").to be false
  end

  it "raises exception when provided a non-string datatype" do
    expected_error = "CoreExtension::String Expected string argument, "\
                     "received Fixnum"
    expect {"abc".is_permutation? 123}.to raise_error(expected_error)
  end

  it "ignores whitespace characters" do
    expect("abc def ghi".is_permutation? "abcdefghi").to be true
  end

  it "is case insensitive" do
    expect("ABC".is_permutation? "cba").to be true
  end

  it "returns false when provided an empty string" do
    expect("anything".is_permutation? "").to be false
  end
end

describe "is_unique?" do
  it "returns true when run on a string of unique characters" do
    expect("abc".is_unique?).to be true
  end

  it "returns false when run on a string of non-unique characters" do
    expect("aaa".is_unique?).to be false
  end

  it "ignores order" do
    expect("abccde".is_unique?).to be false
  end

  it "ignores whitespace characters" do
    expect("abc def ghi".is_unique?).to be true
  end

  it "is case insensitive" do
    expect("AaBbCc".is_unique?).to be false
  end

  it "returns true when run on an empty string" do
    expect("".is_unique?).to be true
  end

  it "returns true when run on a single-character string" do
    expect("a".is_unique?).to be true
  end
end

describe "one_away?" do
  it "returns false when strings are more than one edit away" do
    expect("abc".one_away? "def").to be false
  end

  it "returns true when strings are exactly one change away" do
    expect("abc".one_away? "aec").to be true
  end

  it "returns true when strings are exactly one add or delete away" do
    expect("abc".one_away? "ab").to be true
  end

  it "returns true when input strings are identical" do
    expect("abc".one_away? "abc").to be true
  end
end

describe "palindrome_permutation?" do
  it "returns false when not given a permutation of a palindrome" do
    expect("abc".palindrome_permutation?).to be false
  end

  it "returns true when given a palindrome" do
    expect("racecar".palindrome_permutation?).to be true
  end

  it "returns true when given a permuation of a palindrome" do
    expect("carrace".palindrome_permutation?).to be true
  end

  it "ignores whitespace" do
    expect("race car".palindrome_permutation?).to be true
  end

  it "is case insensitive" do
    expect("rAcecaR".palindrome_permutation?).to be true
  end
end

describe "rotation?" do
  it "returns true when one string is a rotated version of the other" do
    expect("waterbottle".rotation? "erbottlewat").to eq(true)
  end

  it "returns false when one string is not a rotation of the other" do
    expect("racecar".rotation? "spring").to eq(false)
  end
end

describe "urlify" do
  it "converts an English sentence to URL encoding" do
    unencoded_string = "Several of these characters should be converted to 'hex'"
    encoded_string = "Several%20of%20these%20characters%20should%20be%20converted%20to%20%22hex%22"
    expect(unencoded_string.urlify).to eq(encoded_string)
  end

  it "returns a string with hex encoded characters" do
    expect(" '><#%{}|\\^~[]`".urlify).to eq("%20%22%3C%3E%23%25%7B%7D%7C%5C%5E%7E%5B%5D%60")
  end

  it "handles strings containing numeric values" do
    expect("123 456".urlify).to eq("123%20456")
  end
end
