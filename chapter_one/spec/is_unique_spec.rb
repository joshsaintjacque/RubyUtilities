require_relative '../is_unique'

describe "is_unique?" do
  it "returns true when provided a string of unique characters" do
    expect(is_unique?("abc")).to be true
  end

  it "returns false when provided a string of non-unique characters" do
    expect(is_unique?("aaa")).to be false
  end

  it "returns false when provided a string of non-unique characters regardless of order" do
    expect(is_unique?("abccde")).to be false
  end

  it "raises exception when provided a non-string datatype" do
    expect { is_unique?(123) }.to raise_error("Expected string and received Fixnum")
  end

  it "ignores whitespace characters" do
    expect(is_unique?("abc def ghi")).to be true
  end

  it "is case insensitive" do
    expect(is_unique?("AaBbCc")).to be false
  end

  it "returns true when provided an empty string" do
    expect(is_unique?("")).to be true
  end

  it "returns true when provided a single-character string" do
    expect(is_unique?("a")).to be true
  end
end