require_relative '../linked_list/linked_list.rb'

describe LinkedList do
  before(:each) do
    @node1 = Node.new 42
    @node2 = Node.new "Stuff"
    @node3 = Node.new [1, 2, 3]
    @node1.next = @node2
    @node2.next = @node3
    @list = LinkedList.new
    @list.unshift @node2
    @list.unshift @node1
  end

  it "creates a new node" do
    expect(@node1.value).to eq(42)
  end

  it "creates a new linked list" do
    expect(@list.is_a? LinkedList).to be true
  end

  it "adds a node to the beginning of the list" do
    @list.unshift @node3
    expect(@list.head).to eq(@node3)
  end

  it "adds a node to the end of the list" do
    @list.push @node3
    expect(@list.tail).to eq(@node3)
  end

  it "removes a node from the top of the list" do
    @list.shift
    expect(@list.head).to eq(@node2)
  end
end