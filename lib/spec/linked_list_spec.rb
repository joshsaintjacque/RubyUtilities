require_relative '../linked_list/linked_list.rb'
require 'pp'

describe LinkedList do
  before(:each) do
    @node1 = Node.new 42
    @node2 = Node.new "Stuff"
    @node3 = Node.new [1, 2, 3]
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

  it "removes duplicate node values from a list" do
    @list.push Node.new 42
    @list.remove_dups
    expect(@list.head.value).not_to eq(@list.head.next.value)
  end

  it "traverses a list" do
    @list.push Node.new 42
    expect(@list.traverse(2).value).to eq(42)
  end

  it "returns the length of the list" do
    expect(@list.length).to eq(2)
  end
end