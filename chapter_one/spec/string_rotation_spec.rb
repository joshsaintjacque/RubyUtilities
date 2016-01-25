require_relative '../string_rotation'

describe "rotation?" do
  it "returns true when one string is a rotated version of the other" do
    expect(rotation? "waterbottle", "erbottlewat").to eq(true)
  end

  it "returns false when one string is not a rotation of the other" do
    expect(rotation? "racecar", "spring").to eq(false)
  end
end