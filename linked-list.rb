
# LinkedList class, which will represent the full list.

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    #append(value) adds a new node containing value to the end of the list
    n = Node.new(value) 
    puts n
    if @head == nil
      @head = n
      @tail = n
    else
      @tail.next = n
      @tail = n
    end
  end

  def prepend(value)
    #prepend(value) adds a new node containing value to the start of the list
    n = Node.new(value) 
    puts n
    if @head == nil
      @head = n
      @tail = n
    else
      prev = @head
      @head = n
      n.next = prev
    end
  end

  def size(next_node = @head, count = 0)
    #size returns the total number of nodes in the list
    if next_node == nil
      return count
    else
      count += 1
      size(next_node.next, count = count)
    end
  end


  def head
    #head returns the first node in the list
    @head
  end

  def tail
    #tail returns the last node in the list
    @tail
  end

  def at(index, curr = 0, next_node = @head)
    #at(index) returns the node at the given index
    if index == curr
      return next_node
    else
      curr += 1
      at(index, curr = curr, next_node.next)
    end
  end

  def pop
    #pop removes the last element from the list
    if @head == nil
    else
      if size == 1 
        n = @head
        @head = nil
        @tail = nil
      return n
      else
      prev = at(size - 2)
      n = prev.next
      prev.next = nil
      @tail = prev
      return n
      end
    end
  end

  def contains?(value)
    #contains?(value) returns true if the passed in value is in the list and otherwise returns false.

  end

  def find(value)
    #find(value) returns the index of the node containing value, or nil if not found.

  end

  def to_s
    #to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil

  end

end


# Node class, containing a #value method and a link to the #next_node, set both as nil by default.
class Node
  attr_accessor :value, :next

  def initialize(data)
    @value = nil
    @next = nil
  end

end

list = LinkedList.new
list.append(3)
list.append(4)
list.prepend(2)
list.prepend(1)

list.pop


# ObjectSpace.each_object(Node){|v| p v}



# Extra Credit
#insert_at(value, index) that inserts a new node with the provided value at the given index.
#remove_at(index) that removes the node at the given index.
# Extra Credit Tip: When you insert or remove a node, consider how it will affect the existing nodes. Some of the nodes will need their #next_node link updated.
