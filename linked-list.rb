require 'pry-byebug'
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
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

  def prepend(value)
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

  def size(next_node = @head, count = 0)
    if next_node == nil
      return count
    else
      count += 1
      size(next_node.next, count = count)
    end
  end


  def head
    @head
  end

  def tail
    @tail
  end

  def at(index, curr = 0, next_node = @head)
    if index == curr
      return next_node
    else
      curr += 1
      at(index, curr = curr, next_node.next)
    end
  end

  def pop
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
    (0...size).each do |i|
      if at(i).value == value
        return true
      elsif i == size - 1
        return false
      end
    end
  end 
  
  def find(value)
    (0...size).each do |i|
      if at(i).value == value
        return i
      elsif i == size - 1
        return nil
      end
    end
  end 

  #insert_at(value, index) that inserts a new node with the provided value at the given index.

  def insert_at(value, index)
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

  def remove_at(index)
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





# Extra Credit
#insert_at(value, index) that inserts a new node with the provided value at the given index.
#remove_at(index) that removes the node at the given index.
# Extra Credit Tip: When you insert or remove a node, consider how it will affect the existing nodes. Some of the nodes will need their #next_node link updated.

