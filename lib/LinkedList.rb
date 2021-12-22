class LinkedList
  require_relative 'Node'
  def initialize
    @list = []
  end
  # append(value) adds a new node containing value to the end of the list

  def append(value)
    result = Node.new
    result.next_link = tail unless @list.empty?
    result.value = value
    @list.append(result)
    head.next_link = result if @list.size == 2
  end

  # prepend(value) adds a new node containing value to the start of the list
  def prepend(value)
    result = Node.new
    result.next_link = head unless @list.empty?
    result.value = value
    @list.unshift(result)
  end

  # size returns the total number of nodes in the list
  def size
    @list.length
  end

  # head returns the first node in the list
  def head
    @list[0]
  end

  # tail returns the last node in the list
  def tail
    @list[-1]
  end

  # returns the node at given index
  def at(index)
    @list[index]
  end

  # pop removes the last element from the list
  def pop
    @list.pop
  end

  # contains?(value) returns true if the passed in value is in the list and otherwise returns false
  def contains?(value)
    to_s.include?(value)
  end

  # find(value) returns the index of the node containing value, or nil if not found.
  def find(value)
    @list.find(value)
  end

  # to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. 
  # The format should be: ( value ) -> ( value ) - > ( value ) -> nil
  def to_s
    list_string = []
    @list.each { |value| list_string.append(value.value)}
    list_string
  end

  #### extra credit ####

  # insert_at(value, index) that inserts a new node with the provided value at the given index.
  def insert_at(value, index)
    return append(value) if index >= @list.size

    return prepend(value) if index.zero?

    result = Node.new
    result.next_link = @list[index - 1].next_link
    result.value = value
    @list[index].next_link = result
    @list.insert(index, result)
  end

  # remove_at(index) that removes the node at the given index
  def remove_at(index)
    return puts 'Value bigger than list size' if index > @list.size

    return pop if index == @list.size

    return prepend(value) if index.zero?

    @list[index-1].next_link = @list[index].next_link
    @list.delete_at(index)
  end
end

test = LinkedList.new
test.append('world')
test.append('Ruby')
test.append('linked lists')
test.prepend('Hello')
test.insert_at('!!!' , 2)
test.remove_at(2)
p test.contains?('world')
p test.at(2)
p test.to_s
