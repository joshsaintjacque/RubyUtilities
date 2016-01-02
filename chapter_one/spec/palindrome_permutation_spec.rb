require_relative '../palindrome_permutation'

describe "palindrome_permutation?" do
  it "returns false when not given a permutation of a palindrome" do
    expect(palindrome_permutation?("abc")).to be false
  end

  it "returns true when given a palindrome" do
    expect(palindrome_permutation?("racecar")).to be true
  end

  it "returns true when given a permuation of a palindrome" do
    expect(palindrome_permutation?("carrace")).to be true
  end

  it "ignores whitespace" do
    expect(palindrome_permutation?("race car")).to be true
  end

  it "is case insensitive" do
    expect(palindrome_permutation?("rAcecaR")).to be true
  end
end