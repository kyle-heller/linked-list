class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
    end
    #if not the first item in the list, previous item should point to new node as next_node
    if @tail
      @tail.next_node = node
    end
    @tail = node
  end

  #prepend(value) adds a new node containing value to the start of the list
  def prepend(value)
    if @head.nil?
      append(value)
    else
      node = Node.new(value)
      node.next_node = @head
      @head = node
    end
  end

  #size returns the total number of nodes in the list
  def size
    return 0 unless @head
    count = 1
    current_node = @head
    until current_node == @tail
      current_node = current_node.next_node
      count += 1
    end
    count
  end

  #at(index) returns the node at the given index
  def at(index)
    current_node = @head
    index.times do 
      if current_node.next_node.nil?
        current_node = nil
      else
        current_node = current_node.next_node
      end
    end
    current_node
  end

  def pop
    return nil if @head.nil?
    new_tail_index = self.size - 2
    new_tail = self.at(new_tail_index)
    if @head == @tail
      @head = nil
      @tail = nil
    else
      @tail = new_tail
      @tail.next_node = nil
    end
  end

  def contains?(value)
    self.size.times do |i|
      new_tail = self.at(i)
      if new_tail && new_tail.value == value 
        return true
      end
    end
    false
  end

  #find(value) returns the index of the node containing value, or nil if not found.
  def find(value)
    self.size.times do |i|
      new_tail = self.at(i)
      if new_tail.value == value 
        return i
      end
    end
    nil
  end

  #insert_at(value, index) that inserts a new node with the provided value at the given index.
  def insert_at(value, index)
    old_node = self.at(index)
    if head.nil?
      new_node = Node.new(value, old_node)
      @head = new_node
      @tail = new_node
    elsif index == 0
      @head = new_node = Node.new(value, old_node)
    elsif index == self.size - 1
      node_before_index = self.at(index - 1)
      new_node = Node.new(value, old_node)
      node_before_index.next_node = new_node
      @tail = old_node
    else
      node_before_index = self.at(index - 1)
      new_node = Node.new(value, old_node)
      node_before_index.next_node = new_node
    end
  end

  #remove_at(index) that removes the node at the given index.
  def remove_at(index)
    node_to_remove = self.at(index)
    unless @head.nil?
      if index == 0
        @head = node_to_remove.next_node
      elsif index == self.size - 1
        node_before_index = self.at(index - 1)
        @tail = node_before_index
      else
        node_before_index = self.at(index - 1)
        node_before_index.next_node = node_to_remove.next_node
      end
    end
  end

  def to_s
    return "empty list" unless @head
    current_node = @head
    list_string = "( #{current_node.value} )"
    while current_node != @tail
      current_node = current_node.next_node
      list_string += " -> ( #{current_node.value} )"
    end
    list_string += " -> nil\n\n"
    return list_string
  end
end
