require 'matrix'

module CoreExtensions
  module Matrix

    # Public: Rotate matrix (self) by 90 degrees.
    #
    # Examples
    #
    #   Matrix[[1,2,3],[4,5,6],[7,8,9]].rotate
    #   # => [[7,4,1],[8,5,2],[9,6,3]]
    #
    # Returns a Boolean value.
    def rotate
      ::Matrix.rows(self.transpose.to_a).to_a.each {|r| r.reverse!}
    end

    # Public: Destructive version of rotate.
    def rotate!
      self.rotate
      replace rotate
    end

  end
end
