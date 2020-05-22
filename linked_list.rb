require_relative "node.rb"

class LinkedList
    
    attr_accessor :size, :head, :tail
    def initialize
         @head = nil
         @tail = nil
         @size = 0
    end

    def append(value)
        node_to_add = Node.new(value)
        if @head.nil?
            @head = node_to_add
        else
            @tail.next_node = node_to_add
        end

        @tail = node_to_add
        @size += 1
    end

    def prepend(value)
        node_to_add = Node.new(value, @head)
        @head = node_to_add
        @size += 1
    end

    def size
        @size
    end

    def head
        @head
    end

    def tail
        @tail
    end

    def at(index)
        return @head if index == 0
        return nil if index > (@size - 1)
        check = @head
        i = index - 1
        i.times do 
            check = check.next_node
        end
        check.value
    end

    def pop
        if !head.next_node.nil?
            check = @head
            i = @size - 2
            i.times do
                check = check.next_node
            end
            check.next_node = nil
            @tail = check
            @size -= 1
        end
    end

    def contains?(value)
        check = @head
        @size.times do
            if check.value == value
                return true
            end
            check = check.next_node
        end
        return false
    end

    def find(value)
        if self.contains?(value)
            i = 0
            check = @head
            @size.times do
                i += 1
                if check.value == value
                    return i
                end
                check = check.next_node
            end
        else
            return -1
        end
    end

    def to_s
        check = @head
        str = ""
        @size.times do
            str += "( #{check.value} ) -> "
            check = check.next_node
        end
        str += "nil"
        str
    end
end