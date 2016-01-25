# 1.8 ""
def zero(matrix)
  return matrix unless matrix.flatten.detect {|m| m.zero?}

  columns_with_zeros = []
  matrix.each_with_index do |row, col|
    if row.include? 0
      row.map! {0}
      columns_with_zeros.push(col)
    end
  end

  matrix.each do |r|
    columns_with_zeros.each { |c| r[c] = 0 }
  end

  return matrix
end