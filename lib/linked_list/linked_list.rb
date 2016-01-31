class LinkedList
  require_relative 'node'
  include Enumerable
  attr_reader :head, :tail

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
  #   list.unshift node
  #   => <Node:0x007fce12a9ee70 @value=1, @next=#<Node:0x007fce12a8d170 @value=2, @next=nil>>
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

  # Public: Removes duplicate values from the link list it is called on.
  # Destructive.
  #
  # Examples
  #
  #   list.remove_dups
  #
  # Returns nothing.
  def remove_dups
    unique_values = []
    while head
      node = shift
      value = node.value
      unique_values << value unless unique_values.include? value
    end
    unique_values.each {|value| unshift(Node.new(value))}
    return self
  end
end