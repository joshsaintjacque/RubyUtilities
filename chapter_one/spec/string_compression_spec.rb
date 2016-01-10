require_relative '../string_compression'

describe "compress" do
  it "returns a compressed string when provided an uncompressed string" do
    expect(compress("aabcccaaa")).to eq("a2b1c3a3")
  end

  it "handles mixed-case strings" do
    expect(compress("aaaBBcccccAA")).to eq("a3B2c5A2")
  end

  it "returns the original string when the compressed string is longer" do
    expect(compress("abc")).to eq("abc")
  end
end