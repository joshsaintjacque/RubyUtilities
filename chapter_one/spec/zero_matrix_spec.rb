require_relative '../zero_matrix'

describe "zero" do
  it "returns an unchanged matrix when it contains no zeros" do
    expect(zero([[1,2,3],[4,5,6],[7,8,9]])).to eq([[1,2,3],[4,5,6],[7,8,9]])
  end

  it "returns a matrix where all rows and columns containing a zero are replaced with zeros" do
    expect(zero([[1,2,3],[4,0,6],[7,8,9]])).to eq([[1,0,3],[0,0,0],[7,0,9]])
  end

  it "handles matrices with multiple zeros" do
    expect(zero([[1,2,3],[4,0,6],[7,8,0]])).to eq([[1,0,0],[0,0,0],[0,0,0]])
  end
end