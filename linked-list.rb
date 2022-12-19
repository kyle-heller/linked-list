# LinkedList class, which will represent the full list.
Class LinkedList

  def append(value)
    #append(value) adds a new node containing value to the end of the list
  end

  def prepend(value)
    #prepend(value) adds a new node containing value to the start of the list

  end

  def size
    #size returns the total number of nodes in the list

  end

  def head
    #head returns the first node in the list

  end

  def tail
    #tail returns the last node in the list

  end

  def at(index)
    #at(index) returns the node at the given index

  end

  def pop
    #pop removes the last element from the list

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
Class Node

end


# Extra Credit
#insert_at(value, index) that inserts a new node with the provided value at the given index.
#remove_at(index) that removes the node at the given index.
# Extra Credit Tip: When you insert or remove a node, consider how it will affect the existing nodes. Some of the nodes will need their #next_node link updated.
