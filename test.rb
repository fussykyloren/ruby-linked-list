require_relative "linked_list.rb"

list = LinkedList.new

list.append("43")
p list.to_s
list.append("2")
p list.to_s
list.prepend("5")
p list.to_s

p "Size: #{list.size}"
p "Head: #{list.head.value}, #{list.head.next_node.value}"
puts "Tail: #{list.tail.value}"

node_1 = list.at(1)
p "Node 1 Value: #{node_1.value}"

list.pop
p list.to_s

p list.contains?("2")

list.insert_at("1", 2)
p list.to_s
list.remove_at(2)
p list.to_s