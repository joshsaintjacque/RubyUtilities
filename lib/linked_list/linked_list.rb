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
  #   => #<Node:0x007fce12a9ee70 @value=1, @next=...
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
  #   list.shift
  #   # => #<Node:0x007fce12a9ee70 @value=1, @next=...
  #
  # Returns Node object.
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
  #   list.push node
  #   # => #<Node:0x007fce12a9ee70 @value=1, @next=...
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

  # Public: Returns the ith node in the list from head, where 0 is the head.
  #
  # i  - The index to be returned.
  #
  # Examples
  #
  #   list.traverse 2
  #   => #<Node:0x007fce12a9ee70 @value=1, @next=...
  #
  # Returns ith Node object.
  def traverse(i)
    return nil if head.nil?
    node = head
    i.times { node = node.next }
    return node
  end

  # Public: Partitions a linked list such that all values less than k are
  # placed before all node values equal to and greater than k in the list.
  # Destructive.
  #
  # k  - The value to be partitioned on.
  #
  # Examples
  #
  #   list.partition 5
  #   => #<Node:0x007fce12a9ee70 @value=1, @next=...
  #
  # Returns a LinkedList object.
  def partition(k)

  end
end