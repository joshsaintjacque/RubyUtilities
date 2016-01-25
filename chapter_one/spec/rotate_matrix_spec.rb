require_relative '../rotate_matrix'

describe "rotate" do
  it "returns a rotated array when passed a valid set" do
    expect(rotate([[1,2,3],[4,5,6],[7,8,9]])).to eq([[7,4,1],[8,5,2],[9,6,3]])
  end
end