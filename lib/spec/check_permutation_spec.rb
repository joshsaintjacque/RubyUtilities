require_relative '../check_permutation'

describe "is_permutation?" do
  it "returns true when provided two strings containing the same characters" do
    expect(is_permutation?("abc", "cba")).to be true
  end

  it "returns false when provided two strings that are not permutations of each other" do
    expect(is_permutation?("abc", "def")).to be false
  end

  it "raises exception when provided a non-string datatype" do
    expect { is_permutation?(123, "abc") }.to raise_error("Expected two string arguments but received Fixnum")
  end

  it "ignores whitespace characters" do
    expect(is_permutation?("abc def ghi", "abcdefghi")).to be true
  end

  it "is case insensitive" do
    expect(is_permutation?("ABC", "cba")).to be true
  end

  it "returns false when provided an empty string" do
    expect(is_permutation?("", "")).to be false
  end
end