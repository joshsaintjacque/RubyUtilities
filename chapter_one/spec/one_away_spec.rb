require_relative '../one_away'

describe "one_away?" do
  it "returns false when input strings are more than one edit away" do
    expect(one_away?("abc", "def")).to be false
  end

  it "returns true when input strings are exactly one change away" do
    expect(one_away?("abc", "aec")).to be true
  end

  it "returns true when input strings are exactly one add or delete away" do
    expect(one_away?("abc", "ab")).to be true
  end

  it "returns true when input strings are identical" do
    expect(one_away?("abc", "abc")).to be true
  end
end