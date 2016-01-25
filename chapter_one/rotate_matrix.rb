# 1.7 "Rotate Matrix: Given an image represented by an NxN matrix, where each
# pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees."
def rotate(matrix)
  rotated_matrix = []

  while matrix.first.any?
    new_row = matrix.reverse.map {|row| row.pop}
    rotated_matrix.push(new_row)
  end

  return rotated_matrix.reverse!
end

# Assumptions:
# - Comparison should be case sensitive