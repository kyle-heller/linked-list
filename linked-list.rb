require 'pry-byebug'
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value) #adds a new node containing value to the end of the list
    n = Node.new(value) 
    puts n
    if @head == nil
      n.value = value
      @head = n
      @tail = n
    else
      n.value = value
      @tail.next = n
      @tail = n
    end
  end

  def prepend(value) #adds a new node containing value to the start of the list
    n = Node.new(value) 
    puts n
    if @head == nil
      n.value = value
      @head = n
      @tail = n
    else
      n.value = value
      prev = @head
      @head = n
      n.next = prev
    end
  end

  def size(next_node = @head, count = 0) #returns the total number of nodes in the list
    if next_node == nil
      return count
    else
      count += 1
      size(next_node.next, count = count)
    end
  end


  def head #returns the first node in the list
    @head
  end

  def tail #returns the last node in the list
    @tail
  end

  def at(index, curr = 0, next_node = @head) #returns the node at the given index
    if index == curr
      return next_node
    else
      curr += 1
      at(index, curr = curr, next_node.next)
    end
  end

  def pop #removes the last element from the list
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

  def contains?(value) #returns true if the passed in value is in the list and otherwise returns false.
    (0...size).each do |i|
      if at(i).value == value
        return true
      elsif i == size - 1
        return false
      end
    end
  end 
  
  def find(value) #returns the index of the node containing value, or nil if not found.
    (0...size).each do |i|
      if at(i).value == value
        return i
      elsif i == size - 1
        return nil
      end
    end
  end 


  def insert_at(value, index) #inserts a new node with the provided value at the given index.
    n = Node.new(value)
    n.value = value 
    toright = at(index)
    n.next = toright
    if (index - 1) >= 0
      toleft = at(index - 1)
      toleft.next = n
    else @head = n
    end
    if (index == (size - 1))
      @tail = n
    end
  end

  def remove_at(index) #that removes the node at the given index.
    toright = at(index + 1)
    if (index - 1) >= 0
      toleft = at(index - 1)     
      toleft.next = toright
    else @head = toright
    end
    if (index == (size - 1))
      @tail = toleft
    end
  end


  def to_s
    (0...size).each do |i|
      print "( #{at(i).value} ) -> "
      if at(i).next == nil
        print "nil\n"
      end
    end
  end
    

end


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

list.remove_at(4)

puts list
