class LinkedList
  include Enumerable

  def initialize
    @head = nil
    @tail = nil
  end

  # Public: Places a node at the beginning of a linked list.
  #
  # node  - The Node to be added.
  #
  # Examples
  #
  #   "abc".is_permutation? "cba"
  #   # => true
  #
  # Returns nothing.
  def unshift(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next = @head
      @head = node
    end
  end

  # Public: Removes and returns the first node in a linked list.
  #
  # Examples
  #
  #   "abc".is_permutation? "cba"
  #   # => true
  #
  # Returns nothing.
  def shift
    return nil if @head.nil?
    node = @head
    @head = @head.next
    return node
  end

  # Public: Places a node at the end of a linked list.
  #
  # node  - The Node to be added.
  #
  # Examples
  #
  #   "abc".is_permutation? "cba"
  #   # => true
  #
  # Returns nothing.
  def push(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  # Public: Successively yields each node in a linked list.
  #
  # Examples
  #
  #   "abc".is_permutation? "cba"
  #   # => true
  #
  # Returns nothing.
  def each
    return nil if @head.nil?
    node = @head
    until entry.nil?
      yield entry
      node = node.next
    end
  end
end