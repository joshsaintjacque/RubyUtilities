require_relative '../urlify'

describe "urlify" do
  it "converts an English sentence to URL encoding" do
    unencoded_string = "Several of these characters should be converted to 'hex'"
    encoded_string = "Several%20of%20these%20characters%20should%20be%20converted%20to%20%22hex%22"
    expect(urlify(unencoded_string)).to eq(encoded_string)
  end

  it "returns a string with hex encoded characters" do
    expect(urlify(" '><#%{}|\\^~[]`")).to eq("%20%22%3C%3E%23%25%7B%7D%7C%5C%5E%7E%5B%5D%60")
  end

  it "raises exception when provided a non-string datatype" do
    expect { urlify(123) }.to raise_error("Expected a string argument but received Fixnum")
  end

  it "handles strings containing numeric values" do
    expect(urlify("123 456")).to eq("123%20456")
  end
end